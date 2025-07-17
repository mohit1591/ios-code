//
//  Encyption.swift
//  SouleAce
//
//  Created by Hitexa Kakadiya on 10/06/24.
//

import Foundation
import UIKit
import CommonCrypto


class Encryption {
    private init() {}
    static let shared = Encryption()
    
    //New
    func generateMac(sKey: Data, iv: String, encryptedVal: String) -> String? {
        let msg = iv + encryptedVal
        guard let msgData = msg.data(using: .utf8) else { return nil }

        var hmac = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        sKey.withUnsafeBytes { keyBytes in
            msgData.withUnsafeBytes { msgBytes in
                CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA256), keyBytes.baseAddress, sKey.count, msgBytes.baseAddress, msgData.count, &hmac)
            }
        }

        let hmacData = Data(hmac)
        return hmacData.map { String(format: "%02hhx", $0) }.joined()
    }
    func generateIv() -> Data? {
        var iv = Data(count: kCCBlockSizeAES128)
        let result = iv.withUnsafeMutableBytes { ivBytes in
            SecRandomCopyBytes(kSecRandomDefault, kCCBlockSizeAES128, ivBytes.baseAddress!)
        }
        return result == errSecSuccess ? iv : nil
    }
    func encryptData(key: Data, iv: Data, rawData: String) -> Data? {
        guard let data = rawData.data(using: .utf8) else { return nil }

        let cryptLength = size_t(iv.count + data.count + kCCBlockSizeAES128)
        var cryptData = Data(count: cryptLength)
        
        var numBytesEncrypted: size_t = 0

        let cryptStatus = cryptData.withUnsafeMutableBytes { cryptBytes in
            data.withUnsafeBytes { dataBytes in
                iv.withUnsafeBytes { ivBytes in
                    key.withUnsafeBytes { keyBytes in
                        CCCrypt(
                            CCOperation(kCCEncrypt),
                            CCAlgorithm(kCCAlgorithmAES128),
                            CCOptions(kCCOptionPKCS7Padding),
                            keyBytes.baseAddress, kCCKeySizeAES256,
                            ivBytes.baseAddress,
                            dataBytes.baseAddress, data.count,
                            cryptBytes.baseAddress, cryptLength,
                            &numBytesEncrypted
                        )
                    }
                }
            }
        }

        guard cryptStatus == kCCSuccess else { return nil }

        cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)
        return cryptData
    }
    func encryptImplementation(key: String, plaintext: String) -> String? {
        guard let decodedKey = Data(base64Encoded: key), let iv = generateIv() else { return nil }
        guard let encryptedData = encryptData(key: decodedKey, iv: iv, rawData: plaintext) else { return nil }

        let ivString = iv.base64EncodedString()
        let encryptedValue = encryptedData.base64EncodedString()
        
        guard let mac = generateMac(sKey: decodedKey, iv: ivString, encryptedVal: encryptedValue) else { return nil }

        let jsonObject: [String: Any] = ["iv": ivString, "value": encryptedValue, "mac": mac]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []) else { return nil }
        
        return jsonData.base64EncodedString()
    }
    // Helper function to decode Base64 string to Data
    func decodeStringToData(_ string: String) -> Data? {
        return Data(base64Encoded: string)
    }

    // Helper function to encode Data to Base64 string
    func encodeDataToString(_ data: Data) -> String {
        return data.base64EncodedString()
    }
}

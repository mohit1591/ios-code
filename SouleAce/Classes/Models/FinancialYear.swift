//
//  Finance.swift
//  SouleAce
//
//  Created by ideveloper7 on 13/02/24.
//

import Foundation

struct FinancialYear : Codable {
    let success : Bool?
    let data : [FinancialYearData]?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent([FinancialYearData].self, forKey: .data)
    }

}

struct FinancialYearData : Codable {
    let financialYearId : Int?
    let financialYear : String?

    enum CodingKeys: String, CodingKey {

        case financialYearId = "financial_year_id"
        case financialYear = "financial_year"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        financialYearId = try values.decodeIfPresent(Int.self, forKey: .financialYearId)
        financialYear = try values.decodeIfPresent(String.self, forKey: .financialYear)
    }

}

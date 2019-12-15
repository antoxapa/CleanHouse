//
//  CompanyData.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/5/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import Foundation

public struct CompanyData: Decodable {
    let name : String
    let rating: String
    let phone : String
    let company : Company
    let photo: String?
}

public struct Company: Decodable {
    let name: String
    let logo: String?
    let companyRating: String?
    let about: String
}

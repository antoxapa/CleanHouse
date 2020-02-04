//
//  CompanyData.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/5/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import Foundation

struct CompanyData: Decodable {
    let name: String?
    let logo: String?
    let description: String?
    let about: String?
    let reviews: [Reviews]?
    let workers: [Workers]?
}
struct Reviews: Decodable {
    let id: String?
    let user: String?
    let title: String?
    let date: String?
    let rating: String?
    let text: String?
}
struct Workers: Decodable {
    let id: String?
    let name: String?
    let photo: String?
}

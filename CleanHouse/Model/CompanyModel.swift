//
//  CompanyModel.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 1/11/20.
//  Copyright © 2020 TonyPo Production. All rights reserved.
//

import RealmSwift

class CompanyRealm: Object{
    @objc dynamic var companyName: String?
    @objc dynamic var companyDescription: String?
    @objc dynamic var companyLogo: String?
    @objc dynamic var companyRating: String?
    @objc dynamic var aboutCompany: String?

    convenience init(companyName: String, companyDescription: String?, companyLogo: String?, companyRating: String?, aboutCompany: String?) {
        self.init()
        self.companyName = companyName
        self.companyDescription = companyDescription
        self.companyLogo = companyLogo
        self.companyRating = companyRating
        self.aboutCompany = aboutCompany
    }
}


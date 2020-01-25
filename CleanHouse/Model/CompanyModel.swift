//
//  CompanyModel.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 1/11/20.
//  Copyright © 2020 TonyPo Production. All rights reserved.
//

import RealmSwift

class CompanyRealm: Object {
    
    @objc dynamic var companyName: String?
    @objc dynamic var companyDescription: String?
    @objc dynamic var companyLogo: String?
    @objc dynamic var aboutCompany: String?
    
    
    @objc dynamic var reviewUserID: String?
    @objc dynamic var reviewUser: String?
    @objc dynamic var reviewTitle: String?
    @objc dynamic var reviewDate: String?
    @objc dynamic var reviewRating: String?
    @objc dynamic var reviewText: String?
    
    @objc dynamic var idWorker: String?
    @objc dynamic var workerName: String?
    @objc dynamic var workerPhoto: String?

    convenience init(companyName: String, companyDescription: String?, companyLogo: String?, aboutCompany: String?, reviewUserID: String?, reviewUser: String?, reviewTitle: String?, reviewDate: String?, reviewRating: String?, reviewText: String?, reviewWorkerID: String?, reviewWorkerName: String?, reviewWorkerPhoto: String?) {
        self.init()
        self.companyName = companyName
        self.companyDescription = companyDescription
        self.companyLogo = companyLogo
        self.aboutCompany = aboutCompany
        
        self.reviewUserID = reviewUserID
        self.reviewUser = reviewUser
        self.reviewTitle = reviewTitle
        self.reviewDate = reviewDate
        self.reviewRating = reviewRating
        self.reviewText = reviewText
        print(reviewRating)
        self.idWorker = idWorker
        self.workerName = reviewWorkerName
        self.workerPhoto = reviewWorkerPhoto

    }
}


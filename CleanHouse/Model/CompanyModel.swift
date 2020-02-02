//
//  CompanyModel.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 1/11/20.
//  Copyright © 2020 TonyPo Production. All rights reserved.
//

import RealmSwift

class ReviewsRealm: Object {
    @objc dynamic var reviewUserID: String?
    @objc dynamic var reviewUser: String?
    @objc dynamic var reviewTitle: String?
    @objc dynamic var reviewDate: String?
    @objc dynamic var reviewRating: String?
    @objc dynamic var reviewText: String?
    
    convenience init(reviewUserID: String?, reviewUser: String?, reviewTitle: String?, reviewDate: String?, reviewRating: String?, reviewText: String? ) {
        self.init()
        self.reviewUserID = reviewUserID
        self.reviewUser = reviewUser
        self.reviewTitle = reviewTitle
        self.reviewDate = reviewDate
        self.reviewRating = reviewRating
        self.reviewText = reviewText
    }
}

class WorkersRealm: Object {
    @objc dynamic var idWorker: String?
    @objc dynamic var workerName: String?
    @objc dynamic var workerPhoto: String?
    
    convenience init(idWorker: String?, workerName: String?, workerPhoto: String?){
        self.init()
        self.idWorker = idWorker
        self.workerName = workerName
        self.workerPhoto = workerPhoto
    }
}

class CompanyRealm: Object {
    
    @objc dynamic var companyName: String?
    @objc dynamic var companyDescription: String?
    @objc dynamic var companyLogo: String?
    @objc dynamic var aboutCompany: String?
    
    
        convenience init(companyName: String, companyDescription: String?, companyLogo: String?, aboutCompany: String?) {
            self.init()
            self.companyName = companyName
            self.companyDescription = companyDescription
            self.companyLogo = companyLogo
            self.aboutCompany = aboutCompany
        }
}
class CompaniesRealm: Object {
    let company = List<CompanyRealm>()
    let reviews = List<ReviewsRealm>()
    let workers = List<WorkersRealm>()
    
    convenience init(company: CompanyRealm, reviews: ReviewsRealm, workers: WorkersRealm) {
               self.init()
        self.company.append(company)
        self.reviews.append(reviews)
        self.workers.append(workers)
    }
}

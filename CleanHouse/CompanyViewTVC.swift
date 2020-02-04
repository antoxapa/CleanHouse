//
//  companyViewCell.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/29/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit
import Cosmos

class CompanyViewTVC: UITableViewCell {
    
    
    // MARK: - CompanyView
    @IBOutlet weak var companyLogo: UIImageView! {
        didSet {
            companyLogo.layer.cornerRadius = 25
            companyLogo.layer.masksToBounds = true
            companyLogo.layer.borderWidth = 0.25
            companyLogo.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        }
    }
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var aboutCompany: UILabel!
    @IBOutlet weak var callButton: UIButton! {
        didSet {
            callButton.layer.cornerRadius = 12
            callButton.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var mainRatingView: CosmosView! {
        didSet {
            mainRatingView.settings.updateOnTouch = false
        }
    }
    @IBOutlet weak var mainRatingLabel: UILabel!
    
    func setupRating(company: CompanyRealm?) {
        var ratingArray = [Double]()
        if let reviewsList = company?.reviews {
            for item in reviewsList {
                guard let rating = item.reviewRating else { return mainRatingLabel.isHidden = true }
                if let doubleRating = Double(rating) {
                    ratingArray.append(doubleRating)
                }
            }
            let sum = ratingArray.reduce(0,+)
            mainRatingView.rating = sum / Double(ratingArray.count)
            mainRatingLabel.text = String(format: "%.1f", (sum / Double(ratingArray.count)))
        } else {
            mainRatingLabel.isHidden = true
        }
    }
    
    func setupCell(company: CompanyRealm?) {
        
        companyName.text = company?.companyName
        aboutCompany.text = company?.companyDescription
    }
}

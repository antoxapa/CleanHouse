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
    
    func setupRating(rating: String) {
        guard let doubleRating = Double(rating) else { return }
        let roundedRating = round(doubleRating * 10) / 10
        mainRatingView.rating = roundedRating
        mainRatingLabel.text = roundedRating.description
    }
    
    func setupCell(company: CompanyRealm?) {
        self.companyName.text = company?.companyName
        self.aboutCompany.text = company?.companyDescription
        
        if let rating = company?.reviewRating {
            if rating != "" {
                let doubleRating = Double(rating)
                mainRatingView.rating = doubleRating!
                mainRatingLabel.isHidden = false
                mainRatingLabel.text = doubleRating?.description
            } else {
                mainRatingLabel.isHidden = true
            }
        } else {
            mainRatingLabel.isHidden = true
        }
    }
}

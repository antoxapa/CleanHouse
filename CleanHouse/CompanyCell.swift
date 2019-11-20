//
//  CompanyCell.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/5/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

class CompanyCell: UICollectionViewCell {
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyPhoneNumber: UILabel!
    @IBOutlet weak var companyLogo: UIImageView! {
        didSet {
            companyLogo.layer.cornerRadius = 15
            companyLogo.layer.masksToBounds = true
            companyLogo.layer.borderWidth = 0.5
            companyLogo.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet weak var calculateButton: UIButton! {
        didSet {
            calculateButton.layer.cornerRadius = 10
        }
    }
}

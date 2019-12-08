//
//  companyViewCell.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/29/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

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
      @IBOutlet weak var ratingLabel: UILabel!
      @IBOutlet weak var firstStar: UIImageView!
      @IBOutlet weak var secondStar: UIImageView!
      @IBOutlet weak var thirdStar: UIImageView!
      @IBOutlet weak var fourthStar: UIImageView!
      @IBOutlet weak var fifthStar: UIImageView!
      @IBOutlet weak var topLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}

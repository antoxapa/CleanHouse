//
//  AboutCompanyCell.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/29/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

class AboutCompanyTVC: UITableViewCell {
    
    // MARK: - About company
    @IBOutlet weak var aboutCompanyLabel: UILabel!
    @IBOutlet weak var aboutCompanyTV: UITextView!
    @IBOutlet weak var moreButton: UIButton! {
        didSet {
            moreButton.layer.shadowOffset = CGSize(width: -7, height: 0)
            moreButton.layer.shadowColor = #colorLiteral(red: 0.9073960185, green: 0.9424270391, blue: 0.9372811913, alpha: 1).cgColor
            moreButton.layer.shadowOpacity = 1
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(company: CompanyRealm?, selectedIndex: IndexPath?, indexPath: IndexPath) {
        self.aboutCompanyTV.text = company?.aboutCompany
        if self.aboutCompanyTV.contentSize.height > 120 {
            self.moreButton.isHidden = false
        }
        if selectedIndex == indexPath {
            self.moreButton.isHidden = true
        }
    }
    
}

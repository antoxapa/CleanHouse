//
//  CleanerCell.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/5/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

class CleanerCell: UICollectionViewCell {
    @IBOutlet weak var cleanerName: UILabel!
    @IBOutlet weak var cleanerPhoto: UIImageView! {
        didSet {
            cleanerPhoto.layer.cornerRadius = cleanerPhoto.frame.width / 2
            cleanerPhoto.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var cleanerRating: UILabel!
    @IBOutlet weak var cleanerCompany: UILabel!
}

//
//  ReviewsCVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/23/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

class ReviewsCVC: UICollectionViewCell {
    
    @IBOutlet weak var reviewHeader: UILabel!
    @IBOutlet weak var reviewText: UITextView!
    @IBOutlet weak var reviewAuthor: UILabel!
    @IBOutlet weak var reviewDate: UILabel!
    @IBOutlet weak var oneStarReviewRating: UIImageView!
    @IBOutlet weak var twoStarsReviewRating: UIImageView!
    @IBOutlet weak var threeStarsReviewRating: UIImageView!
    @IBOutlet weak var fourStarsReviewRating: UIImageView!
    @IBOutlet weak var fiveStarsReviewRating: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
    }
}



//
//  ReviewsCVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/23/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit
import Cosmos

class ReviewsCVC: UICollectionViewCell {
    
    @IBOutlet weak var reviewHeader: UILabel!
    @IBOutlet weak var reviewText: UITextView!
    @IBOutlet weak var reviewAuthor: UILabel!
    @IBOutlet weak var reviewDate: UILabel!
    @IBOutlet weak var reviewRating: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
    }
func setupCell(review: ReviewsRealm) {
        reviewAuthor.text = review.reviewUser
        reviewDate.text = review.reviewDate
        reviewText.text = review.reviewText
        reviewHeader.text = review.reviewTitle
        if let rating = Double(review.reviewRating!) {
            reviewRating.rating = rating
        }
    }
}





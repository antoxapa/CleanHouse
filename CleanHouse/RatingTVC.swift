//
//  RatingCell.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/29/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

class RatingTVC: UITableViewCell {
    
    // MARK: - Rating $ Reviews
       
       @IBOutlet weak var ratingAndReviewsLabel: UILabel!
       @IBOutlet weak var averageRatingLabel: UILabel!
       @IBOutlet weak var fiveStarsProgressView: UIProgressView!
       @IBOutlet weak var fourStarsProgressView: UIProgressView!
       @IBOutlet weak var threeStarsProgressView: UIProgressView!
       @IBOutlet weak var twoStarsProgressView: UIProgressView!
       @IBOutlet weak var oneStarsProgressView: UIProgressView!
       @IBOutlet weak var outOfFiveLabel: UILabel!
       @IBOutlet weak var numberOfRatingsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

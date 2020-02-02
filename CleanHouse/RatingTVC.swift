//
//  RatingTVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 2/2/20.
//  Copyright © 2020 TonyPo Production. All rights reserved.
//

import UIKit

class RatingTVC: UITableViewCell {
    @IBOutlet weak var ratingAndReviewsLabel: UILabel!
    @IBOutlet weak var averageRatingLabel: UILabel!
    @IBOutlet weak var countRatingLabel: UILabel!
    
    @IBOutlet weak var fivePV: UIProgressView!
    @IBOutlet weak var fourPV: UIProgressView!
    @IBOutlet weak var threePV: UIProgressView!
    @IBOutlet weak var twoPV: UIProgressView!
    @IBOutlet weak var onePV: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

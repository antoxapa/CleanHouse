//
//  RatingTVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 2/2/20.
//  Copyright © 2020 TonyPo Production. All rights reserved.
//

import UIKit

class RatingTVC: UITableViewCell {
    
    var ratingArray: [Int] = [0]
    
    
    
    @IBOutlet weak var ratingAndReviewsLabel: UILabel!
    @IBOutlet weak var averageRatingLabel: UILabel!
    @IBOutlet weak var countRatingLabel: UILabel!
    
    @IBOutlet weak var fivePV: UIProgressView!
    @IBOutlet weak var fourPV: UIProgressView!
    @IBOutlet weak var threePV: UIProgressView!
    @IBOutlet weak var twoPV: UIProgressView!
    @IBOutlet weak var onePV: UIProgressView! {
        didSet {
            let filtered = self.ratingArray.filter { $0 == 1 }
                .count
            let progress = Float(filtered / ratingArray.count)
            onePV.setProgress(progress, animated: true)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupRatingView(company: CompanyRealm?) {
        if let reviewsList = company?.reviews {
            for item in reviewsList {
                guard let rating = item.reviewRating else { return }
                print(rating)
                if let intRating = Int(rating) {
                    ratingArray.append(intRating)
                let sum = ratingArray.reduce(0,+)
                averageRatingLabel.text = "\(Double(sum / ratingArray.count))"
                }
            }
        }
    }
}

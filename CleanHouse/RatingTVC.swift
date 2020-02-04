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
    
    
    func setupRatingView(company: CompanyRealm) {
        var ratingArray: [Int] = []
        
        for item in company.reviews {
            guard let rating = item.reviewRating else { return }
            if let intRating = Int(rating) {
                ratingArray.append(intRating)
            }
        }
        let sum = ratingArray.reduce(0,+)
        let averageRating = Double(sum) / Double(ratingArray.count)
        averageRatingLabel.text = String(format: "%.1f", averageRating)
        countRatingLabel.text = "\(company.reviews.count) Ratings"
        setupProgressViews(ratingArray: ratingArray)
    }
    
    private func setupProgressViews(ratingArray: [Int]) {
        for mark in 1...5 {
            let filtered = ratingArray.filter { $0 == mark }.count
            let floatFiltered = Float(filtered) / Float(ratingArray.count)
            switch mark {
            case 1:
                onePV.progress = floatFiltered
            case 2:
                twoPV.progress = floatFiltered
            case 3:
                threePV.progress = floatFiltered
            case 4:
                fourPV.progress = floatFiltered
            case 5:
                fivePV.progress = floatFiltered
            default:
                print("No satysfying ratings")
            }
        }
    }
}

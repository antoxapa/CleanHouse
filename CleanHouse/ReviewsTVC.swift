//
//  ReviewsTVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/29/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit
import Cosmos
import RealmSwift

class ReviewsTVC: UITableViewCell {
    
    // MARK: - Reviews
    var userRating: Double?
    
    @IBOutlet weak var reviewsCollectionView: UICollectionView! {
        didSet {
            reviewsCollectionView.isHidden = true
        }
    }
    @IBOutlet weak var tapToRateLabel: UILabel!
    @IBOutlet weak var writeAReviewButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    @IBOutlet weak var cosmosRating: CosmosView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        reviewsCollectionView.delegate = self
        reviewsCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(rating: Double?) {
        cosmosRating.rating = rating!
        cosmosRating.settings.updateOnTouch = false
    }
}
extension ReviewsTVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewsCVC", for: indexPath) as? ReviewsCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension ReviewsTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40, height: collectionView.frame.height)
    }
}

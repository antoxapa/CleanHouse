//
//  RatingCell.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 2/4/20.
//  Copyright © 2020 TonyPo Production. All rights reserved.
//

import UIKit
import Cosmos

class RatingCell: UITableViewCell {

    @IBOutlet weak var cosmosRatingView: CosmosView! 
    @IBOutlet weak var rateUsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

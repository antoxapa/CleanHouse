//
//  WorkerCell.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/23/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

class WorkerCell: UICollectionViewCell {
    
    @IBOutlet weak var workerImage: UIImageView!
    @IBOutlet weak var workerName: UILabel!
    
    override func awakeFromNib() {
        super .awakeFromNib()
        makeRoundCorners()
    }
    
    func configureCell(workers: WorkersRealm?) {
        NetworkManager.shared.uploadImage(url: workers!.workerPhoto!) { (image) in
            DispatchQueue.main.async {
                self.workerImage.image = image
            }
        }
        workerName.text = workers?.workerName
    }
    
    private func makeRoundCorners() {
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.3
    }
}

//
//  WorkersTVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/29/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

class WorkersTVC: UITableViewCell {

    @IBOutlet weak var ourWorkersLabel: UILabel!
    
    @IBOutlet weak var workerCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        workerCollectionView.delegate = self
        workerCollectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension WorkersTVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workersCell", for: indexPath) as? WorkerCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension WorkersTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: 190)
    }
}

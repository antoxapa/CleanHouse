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
    var workersNamesArray = [String]()
    var workersImagesArray = [UIImage]()
    
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
        return workersNamesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workersCell", for: indexPath) as? WorkerCell else {
            return UICollectionViewCell()
        }
        cell.workerName.text = workersNamesArray[indexPath.row]
        if workersImagesArray.count > indexPath.row  {
            DispatchQueue.main.async {
                cell.workerImage.image = self.workersImagesArray[indexPath.row]
            }
        }
        return cell
    }
}

extension WorkersTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 260, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

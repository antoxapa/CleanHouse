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
    
    var company: CompanyRealm?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        workerCollectionView.delegate = self
        workerCollectionView.dataSource = self
    }
    
    func configureCell(company: CompanyRealm?) {
        self.company = company
    }
}
extension WorkersTVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = company?.workers.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "workersCell", for: indexPath) as? WorkerCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(workers: company?.workers[indexPath.row])
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

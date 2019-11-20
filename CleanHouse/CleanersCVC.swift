//
//  CleanersCVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/5/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

class CleanersCVC: UICollectionViewController {
    
    private let reuseIdentifier = "cleanerCell"
    
    let networkManager = NetworkManager()
    var cleanersData: [CompanyData] = [CompanyData]()
    
    private var gradient: CAGradientLayer! {
        didSet {
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0.3, y: 1)
            let startColor = #colorLiteral(red: 0.8174410462, green: 0.912994802, blue: 0.8981556296, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.9568017125, green: 0.9568541646, blue: 0.9610589147, alpha: 1).cgColor
            gradient.colors = [startColor, endColor]
        }
    }
    
    private func addBackgroundGradient() {
        let collectionViewBackgroundView = UIView()
        gradient = CAGradientLayer()
        gradient.frame.size = view.frame.size
        collectionView.backgroundView = collectionViewBackgroundView
        collectionView.backgroundView?.layer.addSublayer(gradient)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundGradient()
        networkManager.fetchOfflineData { (data) in
            self.cleanersData = data
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return cleanersData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cleanerCell", for: indexPath) as? CleanerCell else { return UICollectionViewCell()}
        let cleaners = cleanersData[indexPath.row]
        cell.cleanerName.text = cleaners.name
        cell.cleanerRating.text = "Rating: \((cleaners.rating)!) / 5"
        cell.cleanerCompany.text = cleaners.company.name
        
        DispatchQueue.global().async {
            self.networkManager.uploadImage(url: cleaners.photo!) { (image) in
                DispatchQueue.main.async {
                    cell.cleanerPhoto.image = image
                }
                
            }
        }
        return cell
    }
}

extension CleanersCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

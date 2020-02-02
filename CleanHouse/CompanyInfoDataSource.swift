//
//  CompanyInfoDataSource.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 1/18/20.
//  Copyright © 2020 TonyPo Production. All rights reserved.
//

import UIKit
 
class CompanyInfoDataSource: NSObject, UITableViewDataSource {
    
    var company: CompanyRealm?

     var url: String?
     var selectedIndex: IndexPath?
     var rating: Double?
     var count: Double = 0.0
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.row {
            case 0:
                guard let cellA = tableView.dequeueReusableCell(withIdentifier: "companyViewCell") as? CompanyViewTVC else { return UITableViewCell() }
                
                cellA.setupCell(company: company)
            
                
                    

//                if company?.companyRating != nil, company?.ratingCount != nil {
//                    let sumRating = Double(company!.companyRating!)!
//                    count = Double(company!.ratingCount!)!
//                    let avarageRating = String(sumRating / count)
//                    cellA.setupRating(rating: avarageRating)
                    NetworkManager.shared.uploadImage(url: (company?.companyLogo)!) { (image) in
                        DispatchQueue.main.async {
                            cellA.companyLogo.image = image
                        }
                    }
                
                return cellA
            case 1:
                guard let cellB = tableView.dequeueReusableCell(withIdentifier: "aboutCompanyCell") as? AboutCompanyTVC else { return UITableViewCell() }
                cellB.configureCell(company: company, selectedIndex: selectedIndex, indexPath: indexPath)
                return cellB
            case 2:
                guard let cellC = tableView.dequeueReusableCell(withIdentifier: "ratingCell") as? RatingTVC else { return UITableViewCell() }
               
                return cellC
            case 3:
                guard let cellD = tableView.dequeueReusableCell(withIdentifier: "reviewsCell") as? ReviewsTVC else { return UITableViewCell() }
                
//                if company?.reviewText != "" {
//                    cellD.reviewsCollectionView.isHidden = false
//    
//                }
                
//                if company?.userRating != nil, let stringRating = company?.userRating {
////                    rating = Double(stringRating)
////                    cellD.configureCell(rating: rating)
//                } else {
//                    cellD.cosmosRating.didFinishTouchingCosmos = { rating in
//                        if self.rating == nil {
//                            self.rating = rating
//                            self.count += 1
//                            var newRating: Double?
//
//                            if self.company?.companyRating != nil {
//                            let oldRating = Double(self.company!.companyRating!)
//                            newRating = oldRating! + rating
//                            } else {
//                            newRating = rating
//                            }
//                            try! realm.write {
//                                self.company?.userRating = String(self.rating!)
//                                self.company?.companyRating = String(newRating!)
//                                self.company?.ratingCount = String(self.count)
//                            }
//                        }
//                        tableView.reloadData()
//                    }
//                }
                
                
                return cellD
            case 4:
                guard let cellE = tableView.dequeueReusableCell(withIdentifier: "workersCell") as? WorkersTVC else { return UITableViewCell() }
                //            cellE.workersNamesArray.append(companyArray[currentIndex].name)
                //            networkManager.uploadImage(url: companyArray[currentIndex].photo!) { (image) in
                //                cellE.workersImagesArray.append(image)
                //            }
                return cellE
                
            default:
                return UITableViewCell()
            }
        }
    }

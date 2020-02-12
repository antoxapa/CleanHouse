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
            cellA.setupRating(company: company)
            
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
            if let company = company {
                cellC.setupRatingView(company: company)
            }
            return cellC
        case 3:
            guard let cellD = tableView.dequeueReusableCell(withIdentifier: "reviewsCell") as? ReviewsTVC else { return UITableViewCell() }
            cellD.configureCell(company: company)
            return cellD
        case 4:
            guard let cellE = tableView.dequeueReusableCell(withIdentifier: "workersCell") as? WorkersTVC else { return UITableViewCell() }
            cellE.configureCell(company: company)
            return cellE
            
        default:
            return UITableViewCell()
        }
    }
}

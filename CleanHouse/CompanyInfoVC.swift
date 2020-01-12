//
//  CompanyInfoVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/5/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit
import RealmSwift

class CompanyInfoVC: UIViewController {
    
    @IBOutlet weak var companiesTableView: UITableView!
    
    var company: CompanyRealm?
    
    var topArray = [Double]()
    var url: String?
    var selectedIndex: IndexPath?
    var rating: Double?
    var count: Double = 0.0
    
    private var gradient: CAGradientLayer! {
        didSet {
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0.3, y: 1)
            let startColor = #colorLiteral(red: 0.8174410462, green: 0.912994802, blue: 0.8981556296, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.9568017125, green: 0.9568541646, blue: 0.9610589147, alpha: 1).cgColor
            gradient.colors = [startColor, endColor]
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        addBackgroundGradient()
        companiesTableView.estimatedRowHeight = 44
        companiesTableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    private func addBackgroundGradient() {
        let gradientBackgroundView = UIView()
        gradient = CAGradientLayer()
        gradient.frame.size = view.frame.size
        gradientBackgroundView.layer.addSublayer(gradient)
        view.insertSubview(gradientBackgroundView, belowSubview: companiesTableView)
    }
}

extension CompanyInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cellA = tableView.dequeueReusableCell(withIdentifier: "companyViewCell") as? CompanyViewTVC else { return UITableViewCell() }
            
            cellA.companyName.text = company?.companyName
            cellA.aboutCompany.text = company?.companyDescription
            //            cellA.topLabel.text = String(currentIndex + 1)
            if company?.companyRating != nil, company?.ratingCount != nil {
                let sumRating = Double(company!.companyRating!)!
                print(sumRating)
                count = Double(company!.ratingCount!)!
                print(count)
                let avarageRating = String(sumRating / count)
                cellA.setupRating(rating: avarageRating)
            }
            return cellA
        } else if indexPath.row == 1 {
            
            guard let cellB = tableView.dequeueReusableCell(withIdentifier: "aboutCompanyCell") as? AboutCompanyTVC else { return UITableViewCell() }
            cellB.aboutCompanyTV.text = company?.aboutCompany
            if cellB.aboutCompanyTV.contentSize.height > 120 {
                cellB.moreButton.isHidden = false
            }
            if selectedIndex == indexPath {
                cellB.moreButton.isHidden = true
            }
            return cellB
        } else if indexPath.row == 2  {
            guard let cellC = tableView.dequeueReusableCell(withIdentifier: "ratingCell") as? RatingTVC else { return UITableViewCell() }
            return cellC
        } else if indexPath.row == 3  {
            guard let cellD = tableView.dequeueReusableCell(withIdentifier: "reviewsCell") as? ReviewsTVC else { return UITableViewCell() }
            if company?.userRating != nil, let stringRating = company?.userRating {
                rating = Double(stringRating)
                cellD.cosmosRating.rating = rating!
                cellD.cosmosRating.settings.updateOnTouch = false
            } else {
                cellD.cosmosRating.didFinishTouchingCosmos = { rating in
                    if self.rating == nil {
                        self.rating = rating
                        self.count += 1
                        var newRating: Double?
                        
                        if self.company?.companyRating != nil {
                        var oldRating = Double(self.company!.companyRating!)
                        newRating = oldRating! + rating
                        } else {
                        newRating = rating
                        }
                        try! realm.write {
                            self.company?.userRating = String(self.rating!)
                            self.company?.companyRating = String(newRating!)
                            self.company?.ratingCount = String(self.count)
                        }
                    }
                    tableView.reloadData()
                }
            }
            return cellD
            
        } else {
            guard let cellE = tableView.dequeueReusableCell(withIdentifier: "workersCell") as? WorkersTVC else { return UITableViewCell() }
            //            cellE.workersNamesArray.append(companyArray[currentIndex].name)
            //            networkManager.uploadImage(url: companyArray[currentIndex].photo!) { (image) in
            //                cellE.workersImagesArray.append(image)
            //            }
            return cellE
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 190
        } else if indexPath.row == 1 {
            if selectedIndex == indexPath{
                return UITableView.automaticDimension
            }
            return 120
        } else if indexPath.row == 2 {
            return 120
        } else {
            return 300
        }
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 1 {
            self.selectedIndex = indexPath
            tableView.reloadData()
            return indexPath
        }
        return nil
    }
}

//
//  CompanyInfoVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/5/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

class CompanyInfoVC: UIViewController {
    
    @IBOutlet weak var companiesTableView: UITableView!
    
    var companyArray: [CompanyData] = [CompanyData]()
    var networkManager = NetworkManager()
    var currentIndex = 0
    var topArray = [Double]()
    var url: String?
    var selectedIndex: IndexPath?
    
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
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        companiesTableView.estimatedRowHeight = 44
        companiesTableView.rowHeight = UITableView.automaticDimension
        
        
        
        networkManager.fetchOfflineData { (companies) in
            self.companyArray = companies
        }
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
            let companys = companyArray[currentIndex]
            networkManager.uploadImage(url: companys.company.logo!) { (image) in
                DispatchQueue.main.async {
                    cellA.companyLogo.image = image
                }
            }
            cellA.companyName.text = companys.company.name
            cellA.aboutCompany.text = companys.phone
            cellA.topLabel.text = String(currentIndex + 1)
            cellA.ratingLabel.text = String(companys.company.companyRating!)
            cellA.selectionStyle = .none
            
            let rating = Double(companys.company.companyRating!)!
            
            
            switch rating {
            case 0...0.5:
                cellA.firstStar.image = UIImage(systemName: "star.lefthalf.fill")
            case 0.6...1.0:
                cellA.firstStar.image = UIImage(systemName: "star.fill")
            case 1.1...1.5:
                cellA.firstStar.image = UIImage(systemName: "star.fill")
                cellA.secondStar.image = UIImage(systemName: "star.lefthalf.fill")
            case 1.6...2.0:
                cellA.firstStar.image = UIImage(systemName: "star.fill")
                cellA.secondStar.image = UIImage(systemName: "star.fill")
            case 2.1...2.5:
                cellA.firstStar.image = UIImage(systemName: "star.fill")
                cellA.secondStar.image = UIImage(systemName: "star.fill")
                cellA.thirdStar.image = UIImage(systemName: "star.lefthalf.fill")
            case 2.6...3.0:
                cellA.firstStar.image = UIImage(systemName: "star.fill")
                cellA.secondStar.image = UIImage(systemName: "star.fill")
                cellA.thirdStar.image = UIImage(systemName: "star.fill")
            case 3.1...3.5:
                cellA.firstStar.image = UIImage(systemName: "star.fill")
                cellA.secondStar.image = UIImage(systemName: "star.fill")
                cellA.thirdStar.image = UIImage(systemName: "star.fill")
                cellA.fourthStar.image = UIImage(systemName: "star.lefthalf.fill")
            case 3.6...4.0:
                cellA.firstStar.image = UIImage(systemName: "star.fill")
                cellA.secondStar.image = UIImage(systemName: "star.fill")
                cellA.thirdStar.image = UIImage(systemName: "star.fill")
                cellA.fourthStar.image = UIImage(systemName: "star.fill")
            case 4.1...4.5:
                cellA.firstStar.image = UIImage(systemName: "star.fill")
                cellA.secondStar.image = UIImage(systemName: "star.fill")
                cellA.thirdStar.image = UIImage(systemName: "star.fill")
                cellA.fourthStar.image = UIImage(systemName: "star.fill")
                cellA.fifthStar.image = UIImage(systemName: "star.lefthalf.fill")
            default:
                cellA.firstStar.image = UIImage(systemName: "star.fill")
                cellA.secondStar.image = UIImage(systemName: "star.fill")
                cellA.thirdStar.image = UIImage(systemName: "star.fill")
                cellA.fourthStar.image = UIImage(systemName: "star.fill")
                cellA.fifthStar.image = UIImage(systemName: "star.fill")
            }
            return cellA
        } else if indexPath.row == 1 {
            
            guard let cellB = tableView.dequeueReusableCell(withIdentifier: "aboutCompanyCell") as? AboutCompanyTVC else { return UITableViewCell() }
            cellB.aboutCompanyTV.text = companyArray[currentIndex].company.about
            
            cellB.selectionStyle = .none
            if cellB.aboutCompanyTV.contentSize.height > 120 {
                cellB.moreButton.isHidden = false
            }
            if selectedIndex == indexPath {
                cellB.moreButton.isHidden = true
            }
            return cellB
        } else if indexPath.row == 2  {
            guard let cellC = tableView.dequeueReusableCell(withIdentifier: "ratingCell") as? RatingTVC else { return UITableViewCell() }
           cellC.selectionStyle = .none
            return cellC
        } else if indexPath.row == 3  {
            guard let cellD = tableView.dequeueReusableCell(withIdentifier: "reviewsCell") as? ReviewsTVC else { return UITableViewCell() }
           cellD.selectionStyle = .none
            return cellD
        } else {
            guard let cellE = tableView.dequeueReusableCell(withIdentifier: "workersCell") as? WorkersTVC else { return UITableViewCell() }
            cellE.workersNamesArray.append(companyArray[currentIndex].name)
            networkManager.uploadImage(url: companyArray[currentIndex].photo!) { (image) in
                cellE.workersImagesArray.append(image)
            }
            cellE.selectionStyle = .none
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
//    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.selectionStyle = .none
//    }
}

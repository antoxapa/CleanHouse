//
//  CompaniesCVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/5/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit
import RealmSwift

class CompaniesCVC: UICollectionViewController {
    
    private let reuseIdentifier = "companyCell"
    private var gradient: CAGradientLayer! {
        didSet {
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0.3, y: 1)
            let startColor = #colorLiteral(red: 0.8174410462, green: 0.912994802, blue: 0.8981556296, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.9568017125, green: 0.9568541646, blue: 0.9610589147, alpha: 1).cgColor
            gradient.colors = [startColor, endColor]
        }
    }
    let networkManager = NetworkManager()
    var selectedIndexPath: Int!
    var companyLogoArray: [UIImage] = [UIImage]()
    
    var companyRealm: Results<CompanyRealm>!
    
    override func viewDidAppear(_ animated: Bool) {
        addBackgroundGradient()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        companyRealm = realm.objects(CompanyRealm.self)
        saveDataInRealm()
    }
    
    private func saveDataInRealm() {
        self.networkManager.fetchOfflineData { (companies) in
            if companies.count != self.companyRealm.count {
                StorageManager.deleteAll()
                
                for company in companies {
                    let company = CompanyRealm(companyName: company.company.name, companyDescription: nil, companyLogo: company.company.logo, companyRating: company.company.companyRating, aboutCompany: company.company.about, userRating: company.userRating, ratingCount: company.company.ratingsCount)
                    StorageManager.saveObject(company)
                }
            }
        }
    }
    
    private func addBackgroundGradient() {
        let collectionViewBackgroundView = UIView()
        gradient = CAGradientLayer()
        gradient.frame.size = view.frame.size
        collectionView.backgroundView = collectionViewBackgroundView
        collectionView.backgroundView?.layer.addSublayer(gradient)
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCompanySegue"  {
            if let indexPath = collectionView.indexPathsForSelectedItems!.last {
                guard let dvc = segue.destination as? CompanyInfoVC else { return }
                dvc.company = companyRealm[indexPath.row]
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companyRealm.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "companyCell", for: indexPath) as? CompanyCell else { return UICollectionViewCell()}
        let companys = companyRealm[indexPath.row]
        
        networkManager.uploadImage(url: companys.companyLogo!) { (image) in
            DispatchQueue.main.async {
                cell.companyLogo.image = image
            }
        }
        cell.companyName.text = companys.companyName
        cell.companyPhoneNumber.text = companys.companyDescription
        return cell
    }
}
extension CompaniesCVC: UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: 100)
    }
    
    
}

//
//  CompaniesCVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/5/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

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
    var companyArray: [CompanyData] = [CompanyData]()
    var selectedIndexPath: Int!
    var companyLogoArray: [UIImage] = [UIImage]()
    
    override func viewDidAppear(_ animated: Bool) {
        addBackgroundGradient()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.fetchOfflineData { (companies) in
            self.companyArray = companies
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
                dvc.currentIndex = indexPath.row
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companyArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "companyCell", for: indexPath) as? CompanyCell else { return UICollectionViewCell()}
        let companys = companyArray[indexPath.row]
        networkManager.uploadImage(url: companys.company.logo!) { (image) in
            DispatchQueue.main.async {
                cell.companyLogo.image = image
            }
    }
        cell.companyName.text = companys.company.name
        cell.companyPhoneNumber.text = companys.phone
        return cell
    }
    
    
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
extension CompaniesCVC: UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: 100)
    }
    
    
}

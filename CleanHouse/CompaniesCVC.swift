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
    
    @IBOutlet weak var sortingButton: UIBarButtonItem!
    
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
    var selectedIndexPath: Int!
    var companyLogoArray: [UIImage] = [UIImage]()
    var sortedByRating = true
    
    var companyRealm: Results<CompanyRealm>!
    
    
    override func viewDidAppear(_ animated: Bool) {
        addBackgroundGradient()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sort()
        saveDataInRealm()
    }
    
    private func saveDataInRealm() {
        NetworkManager.shared.fetchOfflineData { (companies) in
            if companies.count != self.companyRealm.count {
                StorageManager.deleteAll()
                
                for item in companies {
                   
                    let reviews = ReviewsRealm(reviewUserID: item.reviews.id, reviewUser: item.reviews.user, reviewTitle: item.reviews.title, reviewDate: item.reviews.date, reviewRating: item.reviews.rating, reviewText: item.reviews.text)
                    let workers = WorkersRealm(idWorker: item.workers.id, workerName: item.workers.name, workerPhoto: item.workers.photo)

                    let company = CompanyRealm(companyName: item.company.name, companyDescription: item.company.description, companyLogo: item.company.logo, aboutCompany: item.company.about, reviews: reviews, workers: workers)
                    
                    StorageManager.saveObject(company)
                }
            }
        }
    }
    
    private func sort() {
        sortedByRating.toggle()
        if sortedByRating == false {
            companyRealm = realm.objects(CompanyRealm.self).sorted(byKeyPath: "companyName")
            sortingButton.image = #imageLiteral(resourceName: "AZ")
        } else {
            companyRealm = realm.objects(CompanyRealm.self).sorted(byKeyPath: "companyRating")
            sortingButton.image = #imageLiteral(resourceName: "ZA")
        }
        collectionView.reloadData()
    }
    
    @IBAction func sortButtonAction(_ sender: UIBarButtonItem) {
        sort()
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
        NetworkManager.shared.uploadImage(url: companyRealm[indexPath.row].companyLogo!) { (image) in
            DispatchQueue.main.async {
                cell.setupImage(image: image)
            }
        }
        cell.setupCompanies(companies: companyRealm, indexPath: indexPath)
       
        return cell
    }
}
extension CompaniesCVC: UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: 100)
    }
}

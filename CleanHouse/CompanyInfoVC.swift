//
//  CompanyInfoVC.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/5/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import UIKit

class CompanyInfoVC: UIViewController {
    
    // MARK: - CompanyView
    @IBOutlet weak var companyLogo: UIImageView! {
        didSet {
            companyLogo.layer.cornerRadius = 25
            companyLogo.layer.masksToBounds = true
            companyLogo.layer.borderWidth = 0.25
            companyLogo.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        }
    }
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var aboutCompany: UILabel!
    @IBOutlet weak var callButton: UIButton! {
        didSet {
            callButton.layer.cornerRadius = 12
            callButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    
    // MARK: - About company
    @IBOutlet weak var aboutCompanyLabel: UILabel!
    @IBOutlet weak var aboutCompanyTV: UITextView!
    
    // MARK: - Rating $ Reviews
    
    @IBOutlet weak var ratingAndReviewsLabel: UILabel!
    @IBOutlet weak var averageRatingLabel: UILabel!
    @IBOutlet weak var fiveStarsProgressView: UIProgressView!
    @IBOutlet weak var fourStarsProgressView: UIProgressView!
    @IBOutlet weak var threeStarsProgressView: UIProgressView!
    @IBOutlet weak var twoStarsProgressView: UIProgressView!
    @IBOutlet weak var oneStarsProgressView: UIProgressView!
    @IBOutlet weak var outOfFiveLabel: UILabel!
    @IBOutlet weak var numberOfRatingsLabel: UILabel!
    
    // MARK: - Reviews
    
    @IBOutlet weak var reviewsCollectionView: UICollectionView!
    @IBOutlet weak var tapToRateLabel: UILabel!
    @IBOutlet weak var oneStarRatingButton: UIButton!
    @IBOutlet weak var twoStarsRatingButton: UIButton!
    @IBOutlet weak var threeStarsRatingButton: UIButton!
    @IBOutlet weak var fourStarsRatingButton: UIButton!
    @IBOutlet weak var fiveStarsRatingButton: UIButton!
    @IBOutlet weak var writeAReviewButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    
    // MARK: - Our workers
    
    @IBOutlet weak var ourWorkersLabel: UILabel!
    @IBOutlet weak var workersCV: UICollectionView!

    @IBOutlet weak var scrollView: UIScrollView!
    
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
        
    }
    private func addBackgroundGradient() {
        let gradientBackgroundView = UIView()
        gradient = CAGradientLayer()
        gradient.frame.size = view.frame.size
        gradientBackgroundView.layer.addSublayer(gradient)
        view.insertSubview(gradientBackgroundView, belowSubview: scrollView)
    }
}

extension CompanyInfoVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == workersCV {
            return 3
        } else {
        return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == workersCV {
        guard let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "workerCell", for: indexPath) as? WorkerCell else { return UICollectionViewCell() }
            return cellA
        } else {
        guard let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell", for: indexPath) as? ReviewsCVC else { return UICollectionViewCell() }
            return cellB
        }
    }
    
}
extension CompanyInfoVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == workersCV {
            let height = collectionView.frame.height - 20
            return CGSize(width: height, height: height)
        } else {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
}

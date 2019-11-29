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
    
    var namesArray = ["Anna", "Vasya","Jeka","sasha"]
    var reviews: [String] = []
    
    
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
        view.insertSubview(gradientBackgroundView, belowSubview: companiesTableView)
    }
}

extension CompanyInfoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "companyViewCell", for: indexPath)
        } else if indexPath.row == 1 {
            return tableView.dequeueReusableCell(withIdentifier: "aboutCompanyCell", for: indexPath)
        } else if indexPath.row == 2  {
            return tableView.dequeueReusableCell(withIdentifier: "ratingCell", for: indexPath)
        } else if indexPath.row == 3  {
            return tableView.dequeueReusableCell(withIdentifier: "reviewsCell", for: indexPath)
        } else {
            return tableView.dequeueReusableCell(withIdentifier: "workersCell", for: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 190
        } else if indexPath.row == 1 {
            return 200
        } else if indexPath.row == 2  {
            return 120
        } else if indexPath.row == 3  {
            return 300
        } else {
            return 300
        }
    }
}


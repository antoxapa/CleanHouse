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
    
    var company: CompanyRealm?
    var selectedIndex: IndexPath?
    
    private let dataSource = CompanyInfoDataSource()
    private let delegate = CompanyInfoDelegate()
    
    private var gradient: CAGradientLayer! {
          didSet {
              gradient.startPoint = CGPoint(x: 0, y: 0)
              gradient.endPoint = CGPoint(x: 0.3, y: 1)
              let startColor = #colorLiteral(red: 0.8174410462, green: 0.912994802, blue: 0.8981556296, alpha: 1).cgColor
              let endColor = #colorLiteral(red: 0.9568017125, green: 0.9568541646, blue: 0.9610589147, alpha: 1).cgColor
              gradient.colors = [startColor, endColor]
          }
      }
    
    @IBOutlet weak var companiesTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        addBackgroundGradient()
        companiesTableView.estimatedRowHeight = 44
        companiesTableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companiesTableView.dataSource = dataSource
        companiesTableView.delegate = delegate
        
        dataSource.company = company
        delegate.selectedIndex = selectedIndex
    }

    private func addBackgroundGradient() {
        let gradientBackgroundView = UIView()
        gradient = CAGradientLayer()
        gradient.frame.size = view.frame.size
        gradientBackgroundView.layer.addSublayer(gradient)
        view.insertSubview(gradientBackgroundView, belowSubview: companiesTableView)
    }
}


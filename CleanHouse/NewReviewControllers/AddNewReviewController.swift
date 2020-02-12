//
//  AddNewReviewController.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 2/4/20.
//  Copyright © 2020 TonyPo Production. All rights reserved.
//

import UIKit
import RealmSwift

class AddNewReviewController: UITableViewController {
    
    //    MARK:- IBOutlets
    @IBOutlet var newReviewTableView: UITableView!
    
    //MARK:- Variables
    var company: CompanyRealm?
    var rating: Double?
    var reviewTitle: String?
    var reviewText: String?
    var userNickname: String?
    weak var actionToEnable : UIAlertAction?
    
    //MARK:- Gradient BG
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
    private func addBackgroundGradient() {
        let tableViewBackgroundView = UIView()
        gradient = CAGradientLayer()
        gradient.frame.size = view.frame.size
        tableView.backgroundView = tableViewBackgroundView
        tableView.backgroundView?.layer.addSublayer(gradient)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cellA = tableView.dequeueReusableCell(withIdentifier: "cellA") as? RatingCell else { return UITableViewCell() }
            if rating != nil {
                cellA.cosmosRatingView.rating = rating!
            } else {
                cellA.cosmosRatingView.didFinishTouchingCosmos = { rating in
                    self.rating = rating
                }
            }
            return cellA
        case 1:
            guard let cellB = tableView.dequeueReusableCell(withIdentifier: "cellB") as? TitleCell else { return UITableViewCell() }
            reviewTitle = cellB.titleTextField.text
            return cellB
        case 2:
            guard let cellC = tableView.dequeueReusableCell(withIdentifier: "cellC") as? ReviewCell else { return UITableViewCell() }
            reviewText = cellC.recall
            return cellC
        default:
            return UITableViewCell()
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 40
        case 1:
            return 40
        case 2:
            return tableView.frame.height
        default:
            return 150
        }
    }
    
    // MARK: - Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func done(sender: UIBarButtonItem) {
        if rating == nil {
            rating = 5.0
            tableView.reloadData()
        }
        addAlert()
    }
    
    //MARK: - AlertController
    
    private func addAlert() {
        let ac = UIAlertController(title: "Write your nickname", message: "Your nickname will be displayed next to your recall", preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = "nickname"
            textField.addTarget(self, action: #selector(self.textChanged(_:)), for: .editingChanged)
        }
        let OK = UIAlertAction(title: "OK", style: .destructive) { (action) in
            self.userNickname = ac.textFields?.first?.text
            self.addReviewInRealm()
            self.navigationController?.popViewController(animated: true)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        ac.addAction(OK)
        ac.addAction(cancel)
        self.actionToEnable = OK
        OK.isEnabled = false
        present(ac, animated: true)
    }
    
    @objc func textChanged(_ sender:UITextField) {
        self.actionToEnable?.isEnabled = true
    }
    
    private func setDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        return result
    }
    
    //MARK:- RealmFunc
    private func addReviewInRealm() {
        if self.userNickname != nil ?? "" {
            if self.company != nil {
                let review = ReviewsRealm(reviewUserID: String(self.company!.reviews.endIndex), reviewUser: self.userNickname, reviewTitle: self.reviewTitle, reviewDate: self.setDate(), reviewRating: self.rating?.description, reviewText: self.reviewText)
                try! realm.write {
                    self.company?.reviews.append(review)
                }
            }
        }
    }
}

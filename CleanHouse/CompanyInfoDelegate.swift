//
//  CompanyInfoDelegate.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 1/18/20.
//  Copyright © 2020 TonyPo Production. All rights reserved.
//

import UIKit

class CompanyInfoDelegate: NSObject, UITableViewDelegate {
    
    var company: CompanyRealm?
    var selectedIndex: IndexPath?

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
        }else if indexPath.row == 3 {
            if company?.reviewText == "" {
                return 100
            }
            return 300
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

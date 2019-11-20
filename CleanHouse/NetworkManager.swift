//
//  NetworkManager.swift
//  CleanHouse
//
//  Created by Антон Потапчик on 11/5/19.
//  Copyright © 2019 TonyPo Production. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager {
  
    func fetchData(complitionHandler: @escaping ([CompanyData])->()) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: urlString) else {
            print("Invalid url")
            return }
        
        let jsonData = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let company = try JSONDecoder().decode([CompanyData].self, from: data)
                complitionHandler(company)
            } catch let error {
                print("fetch error \(error)")
            }
        }.resume()
    }
    
    func fetchOfflineData(complitionHandler: @escaping ([CompanyData]) -> ()) {
        //        let path = "Users/tonypo/Documents/MyProjects/CleanHouse/JSON.rtf"
        guard let file = Bundle.main.url(forResource: "cleaning", withExtension: "json") else { return }
        if let data = try? Data(contentsOf: file) {
            do {
                let decoded = try JSONDecoder().decode([CompanyData].self, from: data)
                complitionHandler(decoded)
            } catch let error {
                print(error)
            }
            
        }
    }
    
    func uploadImage(url: String, sendImage: @escaping (UIImage) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                sendImage(image)
            }
            
        }.resume()
    }
}


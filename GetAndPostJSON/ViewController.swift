//
//  ViewController.swift
//  GetAndPostJSON
//
//  Created by Арген on 02.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func GetJSON(_ sender: UIButton) {
        let url = URL(string: "https://api.vk.com/method/friends.getLists?fields=bdate&access_token=7869733&v=5.131")
        let session = URLSession.shared
        session.dataTask(with: url!) { data, response, error in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            print(data)
            
            do {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                print(json as Any)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    @IBAction func PostJSON(_ sender: UIButton) {
        guard let url = URL(string: "https://api.vk.com/method/friends.getLists?fields=bdate&access_token=7869733&v=5.131") else { return }
        
        let param = ["userName": "Argen",
                     "message": "Hello"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    
}


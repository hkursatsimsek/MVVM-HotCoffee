//
//  OrdersTableViewController.swift
//  MVVM-HotCoffee
//
//  Created by Kürşat Şimşek on 29.06.2022.
//

import Foundation
import UIKit

class OrdersTableViewController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateOrders()
    }
    
    private func populateOrders() {
        guard let coffeeOrderURL = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL was incorrect!")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrderURL)
        
        Webservice().load(resource: resource) { result in
            switch result {
            case .success(let orders):
                print(orders)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    } 
    
}

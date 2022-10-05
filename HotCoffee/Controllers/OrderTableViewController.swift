//
//  OrderTableViewController.swift
//  HotCoffee
//
//  Created by YUSUF ÖZATA on 2.10.2022.
//


import UIKit

class OrdersTableViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        
        guard let coffeeOrdersURL = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        
        Webservice().load(resource: resource) { result in
            
            switch result {
                case .success(let orders):
                    print(orders)
                case .failure(let error):
                    print(error)
            }
            
        }
        
    }
    
}


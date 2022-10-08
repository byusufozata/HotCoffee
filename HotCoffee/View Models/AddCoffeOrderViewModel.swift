//
//  AddCoffeOrderViewModel.swift
//  HotCoffee
//
//  Created by YUSUF ÖZATA on 6.10.2022.
//

import Foundation

struct AddCoffeeOrderViewModel{
    var name: String?
    var email: String?
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
        return Order.CoffeeType.allCases.map{ $0.rawValue.capitalized }
       
    }
    var sizes: [String] {
        return Order.CoffeeSize.allCases.map{ $0.rawValue.capitalized }
    }
}

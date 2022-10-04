//
//  Order.swift
//  HotCoffee
//
//  Created by YUSUF ÖZATA on 4.10.2022.
//

import Foundation

enum CoffeeType: String, Codable {
    case cappucino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}

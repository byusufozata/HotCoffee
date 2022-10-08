//
//  Order.swift
//  HotCoffee
//
//  Created by YUSUF ÖZATA on 4.10.2022.
//



import UIKit

struct Order: Codable  {
    
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
    
    enum CoffeeType: String, Codable, CaseIterable {
        case cappuccino = "cappuccino"
        case latte      = "latte"
        case espressino = "espressino"
        case cortado    = "cortado"

    }
    
    enum CoffeeSize: String, Codable,CaseIterable {
        case small  = "small"
        case medium = "medium"
        case large  = "large"
    }
}

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        let order = Order(vm)
        
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order.")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
        
    }
}

extension Order {
    
    init?(_ vm: AddCoffeeOrderViewModel) {
        
        guard let name = vm.name,
        let email = vm.email,
        let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
        let selecetedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        
        self.email = email
        self.name = name
        self.type = selectedType
        self.size = selecetedSize
        
    }
}

//
//  RestaurantModel.swift
//  Camera
//
//  Created by classmac on 2025/02/03.
//

import Foundation

struct HotPepperResponse: Codable {
    let results: Results
}

struct Results: Codable {
    let shop: [Restaurant]
}

struct Restaurant: Codable, Identifiable {
    let id: String
    let name: String
    let address: String
}

//
//  GroceryItem.swift
//  GroceryListDemo
//
//  Created by Salvador Garcia on 11/20/21.
//

import Foundation

//1. Create GroceryItem and make it conform to Codable

struct GroceryItem: Codable{
    var name: String
    var quantity: Int
}

//
//  LocalSorage.swift
//  GroceryListDemo
//
//  Created by Salvador Garcia on 11/20/21.
//

import Foundation

struct LocalStorage{
    var item: GroceryItem
    
//2. implementation of the persistance
    static var documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static var archiveURL = documentsDirectory.appendingPathComponent("grocery-list").appendingPathExtension("plist")

    
//3. make function to save
    static func saveToFile(groceryList: [GroceryItem]){
        let propertyListEncoder = PropertyListEncoder()
        let encodedGroceryList = try? propertyListEncoder.encode(groceryList)
        
        try? encodedGroceryList?.write(to: archiveURL)
    }

//4. make function to load
    static func loadFromFile() -> [GroceryItem]?{
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedGroceryList = try? Data(contentsOf: archiveURL), let decodedGroceryList = try? propertyListDecoder.decode([GroceryItem].self, from: retrievedGroceryList){
            return decodedGroceryList
        }
        return nil
    }
}

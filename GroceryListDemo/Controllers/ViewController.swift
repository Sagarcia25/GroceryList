//
//  ViewController.swift
//  GroceryListDemo
//
//  Created by Salvador Garcia on 11/20/21.
//

import UIKit

class ViewController: UIViewController {

//1. connect ib outlets and actions
 
//2. add an instance of an array for GroceryItems
    var groceryArray = [GroceryItem]()

    @IBOutlet var itemTextField: UITextField!
    
    @IBOutlet var quantityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //3.add this to load the groceries
        if let decodedGroceries = LocalStorage.loadFromFile(){
            groceryArray = decodedGroceries
        }
        
    }

    //3. add functionality to save button
    @IBAction func submitButton(_ sender: UIButton) {
        if let name = itemTextField.text, let quantityString = quantityTextField.text, let quantity = Int(quantityString){
            let newItem = GroceryItem(name: name, quantity: quantity)
            groceryArray.append(newItem)
            LocalStorage.saveToFile(groceryList: groceryArray)
            performSegue(withIdentifier: "Submit", sender: nil)
        }
    }
    
    //4. to pass the data to next viewController implement the prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Submit"{
            let tableViewController = segue.destination as! GroceryTableViewController
            tableViewController.groceryList = groceryArray
            
        }
    }
    
}


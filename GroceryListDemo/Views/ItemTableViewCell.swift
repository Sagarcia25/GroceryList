//
//  ItemTableViewCell.swift
//  GroceryListDemo
//
//  Created by Salvador Garcia on 11/20/21.
//

import UIKit

//1. Add outlets from cell to file

class ItemTableViewCell: UITableViewCell {

    @IBOutlet var itemLabel: UILabel!
    
    @IBOutlet var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//2. add configure function to set labels
    func configure(with item: GroceryItem){
        itemLabel.text = item.name
        quantityLabel.text = "QTY: \(String(item.quantity))"
    }

}

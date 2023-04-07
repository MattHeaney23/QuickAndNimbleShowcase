//
//  TrolleyViewModel.swift
//  QuickAndNimble
//
//  Created by Matt on 07/03/2023.
//

import Foundation
import UIKit

class TrolleyViewModel {
    
    var itemsInTrolley: [Item] = []
    
    /// Load stored trolley. This is currently mocked out for the example
    func getStoredTrolleyFromServer(completionHandler: () -> ()) {
        itemsInTrolley.append(Item(name: "PS5",
                                   id: "Item0001",
                                   price: 699.99))
        
        itemsInTrolley.append(Item(name: "iPad Pro",
                                   id: "Item0002",
                                   price: 999.99))
    }
    
    /// Remove an item form the trolley, if the item is currently in the trolley
    func addItemToTrolley(item: Item) {
        self.itemsInTrolley.append(item)
    }
    
    /// Remove an item form the trolley, if the item is currently in the trolley
    func removeItemFromTrolley(item:Item) throws {
        guard let itemIndex = self.itemsInTrolley.firstIndex(where: { $0.id == item.id }) else {
            throw TrolleyError.ItemNotInTrolley
        }
        
        self.itemsInTrolley.remove(at: itemIndex)
    }
    
    /// Complete the purchase, ensuring the user has enough funds.  This is currently mocked out for the example
    func completePurchase(funds: CGFloat) throws {
        let grandTotal = itemsInTrolley.reduce(0.0) { $0 + $1.price }
        
        guard funds >= grandTotal else {
            throw NSError()
        }
        
        //Mocked Logic - In a real app, purchasing logic would sit here
        itemsInTrolley.removeAll()
    }
}

//
//  NetworkService.swift
//  QuickAndNimble
//
//  Created by Matt on 07/04/2023.
//

import Foundation

/// A mocked network service, returning a mocked local response. All data in this project is mocked to help showcase the Quick and Nimble frameworks.
class NetworkService {
    
    func requestStoredItemsForUser() async -> [Item] {
        
        let storedItems = [Item(name: "PS5",
                                id: "Item0001",
                                price: 699.99),
                           Item(name: "iPad Pro",
                                id: "Item0002",
                                price: 999.99)]
        
        return storedItems
    }
    
    func makePurchase() {
        print("Mocked purchase successful!")
    }
    
}

//
//  QuickAndNimbleTests.swift
//  QuickAndNimbleTests
//
//  Created by Matt on 07/03/2023.
//

@testable import QuickAndNimble
import XCTest
import Quick
import Nimble

class QuickAndNimbleTests: QuickSpec {
    
    override func spec() {
        
        var trolleyViewModel: TrolleyViewModel!
        
        beforeEach {
            trolleyViewModel = TrolleyViewModel()
        }
        
        afterEach {
            trolleyViewModel = nil
        }
        
        context("Creating an order") {
            
            describe("before I have added any items") {
                it("the trolley should be empty") {
                    expect(trolleyViewModel.itemsInTrolley.isEmpty) == true
                }
            }
            
            describe("when the user adds an item") {
                it("should add the item to the trolley") {
                    
                    //Arrange
                    let item = Item(name: "PS5",
                                    id: "Item001",
                                    price: 750.00)
                    
                    //Act
                    trolleyViewModel.addItemToTrolley(item: item)
                    
                    //Asset
                    expect(trolleyViewModel.itemsInTrolley.count).to(equal(1))
                    
                    //A different way of using expect to assert a value
                    expect(trolleyViewModel.itemsInTrolley.count) == 1
                    expect(trolleyViewModel.itemsInTrolley[0].id) == "Item001"
                }
            }
        }
        
        context("Removing an item from my trolley") {
            describe("When the item is in my trolley") {
                it("Should remove the item") {
                    //Arrange
                    let item = Item(name: "PS5", id: "001", price: 1000.0)
                    trolleyViewModel.addItemToTrolley(item: item)
                    
                    //Act
                    try trolleyViewModel.removeItemFromTrolley(item: item)
                    expect(trolleyViewModel.itemsInTrolley.count).to(equal(0))
                    
                }
            }
            describe("When the item is not in my trolley") {
                it("Should thrown an error") {
                    //Arrange
                    let item = Item(name: "", id: "", price: 0.0)
                    
                    //Act and Assert
                    expect { try trolleyViewModel.removeItemFromTrolley(item: item) }
                        .to(throwError(TrolleyError.ItemNotInTrolley))
                }
            }
        }
        
        context("Returning to my order") {
            describe("when i load my saved order") {
                it("should load items into my trolley") {
                    
                    // Act
                    trolleyViewModel.getStoredTrolleyFromServer { }
                    
                    
                    // Assert
                    expect(trolleyViewModel.itemsInTrolley).toEventually(contain(Item(name: "PS5",
                                                                                      id: "Item0001",
                                                                                      price: 699.99),
                                                                                 Item(name: "iPad Pro",
                                                                                      id: "Item0002",
                                                                                      price: 999.99)),
                                                                         timeout: DispatchTimeInterval.seconds(1))
                }
            }
        }
    }
}

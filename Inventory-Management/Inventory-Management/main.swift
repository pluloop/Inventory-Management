//
//  main.swift
//  Inventory-Management
//
//  Created by StudentAM on 1/12/24.
//  Andy Nguyen
//  Program to add, remove, check availibility, restock, empty, and checkout items
//

import Foundation

// for printing availibility of items
var cerealStock: Double = 100.0
var milkStock: Double = 100.0
var syrupStock: Double = 100.0
var cupStock: Double = 100.0

// for printing cart summary
var cerealCart: Double = 0.0
var milkCart: Double = 0.0
var syrupCart: Double = 0.0
var cupCart: Double = 0.0

// to calculate total
var cerealCost: Double = 4.99
var milkCost: Double = 4.99
var syrupCost: Double = 3.99
var cupCost: Double = 2.99

// to store inputted id
var adminId: String = ""

// for printng summary
var total: Double = 0.0

// for calculating total
let TAX: Double = 0.0925

// to restock said item
func amountRestock(item: String) -> Double{
    print("How many units of \(item) would you like to restock?: ")
    if let quantityStr = readLine(), let quantityNum = Double(quantityStr){
        print("Restocked \(Int(quantityNum)) units of \(item)\n")
        return quantityNum // for adding to stock
    } else{
        return -1.0 // if number is not input
    }
}

// add item to cart
func addItem(){
    print("What would you like to add to cart? (Enter number of selection\n" +
          "1. Cereal\n" +
          "2. Milk\n" +
          "3. Syrup\n" +
          "4. Cup")
    var item: String = "" // to store item wanting to add
    
    if let itemStr = readLine(){
        switch itemStr{
        case "1":
            item = "Cereal"
        case "2":
            item = "Milk"
        case "3":
            item = "Syrup"
        case "4":
            item = "Cup"
        default:
            print("Invalid Input. Please select valid number.\n")
            mainMenu()
        }
    }
    
    // adding item to cart and removing from stock
    print("How many \(item)(s) would you like to add to your cart?: ")
    if let quantityStr = readLine(), let quantityNum = Double(quantityStr){
        switch item{
        case "Cereal":
            if quantityNum <= cerealStock{
                cerealStock -= quantityNum
                cerealCart += quantityNum
                total += cerealCart * cerealCost
            } else{
                print("Not enough cereal in stock!\n")
                mainMenu()
            }
        case "Milk":
            if quantityNum <= milkStock{
                milkStock -= quantityNum
                milkCart += quantityNum
                total += milkCart * milkCost
            } else{
                print("Not enough milk in stock!\n")
                mainMenu()
            }
        case "Syrup":
            if quantityNum <= syrupStock{
                syrupStock -= quantityNum
                syrupCart += quantityNum
                total += syrupCart * syrupCost
            } else{
                print("Not enough syrup in stock!\n")
                mainMenu()
            }
        case "Cup":
            if quantityNum <= cupStock{
                cupStock -= quantityNum
                cupCart += quantityNum
                total += cupCart * cupCost
            } else{
                print("Not enough cups in stock!\n")
                mainMenu()
            }
        default:
            print("Invalid Input. Please select valid number.\n")
            mainMenu()
        }
        
        // summary of what was added and total cost
        print("You have added \(Int(quantityNum)) \(item)(s) to your cart!")
        print("Current total is: \(total)\n")
    } else{
        print("Invalid input. Please please input valid number.\n")
    }
}

// remove item from cart
func removeItem(){
    print("What would you like to remove from cart? (Enter number of selection):\n" +
          "1. Cereal\n" +
          "2. Milk\n" +
          "3. Syrup\n" +
          "4. Cups")
    var item: String = "" // to store item for removal
    
    if let itemStr = readLine(){
        switch itemStr{
        case "1":
            item = "Cereal"
        case "2":
            item = "Milk"
        case "3":
            item = "Syrup"
        case "4":
            item = "Cup"
        default:
            print("Invalid Input. Please select valid number.\n")
            removeItem()
        }
    }
    
    // adding item to stock and removing from cart
    print("How many \(item) would you like to remove from your cart? (Enter number of selection): ")
    if let quantityStr = readLine(), let quantityNum = Double(quantityStr){
        switch item{
        case "Cereal":
            if quantityNum <= cerealCart{
                cerealStock += quantityNum
                cerealCart -= quantityNum
                total -= quantityNum * cerealCost
            } else{
                print("Cannot remove more than what you have in your cart!\n")
                mainMenu()
            }
        case "Milk":
            if quantityNum <= milkCart{
                milkStock += quantityNum
                milkCart -= quantityNum
                total -= quantityNum * milkCost
            } else{
                print("Cannot remove more than what you have in your cart!\n")
                mainMenu()
            }
        case "Syrup":
            if quantityNum <= syrupCart{
                syrupStock += quantityNum
                syrupCart -= quantityNum
                total -= quantityNum * syrupCost
            } else{
                print("Cannot remove more than what you have in your cart!\n")
                mainMenu()
            }
        case "Cup":
            if quantityNum <= cupCart{
                cupStock += quantityNum
                cupCart -= quantityNum
                total -= quantityNum * cupCost
            } else{
                print("Cannot remove more than what you have in your cart!\n")
                mainMenu()
            }
        default:
            print("Invalid Input. Please select valid number.\n")
            mainMenu()
        }
        
        // summary of what is removed and current total cost
        print("Removed \(quantityStr) from the cart!")
        print("Current total is: \(total)\n")
    } else{ // letter inputted print error notifying and let user choose again
        print("Invalid Input. Please select number.\n")
        removeItem()
    }
}

// gives availibility of inputted item
func checkStock(){
    print("What item would you like to check if it's in stock? (Enter number of selection\n" +
          "1. Cereal\n" +
          "2. Milk\n" +
          "3. Syrup\n" +
          "4. Cups")
    
    // printing stock ONE item
    if let itemStr = readLine(){
        switch itemStr{
        case "1":
            print("There are currently \(Int(cerealStock)) cereal(s) in stock!\n")
        case "2":
            print("There are currently \(Int(milkStock)) milk(s) in stock!\n")
        case "3":
            print("There are currently \(Int(syrupStock)) syrup(s) in stock!\n")
        case "4":
            print("There are currently \(Int(cupStock)) cup(s) in stock!\n")
        default:
            print("Invalid Input.\n")
            mainMenu()
        }
    } else{ // user input an item not valid print notifying and bring back to menu
        print("Invalid option!")
        mainMenu()
    }
}

// for checking availbility and restocking
func adminMenu(){
    if adminId == "0000"{ // 0000 is password
        print("Welcome to the Admin menu! Lets us know how we can help you (Enter number of selection):\n" +
              "1. Restock inventory\n" +
              "2. Generate report\n" +
              "3. Check number of items\n" +
              "4. Quit admin menu")
        
        if let option = readLine(){
            switch option{
            case "1": // for restocking
                print("What would you like to restock? (Enter number of selection):\n" +
                      "1. Cereal\n" +
                      "2. Milk\n" +
                      "3. Syrup\n" +
                      "4. Cups")
                
                // add said item to stock
                if let item = readLine(){
                    switch item{
                    case "1":
                        cerealStock += amountRestock(item: "Cereal")
                        adminMenu()
                    case "2":
                        milkStock += amountRestock(item: "Milk")
                        adminMenu()
                    case "3":
                        syrupStock += amountRestock(item: "Syrup")
                        adminMenu()
                    case "4":
                        cupStock += amountRestock(item: "Cup")
                        adminMenu()
                    default:
                        print("Invalid Input.")
                        adminMenu()
                    }
                } else{ // user input a letter print error and have user choose again
                    print("Please choose an appropriate option!")
                    adminMenu()
                }
                case "2": // for printing total items in cart and total cost
                    print("Summary Report:\n" +
                          "Remaining cereals: \(Int(cerealStock)) items\n" +
                          "Remaining milks: \(Int(milkStock)) items\n" +
                          "Remaining syrups: \(Int(syrupStock)) items\n" +
                          "Remaining cups: \(Int(cupStock)) items\n" +
                          "Remaining Inventory: \(Int(cerealStock + milkStock + syrupStock + cupStock)) items\n" +
                          "Total Sales: $\(total)\n")
                    adminMenu()
                case "3": // to check availibility of ONE item
                    checkStock()
                    adminMenu()
                case "4": // return main menu
                    print("Returning to normal menu")
                    mainMenu()
                default: // when appropriate number not inputted, give error and return back to admin commands for user to reenter
                    print("Please choose an appropriate option!")
                    adminMenu()
                }
        }
    } else{ // when appropriate number not inputted, give error and return back to admin commands for user to reenter
        print("Invalid Admin ID!\n")
        adminMenu()
    }
}

// summary of what is bought and total cost
func checkout(){
    print("Thanks for shopping with us!\n" +
          "You purchases the following:\n" +
          "Cereals: \(Int(cerealCart))\n" +
          "Milks: \(Int(milkCart))\n" +
          "Syrups: \(Int(syrupCart))\n" +
          "Cups: \(Int(cupCart))\n" +
          "Your grand total including tax (9.25%) is: \(total + (total * TAX))")
}

// empty cart (items you have are 0)
func emptyCart(){
    // add items back to stock
    cerealStock += cerealCart
    milkStock += milkCart
    syrupStock += syrupCart
    cupStock += cupCart
    // emptying cart
    cerealCart = 0
    milkCart = 0
    syrupCart = 0
    cupCart = 0
    total = 0
    
    // notify user that cart was empty
    print("Cart Emptied\n")
}

// to add, remove, check, empty, and checkout items or go to admin
func mainMenu(){
    print("Welcome to the grocery store! Lets us know how we can help you (Enter number of selection): \n" +
          "1. Add item to cart\n" +
          "2. Remove item for cart\n" +
          "3. Check if item is in stock\n" +
          "4. Admin Menu\n" +
          "5. Checkout\n" +
          "6. Empty Cart")
    
    if let userInputStr = readLine(), let userInputNum = Int(userInputStr){
        switch userInputNum{
        case 1: // add item to cart and back to main menu
            addItem()
            mainMenu()
        case 2: // remove item to cart and back to main menu
            removeItem()
            mainMenu()
        case 3: // check availibility and back to main menu
            checkStock()
            mainMenu()
        case 4: // to admin commands
            print("Enter Admin ID:")
            adminId = readLine() ?? "1" // ?? means force unwrapping (allows me to store what is inputted into adminId OR if wrong type it store "1"
            adminMenu()
        case 5: // printing what is in cart and total cost
            checkout()
        case 6: // put items back on shelf
            emptyCart()
            mainMenu()
        default: // error have user input again (none of numbers provided was typed)
            print("Please choose an appropriate option!\n")
            mainMenu()
        }
    }
}

mainMenu()

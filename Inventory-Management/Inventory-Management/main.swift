//
//  main.swift
//  Inventory-Management
//
//  Created by StudentAM on 1/12/24.
//

import Foundation

var cerealStock = 100
var milkStock = 100
var syrupStock = 100
var cupStock = 100

var cerealCart = 0
var milkCart = 0
var syrupCart = 0
var cupCart = 0

var adminId: String = ""

func addItem(){
    print("What would you like to add to cart? (Enter number of selection\n" +
          "1. Cereal\n" +
          "2. Milk\n" +
          "3. Syrup\n" +
          "4. Cup\n")
    var item: String = ""
    
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
        }
    }
    
    print("How many \(item)(s) would you like to add to your cart?: ")
    if let quantityStr = readLine(), let quantityNum = Int(quantityStr){
        switch item{
        case "Cereal":
            cerealStock -= quantityNum
            cerealCart += quantityNum
        case "Milk":
            milkStock -= quantityNum
            milkCart += quantityNum
        case "Syrup":
            syrupStock -= quantityNum
            syrupCart += quantityNum
        case "Cup":
            cupStock -= quantityNum
            cupCart += quantityNum
        default:
            print("Invalid Input. Please select valid number.\n")
        }
        
        print("You have added \(quantityNum) \(item)(s) to your cart!")
        print("Current total is: \n")
    } else{
        print("Invalid input. Please please input valid number.\n")
    }
}

func removeItem(){
    print("What would you like to remove from cart? (Enter number of selection):\n" +
          "1. Cereal\n" +
          "2. Milk\n" +
          "3. Syrup\n" +
          "4. Cups\n")
    var item: String = ""
    
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
        }
    }
    
    print("How many \(item) would you like to remove from your cart? (Enter number of selection): ")
    if let quantityStr = readLine(), let quantityNum = Int(quantityStr){
        switch item{
        case "Cereal":
            cerealStock += quantityNum
            cerealCart -= quantityNum
        case "Milk":
            milkStock += quantityNum
            milkCart -= quantityNum
        case "Syrup":
            syrupStock += quantityNum
            syrupCart -= quantityNum
        case "Cup":
            cupStock += quantityNum
            cupCart -= quantityNum
        default:
            print("Invalid Input. Please select valid number.\n")
        }
        
        print("Removed \(quantityStr) from the cart!")
        print("Current total is: \n")
    } else{
        print("Invalid Input. Please select number.\n")
    }
}

func checkStock(){
    print("What item would you like to check if it's in stock? (Enter number of selection\n" +
          "1. Cereal\n" +
          "2. Milk\n" +
          "3. Syrup\n" +
          "4. Cups\n")
    
    if let itemStr = readLine(){
        switch itemStr{
        case "1":
            print("There are currently \(cerealStock) cereals in stock!\n")
        case "2":
            print("There are currently \(milkStock) milk in stock!\n")
        case "3":
            print("There are currently \(syrupStock) milk in stock!\n")
        case "4":
            print("There are currently \(cupStock) milk in stock!\n")
        default:
            print("Invalid Input.")
        }
    }
}

func adminMenu(){
    if adminId == "0000"{
        print("Welcome to the Admin menu! Lets us know how we can help you (Enter number of selection):\n" +
              "1. Restock inventory\n" +
              "2. Generate report\n" +
              "3. Check number of items\n" +
              "4. Quit admin menu")
        
        if let option = readLine(){
            switch option{
            case "1":
                print("What would you like to restock? (Enter number of selection):\n" +
                      "1. Cereal\n" +
                      "2. Milk\n" +
                      "3. Syrup\n" +
                      "4. Cups\n")
                
                if let item = readLine(){
                    print("How many units of cup would you like to restock?: \n")
                    if let quantityStr = readLine(), let quantityNum = Int(quantityStr){
                        switch item{
                        case "1":
                            cerealStock += quantityNum
                        case "2":
                            milkStock += quantityNum
                        case "3":
                            syrupStock += quantityNum
                        case "4":
                            cupStock += quantityNum
                        default:
                            print("Invalid Input.")
                        }
                    }
                } else{
                    print("Please choose an appropriate option!")
                }
            case "2":
                print("Summary Report:\n" +
                      "Remaining cereals: \(cerealStock) items\n" +
                      "Remaining milks: \(milkStock) items\n" +
                      "Remaining syrups: \(syrupStock) items\n" +
                      "Remaining cups: \(cupStock) items\n" +
                      "Remaining Inventory: \(cerealStock + milkStock + syrupStock + cupStock) items\n" +
                      "Total Sales: $0.0\n")
            case "3":
                checkStock()
            case "4":
                print("Returning to normal menu")
                mainMenu()
            default:
                print("Please choose an appropriate option!")
            }
            
            adminMenu()
        }
    } else{
        print("Invalid Admin ID!\n")
    }
}

func checkout(){
    print("Thanks for shopping with us!\n" +
          "You purchases the following:\n" +
          "Cereals: \(cerealCart)\n" +
          "Milks: \(milkCart)\n" +
          "Syrups: \(syrupCart)\n" +
          "Cups: \(cupCart)\n" +
          "Your grand total including tax (9.25%) is: 0.00")
}

func mainMenu(){
    print("Welcome to the grocery store! Lets us know how we can help you (Enter number of selection): \n" +
          "1. Add item to cart\n" +
          "2. Remove item for cart\n" +
          "3. Check if item is in stock\n" +
          "4. Admin Menu\n" +
          "5. Checkout")
    
    if let userInputStr = readLine(), let userInputNum = Int(userInputStr){
        switch userInputNum{
        case 1:
            addItem()
            mainMenu()
        case 2:
            removeItem()
            mainMenu()
        case 3:
            checkStock()
            mainMenu()
        case 4:
            print("Enter Admin ID:")
            adminId = readLine() ?? "1"
            adminMenu()
        case 5:
            checkout()
        default:
            print("Please choose an appropriate option!")
            mainMenu()
        }
    }
}

mainMenu()

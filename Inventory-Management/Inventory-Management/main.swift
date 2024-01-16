//
//  main.swift
//  Inventory-Management
//
//  Created by StudentAM on 1/12/24.
//

import Foundation

var stock: [String: Int] = ["Cereal": 100,
                            "Milk": 100,
                            "Syrup": 100,
                            "Cup": 100]

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
            print("Invalid Input. Please select valid number.")
        }
    }
    
    print("How many \(item)(s) would you like to add to your cart?: ")
    if let quantity = readLine(){
        print("You have added \(quantity) \(item)(s) to your cart!")
        print("Current total is: ")
    } else{
        print("Invalid Input. Please select number.")
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
            print("Invalid Input. Please select valid number.")
        }
    }
    
    print("How many \(item) would you like to remove from your cart? (Enter number of selection): ")
    if let quantity = readLine(){
        print("Removed \(quantity) from the cart!")
        print("Current total is: ")
    } else{
        print("Invalid Input. Please select number.")
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
            let cerealStock: Int = stock["Cereal"]!
            print("There are currently \(cerealStock) cereals in stock!")
        case "2":
            let milkStock: Int = stock["Milk"]!
            print("There are currently \(milkStock) milk in stock!")
        case "3":
            let syrupStock: Int = stock["Syrup"]!
            print("There are currently \(syrupStock) milk in stock!")
        case "4":
            let cupStock: Int = stock["Cup"]!
            print("There are currently \(cupStock) milk in stock!")
        default:
            print("Invalid Input. Please select valid number.")
        }
    }
}

func mainMenu(){
    print("1. Add item to cart\n" +
          "2. Remove item for cart\n" +
          "3. Check if item is in stock\n" +
          "4. Admin Menu\n" +
          "5. Checkout\n")
    
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
        default:
            print("Invalid Input. Please select valid number.")
            mainMenu()
        }
    }
}

mainMenu()

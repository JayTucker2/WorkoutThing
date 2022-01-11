//
//  ViewController.swift
//  WorkoutThing
//
//  Created by JAYLAN TUCKER on 1/10/22.
//  Edited by Brent Blitek

import UIKit

class ViewController: UIViewController {
    var foods : [FoodItems] = []
    override func viewDidLoad() {
        foods.append(FoodItems.init(foods: "Steak", cals: 679))
        foods.append(FoodItems.init(foods: "Chicken", cals: 231))
        foods.append(FoodItems.init(foods: "Rice", cals: 206))
        foods.append(FoodItems.init(foods: "Cheeseburger", cals: 535))
        foods.append(FoodItems.init(foods: "Pizza(Per Slice)", cals: 285))
        foods.append(FoodItems.init(foods: "Turkey(Per Slice)", cals: 54))
        foods.append(FoodItems.init(foods: "Potatoes(Per Potato)", cals: 163))
        foods.append(FoodItems.init(foods: "Spaghetti", cals: 221))
        foods.append(FoodItems.init(foods: "Ham(Per Slice)", cals: 263))
        foods.append(FoodItems.init(foods: "Ramen", cals: 188))
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        


    }
}

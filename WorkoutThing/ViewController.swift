//
//  ViewController.swift
//  WorkoutThing
//
//  Created by JAYLAN TUCKER on 1/10/22.
//  Edited by Brent Blitek

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var foods : [FoodItems] = []
    var dailies = 0
    @IBOutlet weak var newFood: UITextField!
    @IBOutlet weak var newCals: UITextField!
    
    @IBOutlet weak var dailyCalories: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var foodItemsPickerView: UIPickerView!
    
    var pickerData:[String] = [String]()
    
    override func viewDidLoad() {
        foods.append(FoodItems.init(food: "Steak", cals: 679))
        foods.append(FoodItems.init(food: "Chicken", cals: 231))
        foods.append(FoodItems.init(food: "Rice", cals: 206))
        foods.append(FoodItems.init(food: "Cheeseburger", cals: 535))
        foods.append(FoodItems.init(food: "Pizza(Per Slice)", cals: 285))
        foods.append(FoodItems.init(food: "Turkey(Per Slice)", cals: 54))
        foods.append(FoodItems.init(food: "Potatoes(Per Potato)", cals: 163))
        foods.append(FoodItems.init(food: "Spaghetti", cals: 221))
        foods.append(FoodItems.init(food: "Ham(Per Slice)", cals: 263))
        foods.append(FoodItems.init(food: "Cup Ramen", cals: 188))
      
        self.foodItemsPickerView.delegate = self
        self.foodItemsPickerView.dataSource = self
        
        pickerData = ["num 1","num 2","num 3"]
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        //how many wheels
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return foods.count
        //how many elements
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return foods[row].food
        //storing items in pickerview
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       print(foods[row])
    }
    @IBAction func newButton(_ sender: Any) {
        foods.append(FoodItems.init(food: "\(newFood)", cals: newCals))
    }
    
//    dailyCalories.text = "\(dailies)"
    
}

//
//  ViewController.swift
//  WorkoutThing
//
//  Created by JAYLAN TUCKER on 1/10/22.
//  Edited by Brent Blitek

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource{
    
    
    
    
    
    var foods : [FoodItems] = []
    var eatenFoods : [FoodItems] = []
    var dailies = 0
     var calls = 0
    var selectedRow = 0
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var tableOutlet: UITableView!
    @IBOutlet weak var dailyCalories: UILabel!
    @IBOutlet weak var foodItemsPickerView: UIPickerView!
    
    func save(){
        let encoder = JSONEncoder()
        if let encoded = try?
            encoder.encode(foods){
            UserDefaults.standard.set(encoded, forKey: "theFoods")
        }
    }
    func save2(){
        let encoder = JSONEncoder()
        if let encoded = try?
            encoder.encode(eatenFoods){
            UserDefaults.standard.set(encoded, forKey: "eatenFoods")
        }
    }
    override func viewDidLoad() {
        dailyCalories.text = "\(calls)"
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
      
        if let items = UserDefaults.standard.data(forKey: "theFoods"){
            let decoder = JSONDecoder()
            if let decoded = try?
                decoder.decode([FoodItems].self, from: items){
                foods = decoded
            }
        }
        if let items = UserDefaults.standard.data(forKey: "eatenFoods"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([FoodItems].self, from: items){
                eatenFoods = decoded
            }
        }
        self.foodItemsPickerView.delegate = self
        self.foodItemsPickerView.dataSource = self
        
        self.tableOutlet.delegate = self
        self.tableOutlet.dataSource = self
        let sortedFoods = foods.sorted{ $0.food < $1.food }
        print(sortedFoods)
        
        foods.sort{ $0.food < $1.food }
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
        return "\(foods[row].food): \(foods[row].cals) calories"
        //storing items in pickerview
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedRow = row
       print(foods[row])
    }
    
    
//    dailyCalories.text = "\(dailies)"
    

    
    
    @IBAction func newButton(_ sender: Any) {
        
            var newFood : String = String(textField1.text!)
            var newCalsString : String = (textField2.text!)
            var newCals = 0
            
        
        if newFood == ""{ let alert = UIAlertController(title: "Error", message: "Please enter a food", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            return
        }
        newFood = newFood.prefix(1).uppercased() + newFood.suffix(newFood.count - 1)
        if let temp = Int(newCalsString){
            newCals = temp
        } else { let alert = UIAlertController(title: "Error", message: "Please enter a valid amount of calories", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
                foods.append(FoodItems.init(food: "\(newFood)", cals: Int(newCals)))
                print(newFood)
                foodItemsPickerView.reloadAllComponents()
                save()
                
            if newFood == nil{
                let alert = UIAlertController(title: "Error", message: "Please enter a valid food", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        foods.sort{ $0.food < $1.food }
        foodItemsPickerView.reloadAllComponents()
        
        
            
             
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eatenFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOutlet.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
            cell.textLabel?.text = eatenFoods[indexPath.row].food
            cell.detailTextLabel?.text = String(eatenFoods[indexPath.row].cals)
            return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            eatenFoods.remove(at: indexPath.row)
            tableOutlet.reloadData()
            save2()
//            calls = calls - Int(eatenFoods
            dailyCalories.text = "\(calls)"
    }
}
    @IBAction func addToTotalButton(_ sender: UIButton) {
        calls = calls + foods[selectedRow].cals
        dailyCalories.text = "\(calls)"
//        eatenFoods = String(foods[selectedRow].food)
//        eatenCals = foods[selectedRow].cals
        eatenFoods.append(foods[selectedRow])
        print("hi")
        print(eatenFoods[0].food)
        tableOutlet.reloadData()
        save2()
    }
    @IBAction func clearCalsButton(_ sender: UIButton) {
        calls = 0
        dailyCalories.text = "\(calls)"
        eatenFoods.removeAll()
        tableOutlet.reloadData()
        save2()
    }
    @IBAction func removeButton(_ sender: Any) {
            foods.remove(at: selectedRow)
            foodItemsPickerView.reloadAllComponents()
        save()
    }
    
    
}


//
//  ViewController.swift
//  WorkoutThing
//
//  Created by JAYLAN TUCKER on 1/10/22.
//  Edited by Brent Blitek

import UIKit

class ViewController: UIViewController{

    

    @IBOutlet weak var foodItemsPickerView: UIPickerView!
    
    var pickerData:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       

        self.foodItemsPickerView.delegate = self
        self.foodItemsPickerView.dataSource = self
        
        pickerData = ["num 1","num 2","num 3"]
    }
//    override func didReceiveMemoryWarning() {
//            super.didReceiveMemoryWarning()
//    }
    extension ViewController: UIPickerViewDataSource{
        
    }
    extension ViewController: UIPickerViewDelegate{
        
    }
}


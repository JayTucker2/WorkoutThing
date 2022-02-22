//
//  DatePicker.swift
//  WorkoutThing
//
//  Created by JAYLAN TUCKER on 2/8/22.
//

import UIKit

class DatePicker: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    static var string = ""
    var tempString = ""
    override func viewDidLoad() {
//
//        DatePicker.string = tempString
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        tempString = dateFormatter.string(from: datePicker.date)
        print(tempString)
        DatePicker.string = tempString
        print(DatePicker.string)
        tempString = ""
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
        if #available(iOS 14, *){
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.sizeToFit()
            
        }
    }
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/MM/yyyy"

        let strDate = dateFormatter.string(from: datePicker.date)
        tempString = strDate
    }
    
    @IBAction func createButton(_ sender: Any) {
        if DatePicker.string == ""{
        DatePicker.string = tempString
        tempString = ""
        }
    }
    
}

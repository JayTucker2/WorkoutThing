//
//  DatePicker.swift
//  WorkoutThing
//
//  Created by JAYLAN TUCKER on 2/8/22.
//

import UIKit

class DatePicker: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let strDate = dateFormatter.string(from: datePicker.date)
        DateClass.init(date: strDate)
    }
    
}

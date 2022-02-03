//
//  dailyVC.swift
//  WorkoutThing
//
//  Created by Jaylan Tucker on 2/2/22.
//

import UIKit

class dailyVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    var dates : [String] = []
    @IBOutlet weak var tableCell: UITableViewCell!
    

    override func viewDidLoad() {
        dates.append("2/1")
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   

}

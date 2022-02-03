//
//  dailyVC.swift
//  WorkoutThing
//
//  Created by Jaylan Tucker on 2/2/22.
//

import UIKit

class dailyVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var tableOutlet: UITableView!
    var dates : [String] = []
    
    
    override func viewDidLoad() {
        dates.append("2/1")
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = dates[indexPath.row]
        return cell
    }

}

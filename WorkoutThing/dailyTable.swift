//
//  DailyTable.swift
//  WorkoutThing
//
//  Created by JAYLAN TUCKER on 2/8/22.
//

import UIKit

class DailyTable: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var tableOutlet: UITableView!
    var dates : [DateClass] = []
    var inc = ""
    override func viewDidLoad() {
        tableOutlet.delegate = self
        tableOutlet.dataSource = self
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if DatePicker.string == ""{
            tableOutlet.reloadData()
        }
        else {
            dates.append(DateClass.init(date: "\(DatePicker.string)"))
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = dates[indexPath.row].date
        cell.detailTextLabel?.text = "Hi"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath){
        performSegue(withIdentifier: "Segue1", sender: self)
    }
}

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
        
        dates.append(DateClass.init(date: "09/02/2022"))
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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


}

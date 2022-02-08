//
//  DailyTable.swift
//  WorkoutThing
//
//  Created by JAYLAN TUCKER on 2/8/22.
//

import UIKit

class DailyTable: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var tableOutlet: UITableView!
    var dates : [String] = []
    let dateArray = ["1 February, 2022", "2 February, 2022", "3 February, 2022"]
    var convertedArray : [Date] = []
    var dateFormatter = DateFormatter()
    
    
    let date = Date()
    override func viewDidLoad() {
        tableOutlet.delegate = self
        tableOutlet.dataSource = self
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        for dat in dateArray {
            var date = dateFormatter.date(from: dat)
            if let date = date{
                convertedArray.append(date)
            }
        }
        var ready = convertedArray.sorted(by: {$0.compare($1) == .orderedDescending})
        print(ready)
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
        cell.detailTextLabel?.text = "Hi"
        return cell
    }


}

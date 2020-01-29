//
//  ColorsTableTableViewController.swift
//  Rainbow
//
//  Created by Chris Price on 11/12/19.
//  Copyright © 2019 Chris Price. All rights reserved.
//

import UIKit

class ColorsTableViewController: UITableViewController {
    
    var colors: [MyColor] = [MyColor(name: "Red", color: .red),
                             MyColor(name: "Orange", color: .orange),
                             MyColor(name: "Yellow", color: .yellow),
                             MyColor(name: "Green", color: .green),
                             MyColor(name: "Blue", color: .blue),
                             MyColor(name: "Indigo", color: .cyan),
                             MyColor(name: "Purple", color: .purple)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    // Require data source method. Referred to by the sender of the func- numberOfRows
    // How many rows in the table view app
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

   // Required data source method - cellForRowAt
   // What data is in each cell
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        
    //The index path looks like (0, 0) to the computer. That would be the first section and first cell. Then (0, 1)...(0, 7)
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name
        
        //So this dynamically references the row at that index path.
        
        cell.textLabel?.text = color.name
        

        return cell
    }


 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "ShowColorSegue" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let colorDetailVC = segue.destination as?
                ColorDetailViewController else { return }
            
            let color = colors[indexPath.row]
            colorDetailVC.cellColor = color
        }
        
        // Pass the selected object to the new view controller.
    }


}

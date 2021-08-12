//
//  PracticeHistoryTableViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 15/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class PracticeHistoryTableViewController: UITableViewController {
    //MARK: Variables and constants
    let theme = ThemeManager.currentTheme()
    var practiceTableData = [PracticeData]()
    
    //MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        if let savedPracticeData = PracticeData.loadFromFile() {
            practiceTableData = savedPracticeData
        } else {
            practiceTableData = PracticeData.loadOriginalPracticeData()
        }
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        view.backgroundColor = theme.backgroundColor
        
        if let savedPracticeData = PracticeData.loadFromFile() {
            practiceTableData = savedPracticeData
        } else {
            practiceTableData = PracticeData.loadOriginalPracticeData()
        }
    }
    
    // MARK: - Table view Overides
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return practiceTableData.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        for i in (0..<practiceTableData.count) {
            if section == i {
                title = practiceTableData[i].date
            }
        }
        return title
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = theme.tableHeaderBackground
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 15))
        header.textLabel?.textColor = theme.textColour
        //header.textLabel?.textAlignment = .center
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rowNum = 0
        for i in (0..<practiceTableData.count) {
            if section == i {
                rowNum = practiceTableData[i].internalData.count
            }
        }
        return rowNum
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PracticeHistoryDataCell", for: indexPath) as! PracticeHistoryTableViewCell
        
        // Configure the cell...
        
        
        let date = practiceTableData[indexPath.section].date
        let topics = practiceTableData[indexPath.section].internalData[indexPath.row].topics
        let accuracy = practiceTableData[indexPath.section].internalData[indexPath.row].accuracy
        let time = practiceTableData[indexPath.section].internalData[indexPath.row].time
        
        
        
        
        cell.updatePracticeHistory(with: date, time: time, topics: topics, accuracy: accuracy, row: indexPath.row)
        
        return cell
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

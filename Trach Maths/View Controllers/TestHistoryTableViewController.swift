//
//  TestHistoryTableViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 24/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class TestHistoryTableViewController: UITableViewController {
    let theme = ThemeManager.currentTheme()
    var testHistoryData = [TestHistoryData]()
    
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        if let savedTestData = TestHistoryData.loadFromFile() {
            testHistoryData = savedTestData
        } else {
            testHistoryData = TestHistoryData.loadOriginalPracticeData()
        }
        
        tableView .reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        
    }
    
    // MARK: - Table view Overides
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return testHistoryData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rowNum = 0
        for i in (0..<testHistoryData.count) {
            if section == i {
                rowNum = testHistoryData[i].internalData.count
            }
        }
        return rowNum
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        for i in (0..<testHistoryData.count) {
            if section == i {
                title = testHistoryData[i].date
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
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testHistoryCell", for: indexPath) as! TestHistoryTableViewCell
        
        // Configure the cell...
        
        
        let date = testHistoryData[indexPath.section].date
        let topics = testHistoryData[indexPath.section].internalData[indexPath.row].topics
        let accuracy = testHistoryData[indexPath.section].internalData[indexPath.row].accuracy
        let time = testHistoryData[indexPath.section].internalData[indexPath.row].time
        
        
        
        
        cell.updateTestHistoryCell(date: date, time: time, topics: topics, accuracy: accuracy)
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

//
//  InfoScreenTableViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 16/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class InfoScreenTableViewController: UITableViewController {
    // MARK: - variables and constants
    let theme = ThemeManager.currentTheme()
    var tableData = [InfoData]()
    
    // MARK: IBAction
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        self.view.backgroundColor = theme.backgroundColor
        tableData = InfoData.returnInfoData()
        
    }
    
    // MARK: - Table view overides
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        for i in (0..<tableData.count) {
            if section == i {
                title = tableData[i].title
            }
        }
        
        return title
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = theme.tableHeaderBackground
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 20))
        header.textLabel?.textColor = theme.textColour
        header.textLabel?.textAlignment = .center
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath)
        
        cell.textLabel?.text = tableData[indexPath.section].info
        // Configure the cell...
        //cell.backgroundColor = theme.backgroundColor
        cell.textLabel?.textColor = theme.textColour
        cell.textLabel?.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 17))
        cell.textLabel?.numberOfLines = 0;
        //cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        return cell
    }
    
}

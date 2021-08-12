//
//  AboutTableViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 6/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class IntroductionTableViewController: UITableViewController {
    
    //MARK: - Variables and Constants
    let theme = ThemeManager.currentTheme()
    var introTableData = [InfoData]()
    var learnTableData = [Chapters]()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        self.view.backgroundColor = theme.backgroundColor
        introTableData = InfoData.returnInfoData()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        if let savedChapters = Chapters.loadFromFile() {
            learnTableData = savedChapters
        } else {
            learnTableData = Chapters.loadOriginalChapters()
        }
        //print(learnTableData)
        learnTableData[0].chapterTitle[3].isComplete = true
        learnTableData[1].chapterTitle[0].unlockedCell = true
        //print("view dissapeared")
        //print(learnTableData)
        Chapters.saveToFile(tableData: learnTableData)
    }
    
    // MARK: - Table view overides
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return introTableData.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        for i in (0..<introTableData.count) {
            if section == i {
                title = introTableData[i].title
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "IntroCell", for: indexPath)
        
        cell.textLabel?.text = introTableData[indexPath.section].info
        // Configure the cell...
        //cell.backgroundColor = theme.backgroundColor
        cell.textLabel?.textColor = theme.textColour
        cell.textLabel?.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 17))
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.textAlignment = .justified
        //cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        return cell
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let viewController = segue.destination as! LearnTableViewController
    //        var destinationViewController = segue.destination
    //        if let navigationController = destinationViewController as? UINavigationController {
    //            destinationViewController = navigationController.visibleViewController ?? destinationViewController
    //        }
    //
    //        // your new view controller should have property that will store passed value
    //        viewController.tableData[1].chapterTitle[0].unlockedCell = true
    //        print(viewController.tableData)
    //        //viewController.tableView.reloadData()
    //        //Chapters.saveToFile(tableData: viewController.tableData)
    //        //Chapters.loadOriginalChapters()[1].chapterTitle[1] = true
    //    }
    
}

//
//  LearnTableViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 10/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class LearnTableViewController: UITableViewController {
    
    let theme = ThemeManager.currentTheme()
    var tableData = [Chapters]()
    var sectionRowIndex = (section: 0, row: 0)
//    var section: Int?
//    var row: Int?
    var multiplier: BasicMultiplicationMultiplier!
    //var chapter = [Chapters]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        
        if let savedChapters = Chapters.loadFromFile() {
            tableData = savedChapters
        } else {
            tableData = Chapters.loadOriginalChapters()
        }
        //Chapters.saveToFile(tableData: tableData)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = theme.backgroundColor
        //title = "Learn"
        
        //print(tableData)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //print("View did appear")
        if let savedChapters = Chapters.loadFromFile() {
            tableData = savedChapters
        } else {
            tableData = Chapters.loadOriginalChapters()
        }
        
        tableView.reloadData()
        //print(tableData)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tableData.count
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        for i in (0..<tableData.count) {
            if section == i {
                title = tableData[i].sectionHeader
            }
        }
        return title
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = theme.tableHeaderBackground
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 20))
        header.textLabel?.textColor = theme.textColour
        //header.textLabel?.textAlignment = .center
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rowNum = 0
        for i in (0..<tableData.count) {
            if section == i {
                rowNum = tableData[i].chapterTitle.count
            }
        }
        return rowNum
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Learn Table Cell", for: indexPath) as! LearnTableViewCell
        //cell.textLabel?.text = tableData[indexPath.row]
        // Configure the cell...
        cell.backgroundColor = theme.backgroundColor
        let cellData = tableData[indexPath.section].chapterTitle[indexPath.row].chapterTitle
        let lockUnlock = tableData[indexPath.section].chapterTitle[indexPath.row].unlockedCell
        let isComplete = tableData[indexPath.section].chapterTitle[indexPath.row].isComplete
        
        if lockUnlock {
            cell.shouldDisableTouches = false
        } else {
            cell.shouldDisableTouches = true
        }
        
        
        cell.update(with: cellData, unlocked: lockUnlock, isComplete: isComplete)
        return cell
    }
    
    
    
    
    //    MARK: - Navigation
    // FIXME: un-comment prior to completion?
    //    @IBAction func unwindToLearnTableController(segue: UIStoryboardSegue) {
    //        //let sourceViewController = segue.source as! IntroductionTableViewController
    //        tableData[1].chapterTitle[0].unlockedCell = true
    //        tableView.reloadData()
    //        Chapters.saveToFile(tableData: tableData)
    //        print(Chapters.loadFromFile()!)
    //    }
    //    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected section #\(indexPath.section) cell #\(indexPath.row)!")
        
        sectionRowIndex.section = indexPath.section
        sectionRowIndex.row = indexPath.row
        
        switch indexPath.section {
        case 0:
            
            switch indexPath.row {
            case 3:
                performSegue(withIdentifier: "Concepts", sender: self)
            default:
                performSegue(withIdentifier: "AboutAndAcknowledgements", sender: self)
                
            }
            
        case 1:
            switch indexPath.row {
            case 0: multiplier = BasicMultiplicationMultiplier.eleven
            case 1: multiplier = BasicMultiplicationMultiplier.twelve
            case 2: multiplier = BasicMultiplicationMultiplier.five
            case 3: multiplier = BasicMultiplicationMultiplier.six
            case 4: multiplier = BasicMultiplicationMultiplier.seven
            case 5: multiplier = BasicMultiplicationMultiplier.nine
            case 6: multiplier = BasicMultiplicationMultiplier.eight
            case 7: multiplier = BasicMultiplicationMultiplier.four
            case 8: multiplier = BasicMultiplicationMultiplier.three
            default:
                multiplier = nil
            }
            performSegue(withIdentifier: "BasicMultiplicationSection", sender: self)
            
        case 3:
            performSegue(withIdentifier: "AboutAndAcknowledgements", sender: self)
            
        default:
            
            print("You messed up the segues for the Learn Table")
            
        
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "BasicMultiplicationSection") {
            
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! BasicMultiplicationViewController
            
            // your new view controller should have property that will store passed value
            viewController.multiplier = multiplier
            
            
        } else if segue.identifier == "AboutAndAcknowledgements" {
            let viewController = segue.destination as! AboutAndAcknowledgeViewController
            viewController.sectionRowIndex = sectionRowIndex
        }
        
    }

}


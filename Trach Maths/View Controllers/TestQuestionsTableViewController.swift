//
//  TestQuestionsTableViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 24/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class TestQuestionsTableViewController: UITableViewController {
    
    // MARK: - Variables and constants
    
    let theme = ThemeManager.currentTheme()
    
    var questionsArray: [Questions]!
    var testData = [TestHistoryData]()
    var wrongCount: Int!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        
        view.backgroundColor = theme.backgroundColor
        
        
        if let savedTestData = TestHistoryData.loadFromFile() {
            testData = savedTestData
        } else {
            testData = TestHistoryData.loadOriginalPracticeData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alertController = UIAlertController(title: "Score", message: "You scored \(questionsArray.count - wrongCount!) out of \(questionsArray.count): \(testData[0].internalData[0].accuracy)%", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(ok)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Table view overides
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Results"
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = theme.tableHeaderBackground
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Futura-bold", size: Helper.setCustomFont(originalFont: 20))
        header.textLabel?.textColor = theme.textColour
        header.textLabel?.textAlignment = .center
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return questionsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestQuestionCell", for: indexPath) as! TestQuestionsTableViewCell
        
        let cellData = questionsArray[indexPath.row]
        
        // Configure the cell...
        cell.updateCell(question: cellData)
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    @IBAction func unwindToTestChoice(unwindSegue: UIStoryboardSegue) {
        
    }
    
    //    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        // Get the new view controller using segue.destination.
    //        // Pass the selected object to the new view controller.
    //    }
    
    
}

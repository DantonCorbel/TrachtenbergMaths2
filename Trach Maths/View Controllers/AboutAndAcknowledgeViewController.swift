//
//  AboutTableViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 8/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class AboutAndAcknowledgeViewController: UIViewController, UITextViewDelegate {
    // MARK:- Variables and constants
    let theme = ThemeManager.currentTheme()
    var data = [AboutData]()
    var sectionRowIndex = (section: 0, row: 0)
    var learnTableData = [Chapters]()
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        data = AboutData.returnData()
        ThemeManager.applyTheme(theme: theme)
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = theme.backgroundColor
        //navigationItem.largeTitleDisplayMode = .always
        
        setupLabels()
        
        if let savedChapters = Chapters.loadFromFile() {
            learnTableData = savedChapters
        } else {
            learnTableData = Chapters.loadOriginalChapters()
        }
        learnTableData[sectionRowIndex.section].chapterTitle[sectionRowIndex.row].isComplete = true
        //learnTableData[sectionRowIndex.section].chapterTitle[sectionRowIndex.row].unlockedCell = true
        
        Chapters.saveToFile(tableData: learnTableData)
        
    }
    
    
    // MARK: - Functions
    func setupLabels() {
        titleLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 25))
        titleLabel.textColor = theme.orangeColor
        infoLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 17))
        infoLabel.textColor = theme.textColour
        infoLabel.textAlignment = .justified
        
        infoTextField.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 25))
        infoTextField.textColor = theme.textColour
        infoTextField.textAlignment = .justified
        infoTextField.backgroundColor = theme.backgroundColor
        
        if sectionRowIndex.section == 0 {
            titleLabel.text = data[sectionRowIndex.row].title
            infoLabel.text = data[sectionRowIndex.row].info
        } else {
            let row = sectionRowIndex.row + 3
            titleLabel.text = data[row].title
            if row == 3 {
                infoLabel.text = data[row].info
            } else {
                let attributedString = NSMutableAttributedString(string: data[4].info)
                print(attributedString)
                attributedString.addAttribute(.link, value: "https://www.icons8.com", range: NSRange(location: 12, length: 6))
                attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: 44, length: 18))
                attributedString.addAttribute(.link, value: "https://medium.com", range: NSRange(location: 64, length: 6))
                attributedString.addAttribute(.link, value: "https://stackoverflow.com", range: NSRange(location: 72, length: 13))
                
                infoTextField.attributedText = attributedString
                infoLabel.isHidden = true
                infoTextField.isHidden = false
            }
        }
    }
    
    func getHTMLtext() {
        let attributedString = NSMutableAttributedString(string: data[4].info)
        attributedString.addAttribute(.link, value: "https://www.icons8.com", range: NSRange(location: 12, length: 6))
        
        infoLabel.attributedText = attributedString
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
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

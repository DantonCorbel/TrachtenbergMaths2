//
//  PracticeHistoryTableViewCell.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 15/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class PracticeHistoryTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var topicsLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    
    
    // MARK: - cell overides
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Function
    func updatePracticeHistory(with date:String, time:String, topics: [String], accuracy: Int, row: Int) {
        
        let joinedArray = topics.joined(separator: ", ")
        
        // if row > 0 {
        dateLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 12))
        topicsLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 12))
        accuracyLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 12))
        // }
        
        
        //let accuracyInt = Int(accuracy)
        
        //        if accuracy == 100 {
        //            accuracyLabel.textColor = ThemeManager.currentTheme().darkerGreen
        //        } else if accuracy >= 90 {
        //            accuracyLabel.textColor = .orange
        //        } else {
        //            accuracyLabel.textColor = .red
        //        }
        
        if accuracy == 100 {
            accuracyLabel.backgroundColor = ThemeManager.currentTheme().darkerGreen
        } else if accuracy >= 90 {
            accuracyLabel.backgroundColor = UIColor(red: 0.64, green: 0.80, blue: 0.22, alpha: 1.00)
        } else  if accuracy >= 80 {
            accuracyLabel.backgroundColor = UIColor(red: 0.77, green: 0.90, blue: 0.22, alpha: 1.00)
        } else  if accuracy >= 70 {
            accuracyLabel.backgroundColor = UIColor(red: 1.00, green: 0.76, blue: 0.07, alpha: 1.00)
        } else  if accuracy >= 60 {
            accuracyLabel.backgroundColor = UIColor(red: 0.97, green: 0.62, blue: 0.12, alpha: 1.00)
        } else  if accuracy >= 50 {
            accuracyLabel.backgroundColor = UIColor(red: 0.93, green: 0.35, blue: 0.14, alpha: 1.00)
        } else  if accuracy >= 40 {
            accuracyLabel.backgroundColor = UIColor(red: 0.92, green: 0.13, blue: 0.15, alpha: 1.00)
        }
        
        
        dateLabel.text = time
        topicsLabel.text = joinedArray
        //        if row == 0 {
        //            accuracyLabel.text = "Accuracy"
        //            accuracyLabel.backgroundColor = .none
        //            accuracyLabel.textColor = ThemeManager.currentTheme().textColour
        dateLabel.textColor = ThemeManager.currentTheme().textColour
        topicsLabel.textColor = ThemeManager.currentTheme().textColour
        //} else {
        accuracyLabel.text = "\(accuracy)%"
        accuracyLabel.textColor = .black
        // }
        
    }
    
}



//
//  TestQuestionsTableViewCell.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 24/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class TestQuestionsTableViewCell: UITableViewCell {
    // MARK: Variables and constants
    let theme = ThemeManager.currentTheme()
    
    //MARK: Outlets
    @IBOutlet weak var questioNumberLabel: UILabel!
    @IBOutlet weak var multiplicandLabel: UILabel!
    @IBOutlet weak var multiplierLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    // MARK: Cell overides
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Functions
    
    func updateCell(question: Questions) {
        questioNumberLabel.text = "\(String(question.number)))"
        multiplicandLabel.text = question.multiplicand
        multiplierLabel.text = "x \(question.multiplier) ="
        resultsLabel.text = question.result
        if question.givenAnswer == "" {
            answerLabel.text = "0"
        } else {
        answerLabel.text = question.givenAnswer
        }
        
        if question.givenAnswer == question.result {
            answerLabel.textColor = theme.darkerGreen
        } else {
            answerLabel.textColor = theme.orangeColor
        }
    }
    
    
    
}

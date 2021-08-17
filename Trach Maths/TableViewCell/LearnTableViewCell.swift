//
//  LearnTableViewCell.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 10/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class LearnTableViewCell: UITableViewCell {
    //MARK: - Variables and constants
    let theme = ThemeManager.currentTheme()
    var shouldDisableTouches: Bool = false
    
//MARK: - Outlets
    @IBOutlet var lockUnlockedLabel: UILabel!
    
    @IBOutlet var detailLabel: UILabel!
    
    // MARK: - Cell overides
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !shouldDisableTouches { super.touchesBegan(touches, with: event) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !shouldDisableTouches { super.touchesEnded(touches, with: event) }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    // MARK: - function
    
    func update(with cellData: String, unlocked: Bool, isComplete: Bool) {
        detailLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 17))
        
        if unlocked && !isComplete {
            lockUnlockedLabel.text = " "
        } else if unlocked {
            lockUnlockedLabel.text = "✅"
            //lockUnlockedLabel.isEnabled = true
            //detailLabel.isEnabled = true
            //detailLabel.isUserInteractionEnabled = true
        } else {
            lockUnlockedLabel.text = "🔒"
            //lockUnlockedLabel.isEnabled = false
            //detailLabel.isEnabled = false
            // detailLabel.isUserInteractionEnabled = false
        }
        detailLabel.text = cellData
        detailLabel.textColor = theme.textColour
    }
}


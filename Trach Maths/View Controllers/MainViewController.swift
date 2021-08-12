//
//  MainViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 8/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Variables and Constants
    let theme = ThemeManager.currentTheme()
    
    // MARK: - Outlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var blackboardView: UIView!
    @IBOutlet var blackboardTextLabel: UILabel!
    
    @IBOutlet var blackboardLabelCollection: [UILabel]!
    
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = theme.backgroundColor
        titleLabel.textColor = theme.textColour
        titleLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 35))
        subtitleLabel.textColor = theme.orangeColor
        subtitleLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 20))
        
        for button in buttonCollection {
            Helper.buttonSetup(to: button)
        }
        
        for i in blackboardLabelCollection {
            i.font = UIFont(name: "Chalkduster", size: Helper.setCustomFont(originalFont: 20))
        }
        
        Helper.addShadow(to: blackboardView)
        
        addBottomBorder()
        
    }
    
    // MARK: - Functions
    func addBottomBorder() {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "356907534", attributes: underlineAttribute)
        blackboardTextLabel.attributedText = underlineAttributedString

    }
}



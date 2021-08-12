//
//  TestPopOverViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 26/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class TestPopOverViewController: UIViewController {
    // MARK: Variables and constants
    var theme = ThemeManager.currentTheme()
    var multiplier: BasicMultiplicationMultiplier!
    
    // MARK: - Outlet
    @IBOutlet weak var hintLabel: UILabel!
    
    // MARK: - Action
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        
        // Do any additional setup after loading the view.
        hintLabel.textColor = theme.textColour
        hintLabel.text = multiplier.summarySteps
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

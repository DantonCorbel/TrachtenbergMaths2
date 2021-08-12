//
//  PracticePopOverViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 21/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class PracticePopOverViewController: UIViewController {
    // MARK: - Variables and constants
    let theme = ThemeManager.currentTheme()
    
    var textPassedOverFromPracticeController: String!
    
    // MARK: Outlets
    @IBOutlet weak var textLabel: UILabel!
    
    //MARK: IBAction
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        
        textLabel.text = textPassedOverFromPracticeController
        
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

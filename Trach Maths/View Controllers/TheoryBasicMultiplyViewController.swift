//
//  TheoryBasicMultiplyViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 15/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class TheoryBasicMultiplyViewController: UIViewController {
    
    // MARK: - Variables and constants
    let theme = ThemeManager.currentTheme()
    var multiplier: BasicMultiplicationMultiplier!
    
    //MARK: - Outlets
    @IBOutlet var theoryLabel: UILabel!
    
    // MARK: - Life Cucle
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        // Do any additional setup after loading the view.
        setUpTheoryLabel()
    }
    
    // MARK: Functions
    func setUpTheoryLabel() {
        getTheoryHTMLData(for: multiplier)
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            theoryLabel.attributedText = attributedString
        }
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

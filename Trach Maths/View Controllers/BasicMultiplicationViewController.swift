//
//  BasicMultiplicationViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 12/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit
/* MARK: - Protocol Segue Handler*/
//protocol SegueHandler: AnyObject {
//    func segueToNext(identifier: String)
//}

class BasicMultiplicationViewController: UIViewController {
    
//    func segueToNext(identifier: String) {
//        self.performSegue(withIdentifier: identifier, sender: self)
//    }
    
    
    
    /*MARK: - Variables*/
    let theme = ThemeManager.currentTheme()
    var multiplier: BasicMultiplicationMultiplier!
    
    /*MARK: - Outlets*/
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var methodContainerView: UIView!
    @IBOutlet var themeContainerView: UIView!
    
    
    /*MARK: - Action*/
    @IBAction func segmentedControlPressed(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            methodContainerView.isHidden = false
            themeContainerView.isHidden = true
        case 1:
            methodContainerView.isHidden = true
            themeContainerView.isHidden = false
        default:
            break
        }
    }
    
    
    
    /*MARK: - Life Cycle*/
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        // Do any additional setup after loading the view.
        self.view.backgroundColor = theme.backgroundColor
        setupSegmentedControl()
        setUpTitleLabel()
        setUpSubitleLabel()
        
    }
    /*MARK: - Functions*/
    func setUpTitleLabel() {
        titleLabel.text = "Multiply by \(multiplier.multiplierString)"
        titleLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 22))
    }
    
    func setUpSubitleLabel() {
        subtitleLabel.text = "\(multiplier.summarySteps)"
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: subtitleLabel.text!, attributes: underlineAttribute)
        subtitleLabel.attributedText = underlineAttributedString
        subtitleLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 22))
        subtitleLabel.textColor = theme.orangeColor
        subtitleLabel.backgroundColor = theme.buttonColour
    }
    
    func setupSegmentedControl() {
        //segmentedControl.backgroundColor = theme.buttonColour
        segmentedControl.tintColor = theme.buttonColour
        
        
        let font = UIFont(name: "Futura", size: 20)
        let boldFont = UIFont(name: "Futura-bold", size: Helper.setCustomFont(originalFont: 18))
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: boldFont!, NSAttributedString.Key.foregroundColor: theme.orangeColor], for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font!, NSAttributedString.Key.foregroundColor: theme.orangeColor], for: .normal)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "theorySegueBM" {
            let vc = segue.destination as! TheoryBasicMultiplyViewController
            vc.multiplier = multiplier
        }
        if segue.identifier == "methodSegueBM" {
            let vc = segue.destination as! MethodBasicMultiplyViewController
            vc.multiplier = multiplier
        }
        
//        if segue.identifier == "LearnToPractice" {
//            let dvc = segue.destination as! MethodBasicMultiplyViewController
//            dvc.delegate = self
//        }
        
    }
    
}



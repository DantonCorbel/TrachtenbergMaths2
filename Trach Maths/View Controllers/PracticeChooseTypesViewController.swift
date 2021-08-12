//
//  PracticeChooseTypesViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 10/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class PracticeChooseTypesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    // MARK: - Variables and Constants
    let theme = ThemeManager.currentTheme()
    var arrayItemsToPractice = [String]()
    var numberOfQuestions = 7
    var choiceData = [Chapters]()
    let picker = UIPickerView()
    var pickerChoices = [String]()
    
    // MARK: - Outlets
    @IBOutlet weak var numberofQuestionsRequested: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet var xLabelsCollection: [UILabel]!
    @IBOutlet var choiceButtonCollection: [UIButton]!
    @IBOutlet weak var practiceBarItem: UITabBarItem!
    
    
    // MARK: - IBAction
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == "❌" {
            sender.setTitle("✅", for: .normal)
        } else if sender.currentTitle == "✅" {
            sender.setTitle("❌", for: .normal)
        }
        checkIfContinueButtonEnabled()
    }
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        pickerViewContent()
        picker.delegate = self
        picker.dataSource = self
        numberofQuestionsRequested.inputView = picker
        
        // Do any additional setup after loading the view.
        //numberofQuestionsRequested.keyboardType = UIKeyboardType.numberPad
        //setupTextFields()
        setUpChoiceLabels()
        checkIfContinueButtonEnabled()
        
        
        view.backgroundColor = theme.backgroundColor
        
        continueButton.backgroundColor = theme.buttonColour
        continueButton.layer.cornerRadius = 4
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor.black.cgColor
        Helper.addShadow(to: continueButton)
        //continueButton.titleLabel?.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 10))
        
        picker.selectRow(6, inComponent: 0, animated: true)
        
        //practiceBarItem.image = 
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        arrayItemsToPractice = []
        numberofQuestionsRequested.isSelected = false
    }
    
    
    
    
    // MARK: - Picker View
    func pickerViewContent() {
        for  i in 1...20 {
            pickerChoices.append(String(i))
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerChoices.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerChoices[row]
    }
    
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberofQuestionsRequested.text = pickerChoices[row]
        numberofQuestionsRequested.resignFirstResponder()
    }
    
    
    // MARK: Functions
    func setUpChoiceLabels() {
        if let savedChapters = Chapters.loadFromFile() {
            choiceData = savedChapters
        } else {
            choiceData = Chapters.loadOriginalChapters()
        }
        
        for i in 0..<xLabelsCollection.count {
            if choiceData[1].chapterTitle[i].isComplete {
                choiceButtonCollection[i].setTitle("✅", for: .normal)
                xLabelsCollection[i].isEnabled = true
                choiceButtonCollection[i].isUserInteractionEnabled = true
            } else {
                choiceButtonCollection[i].setTitle("🔒", for: .normal)
                xLabelsCollection[i].isEnabled = false
                choiceButtonCollection[i].isUserInteractionEnabled = false
                
            }
        }
    }
    
    func xLabelsSetUp() {
        for i in 0..<xLabelsCollection.count {
            xLabelsCollection[i].textColor = theme.mainColor
            xLabelsCollection[i].font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 15))
        }
    }
    
    func getSetOfItemsToPractice() {
        for i in 0..<choiceButtonCollection.count {
            if choiceButtonCollection[i].currentTitle == "✅" {
                arrayItemsToPractice.append(xLabelsCollection[i].text ?? "x 11")
            }
        }
    }
    
    func checkIfContinueButtonEnabled() {
        for i in 0..<choiceButtonCollection.count {
            if choiceButtonCollection[i].currentTitle == "✅" {
                continueButton.isEnabled = true
                break
            } else {
                continueButton.isEnabled = false
            }
        }
    }
    
    
    
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         getSetOfItemsToPractice()
         numberOfQuestions = Int(numberofQuestionsRequested.text!) ?? 7
         let vc = segue.destination as? PracticeViewController
         vc?.arrayItemsToPractice = arrayItemsToPractice
         vc?.numberOfQuestions = numberOfQuestions
         print(arrayItemsToPractice)
         
     }
     
    
}

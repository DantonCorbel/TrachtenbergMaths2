//
//  MethodBasicMultiplyViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 15/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class MethodBasicMultiplyViewController: UIViewController {
    
    //weak var delegate: SegueHandler?
    
//    @IBAction func pressH(sender: UIButton) {
//        delegate?.segueToNext(identifier: "LearnToPractice")
//    }
//
    // MARK: - Variables and constants
    let theme = ThemeManager.currentTheme()
    var multiplier: BasicMultiplicationMultiplier!
    var carryButtonToggledOn = false
    var arrayForUndo = [String]()
    var learnTableData = [Chapters]()
    
    // MARK: - Outlets
    // TODO: - Delete unused outlets and remove reference from storyboard
    @IBOutlet var stepCountLabel: UILabel!
    @IBOutlet weak var stepInstructionLabel: UILabel!
    @IBOutlet weak var endButtonStackView: UIStackView!
    @IBOutlet weak var keyboardButtonStackView: UIStackView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet var carriedThouLabel: UILabel!
    @IBOutlet var carriedHundredsLabel: UILabel!
    @IBOutlet var carriedTensLabel: UILabel!
    
    @IBOutlet var multiplicandThouLabel: UILabel!
    @IBOutlet var multiplicandHundredsLabel: UILabel!
    @IBOutlet var multiplicandTensLabel: UILabel!
    @IBOutlet var multiplicandUnitsLabel: UILabel!
    
    @IBOutlet var multiplierLabel: UILabel!
    @IBOutlet weak var pseudoMultiplierLabel: UILabel!
    
    @IBOutlet var lineTenThouLabel: UILabel!
    @IBOutlet var lineThouLabel: UILabel!
    
    @IBOutlet weak var answerTenThouLabel: UILabel!
    @IBOutlet var answerThousandsLabel: UILabel!
    @IBOutlet var answerHundredsLabel: UILabel!
    @IBOutlet var answerTensLabel: UILabel!
    @IBOutlet var answerUnitsLabel: UILabel!
    
    @IBOutlet weak var carryButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    @IBOutlet var multiplicandTenThouLabelConstraints: NSLayoutConstraint!
    @IBOutlet var answerTenThouLabelConstraints: NSLayoutConstraint!
    
    @IBOutlet var innerStackLabelCollection: [UILabel]!
    @IBOutlet var numberCollection: [UIButton]!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet var multiplicandlabelCollection: [UILabel]!
    @IBOutlet var answerLabelCollection: [UILabel]!
    @IBOutlet var carryLabelCollection: [UILabel]!
    
    
    // MARK: - IBAction
    @IBAction func learnAgainButtonPressed(_ sender: Any) {
        learnAgain()
        
    }
    
    @IBAction func carryButtonPressed(_ sender: Any) {
        carryButtonToggled()
    }
    
    @IBAction func undoButtonPressed(_ sender: Any) {
        if arrayForUndo.isEmpty == false {
            switch arrayForUndo.popLast() {
            case "number":
                for i in (0..<answerLabelCollection.count).reversed() {
                    if answerLabelCollection[i].textColor == theme.textColour {
                        answerLabelCollection[i].textColor = UIColor.white
                        answerLabelCollection[i].layer.borderColor = theme.orangeColor.cgColor
                        multiplicandlabelCollection[i].textColor = theme.orangeColor
                        if i == 0 {
                            undoButton.isEnabled = false
                            carryButton.isEnabled = false
                            resetButton.isEnabled = false
                        }
                        if i >= 0 && i < 4 {
                            multiplicandlabelCollection[i+1].textColor = theme.textColour
                            
                            answerLabelCollection[i+1].layer.borderColor = UIColor.black.cgColor
                        }
                        if i > 0 {
                            multiplicandlabelCollection[i-1].textColor = theme.darkerGreen
                        }
                        setLabelText()
                        break
                    }
                }
            case "carried":
                for i in (0..<carryLabelCollection.count).reversed() {
                    if carryLabelCollection[i].isEnabled {
                        carryLabelCollection[i].text = "0"
                        carryLabelCollection[i].isEnabled = false
                        break
                    }
                    
                }
                
            default:
                print("Something went wrong with basic multiply 'undo button pressed'")
            }
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        let number = sender.title (for: .normal)
        carryButton.isEnabled = true
        undoButton.isEnabled = true
        resetButton.isEnabled = true
        

        
        if carryButtonToggledOn == false {
            for i in 0 ..< carryLabelCollection.count {
                carryLabelCollection[i].textColor = theme.textColour
            }
            
            for i in 0..<answerLabelCollection.count {
                //change place value
                if answerLabelCollection[i].textColor == UIColor.white {
                    answerLabelCollection[i].text = number
                    arrayForUndo.append("number")
                    //answerLabelCollection[x].textColor = theme.textColour
                    //check if place value correct
                    if answerLabelCollection[i].text != wholeAnswerArray[i] {
                        let alertController = UIAlertController(title: "Whoops!", message: "Wrong answer. Check the instructions. Did you add any 'carried' numbers? Try again!", preferredStyle: .alert)
                        
                        let cancelAction = UIAlertAction(title: "Try again", style: .cancel, handler: nil)
                        
                        let showAnswer = UIAlertAction(title: "Show answer", style: .default, handler: {action in
                            self.answerLabelCollection[i].text = wholeAnswerArray[i]
                            self.answerLabelCollection[i].textColor = self.theme.textColour
                            self.setLabelText()
                            self.resetInnerLabelColours(i: i)
                            self.endofTask()
                            
                        })
                        
                        alertController.addAction(cancelAction)
                        alertController.addAction(showAnswer)
                        self.present(alertController, animated: true, completion: nil)
                        break
                    }
                    answerLabelCollection[i].textColor = theme.textColour
                    resetInnerLabelColours(i: i)
                    setLabelText()
                    endofTask() // check if finished answering
                    break
                }
            }
        } else {
            for i in (0..<carryLabelCollection.count).reversed() {
                if carryLabelCollection[i].isEnabled
                {
                    carryLabelCollection[i].text = number
                    carryButtonToggled()
                    arrayForUndo.append("carried")
                    break
                }
            }
        }
        
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ThemeManager.applyTheme(theme: theme)
        getRandomNumber(for: multiplier!)
        getMultiplicandDigits()
        calculateAnswer()
        getAnswerAsString()
        getAnswerAsStringArrayReversed()
        setView()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //DispatchQueue.main.async {
            self.scrollView.flashScrollIndicators()
        //}
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        wholeAnswerArray = []
    }
    

    // MARK: - Functions
    func setView() {
        
        multiplicandUnitsLabel.text = "\(multiplicandUnits)"
        multiplicandTensLabel.text = "\(multiplicandTens)"
        multiplicandHundredsLabel.text = "\(multiplicandHundreds)"
        multiplierLabel.text = " x " + multiplier.multiplierString
        pseudoMultiplierLabel.text = multiplierLabel.text
        
        setupButtons()
        setUpLabels()
        setUpInnerLabels()
    }
    
    func setupButtons() {
        for button in buttonCollection {
            Helper.buttonSetup(to: button)
            
        }
    }
    
    func setUpLabels() {
        
        stepCountLabel.textColor = theme.textColour
        stepInstructionLabel.textColor = theme.textColour
        
        stepCountLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 20))
        stepInstructionLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 17))
        
        setLabelText()
    }
    
    
    func setLabelText() {
        getLabelText(multiplier: multiplier)
        if answerUnitsLabel.textColor == UIColor.white {
            stepCountLabel.text = multiplier.instructionsSteps[0].heading
            stepInstructionLabel.text = multiplier.instructionsSteps[0].instruction
        } else if answerHundredsLabel.textColor == theme.textColour {
            stepCountLabel.text = multiplier.instructionsSteps[2].heading
            stepInstructionLabel.text = multiplier.instructionsSteps[2].instruction
        } else {
            stepCountLabel.text = multiplier.instructionsSteps[1].heading
            if multiplicandHundredsLabel.textColor == theme.orangeColor {
                middleSteps2 = multiplicandHundreds
                middleSteps1 = multiplicandTens
            } else if multiplicandTensLabel.textColor == theme.orangeColor {
                middleSteps2 = multiplicandTens
                middleSteps1 = multiplicandUnits
            }
            getLabelText(multiplier: multiplier)
            stepInstructionLabel.text = multiplier.instructionsSteps[1].instruction
            
        }
        
    }
    
    func setUpInnerLabels() {
        for i in (0..<innerStackLabelCollection.count) {
            
            innerStackLabelCollection[i].layer.borderWidth = 2.0
            innerStackLabelCollection[i].layer.cornerRadius = 8
            innerStackLabelCollection[i].layer.masksToBounds = true
            
        }
        multiplicandUnitsLabel.textColor = theme.orangeColor
        answerUnitsLabel.layer.borderColor = theme.orangeColorCGColour
    }
    
    func calculateAnswer() {
        wholeAnswerNumber = wholeMultiplicandNumber * multiplier.multiplierInteger
        print("answer = \(wholeAnswerNumber)")
    }
    
    func resetInnerLabelColours(i: Int) {
        if i <= (answerLabelCollection.count-2) {
            answerLabelCollection[i+1].layer.borderColor = theme.orangeColor.cgColor
            multiplicandlabelCollection[i].textColor = theme.darkerGreen
            multiplicandlabelCollection[i+1].textColor = theme.orangeColor
            answerLabelCollection[i].layer.borderColor = UIColor.black.cgColor
        }
        if i > 0 {
            multiplicandlabelCollection[i-1].textColor = theme.textColour
        }
    }
    
    func endofTask() {
        if answerThousandsLabel.textColor == theme.textColour {
            congratulations()
            
            if let savedChapters = Chapters.loadFromFile() {
                learnTableData = savedChapters
            } else {
                learnTableData = Chapters.loadOriginalChapters()
            }
           
            learnTableData[1].chapterTitle[multiplier.chapterIndex].unlockedCell = true
            if multiplier.chapterIndex == 0 {
                learnTableData[1].chapterTitle[9].isComplete = true
            } else {
                learnTableData[1].chapterTitle[multiplier.chapterIndex-1].isComplete = true
            }

            Chapters.saveToFile(tableData: learnTableData)
        }
  
    }
    
    func congratulations() {
        stepCountLabel.text = "Congratulations!"
        stepCountLabel.textColor = theme.orangeColor
        stepInstructionLabel.text = "You have learnt the table-free method of multiplying by \(multiplier.multiplierString)."
        endButtonStackView.isHidden = false
        keyboardButtonStackView.isHidden = true
        
    }
    
    func learnAgain() {
 
        getRandomNumber(for: multiplier!)
        getMultiplicandDigits()
        calculateAnswer()
        getAnswerAsString()
        wholeAnswerArray = []
        getAnswerAsStringArrayReversed()
        endButtonStackView.isHidden = true
        keyboardButtonStackView.isHidden = false
        
        multiplicandUnitsLabel.text = "\(multiplicandUnits)"
        multiplicandTensLabel.text = "\(multiplicandTens)"
        multiplicandHundredsLabel.text = "\(multiplicandHundreds)"
        
        reset()
      
    }
    
    func reset() {
        for i in 0 ..< multiplicandlabelCollection.count {
            multiplicandlabelCollection[i].textColor = theme.textColour
            answerLabelCollection[i].textColor = UIColor.white
            answerLabelCollection[i].layer.borderColor = UIColor.black.cgColor
        }
        multiplicandUnitsLabel.textColor = theme.orangeColor
        answerUnitsLabel.layer.borderColor = theme.orangeColorCGColour
        setLabelText()
        //we don't want to reset the label above the Thousands column
        for i in 0..<carryLabelCollection.count {
            carryLabelCollection[i].text = "0"
            carryLabelCollection[i].isEnabled = false
        }
        carryButtonToggledOn = false
        carryButton.isEnabled = false
        undoButton.isEnabled = false
        resetButton.isEnabled = false
    }
    
    func carryButtonToggled() {
        if carryButtonToggledOn == false {
            carryButton.backgroundColor = theme.orangeColor
            
            for i in 0..<carryLabelCollection.count {
                if answerLabelCollection[i].textColor == theme.textColour && answerLabelCollection[i+1].textColor == UIColor.white {
                    carryLabelCollection[i].isEnabled = true
                    carryLabelCollection[i].textColor = theme.orangeColor
                    continue
                }
            }
            
            for i in 0..<numberCollection.count {
                numberCollection[i].backgroundColor = theme.orangeColor
            }
            carryButtonToggledOn = true
        } else {
            carryButton.backgroundColor = theme.buttonColour
            for i in 0..<numberCollection.count {
                numberCollection[i].backgroundColor = theme.buttonColour
            }
            for i in 0..<carryLabelCollection.count{
                if carryLabelCollection[i].text == "0" {
                    carryLabelCollection[i].isEnabled = false
                }
            }
            carryButtonToggledOn = false
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

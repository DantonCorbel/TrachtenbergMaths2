//
//  PracticeViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 10/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit



class PracticeViewController: UIViewController {
    
    
    // MARK: -  Constants and variables
    let theme = ThemeManager.currentTheme()
    var multiplier: BasicMultiplicationMultiplier!
    var carryButtonToggledOn = false
    var arrayForUndo = [String]()
    var learnTableData = [Chapters]()
    var arrayItemsToPractice = [String]()
    var numberOfQuestions = 1
    var counter: Double = 0
    var wrongCount: Double = 0
    var practiceTableData = [PracticeData]()
    var questionMarkedAsWrong = false
    // var textToPassToPopover: String!
    
    
    /* MARK: -  Outlets*/
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet var questionCountLabel: UILabel!
    @IBOutlet weak var keyboardButtonStackView: UIStackView!
    
    
    @IBOutlet var carriedThouLabel: UILabel!
    @IBOutlet var carriedHundredsLabel: UILabel!
    @IBOutlet var carriedTensLabel: UILabel!
    
    
    @IBOutlet var multiplicandThouLabel: UILabel!
    @IBOutlet var multiplicandHundredsLabel: UILabel!
    @IBOutlet var multiplicandTensLabel: UILabel!
    @IBOutlet var multiplicandUnitsLabel: UILabel!
    
    @IBOutlet var multiplierLabel: UILabel!
    @IBOutlet weak var pseudoMultiplierLabel: UILabel!
    
    
    @IBOutlet var answerThousandsLabel: UILabel!
    @IBOutlet var answerHundredsLabel: UILabel!
    @IBOutlet var answerTensLabel: UILabel!
    @IBOutlet var answerUnitsLabel: UILabel!
    
    @IBOutlet weak var carryButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var hintButton: UIButton!
    @IBOutlet weak var checkAnswerButton: UIButton!
    
    
    @IBOutlet var innerStackLabelCollection: [UILabel]!
    @IBOutlet var numberCollection: [UIButton]!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet var multiplicandlabelCollection: [UILabel]!
    @IBOutlet var answerLabelCollection: [UILabel]!
    @IBOutlet var carryLabelCollection: [UILabel]!
    
    
    
    // MARK: -  IB Actions
    
    @IBAction func carryButtonPressed(_ sender: Any) {
        carryButtonToggled()
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        hintButton.isHidden = false
        nextButton.isHidden = true
        if Int(counter) == numberOfQuestions {
            checkAnswer()
        } else {
            next()
        }
        
    }
    
    
    @IBAction func undoButtonPressed(_ sender: Any) {
        if arrayForUndo.isEmpty == false {
            
            if hintButton.isHidden {
                hintButton.isHidden = false
                nextButton.isHidden = true
                checkAnswerButton.isHidden = true
            }
            
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
                        //setLabelText()
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
        //scrollView.isHidden = true
        //stepCountLabel.isHidden = true
        //endButtonStackView.isHidden = false
        
        if carryButtonToggledOn == false {
            for carryLabel in carryLabelCollection {
                carryLabel.textColor = theme.textColour
            }
            
            for i in 0..<answerLabelCollection.count {
                //change place value
                if answerLabelCollection[i].textColor == UIColor.white {
                    answerLabelCollection[i].text = number
                    arrayForUndo.append("number")
                    
                    
                    
                    answerLabelCollection[i].textColor = theme.textColour
                    resetInnerLabelColours(i: i)
                    if i == answerLabelCollection.count-1 {
                        checkAnswerButton.isHidden = false
                        hintButton.isHidden = true
                    }
                    //setLabelText()
                    //endofTask() // check if finished answering
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
    
    @IBAction func checkAmswerButtonPressed(_ sender: Any) {
        checkAnswerButton.isHidden = true
        hintButton.isHidden = false
        checkAnswer()
    }
    
    
    
    // MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ThemeManager.applyTheme(theme: theme)
        
        // Do any additional setup after loading the view.
        view.backgroundColor = theme.backgroundColor
        getRandomElementFromArray()
        getRandomNumber(for: multiplier!)
        getMultiplicandDigits()
        calculateAnswer()
        getAnswerAsString()
        getAnswerAsStringArrayReversed()
        setupButtons()
        setUpLabels()
        setView()
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        wholeAnswerArray = []
        //saveData()
    }
    
    // MARK: -  Functions
    func setView() {
        
        multiplicandUnitsLabel.text = "\(multiplicandUnits)"
        multiplicandTensLabel.text = "\(multiplicandTens)"
        multiplicandHundredsLabel.text = "\(multiplicandHundreds)"
        multiplierLabel.text = " x " + multiplier.multiplierString
        pseudoMultiplierLabel.text = multiplierLabel.text
        
        
        setLabelText()
        setUpInnerLabels()
    }
    
    func setupButtons() {
        for button in buttonCollection {
            Helper.buttonSetup(to: button)
            
        }
    }
    
    func setTitleSummaryLabels() {
        titleLabel.text = "Multiply by \(multiplier.multiplierString):"
        summaryLabel.text = multiplier.summarySteps
        titleLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 22))
        summaryLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 20))
    }
    
    
    func setUpLabels() {
        
        questionCountLabel.textColor = theme.textColour
        questionCountLabel.font = UIFont(name: "Futura", size: Helper.setCustomFont(originalFont: 17))
    }
    
    
    func setLabelText() {
        
        questionCountLabel.text = "Question \(Int(counter)) of \(numberOfQuestions)"
        
    }
    
    func getTextToPassToPopover() -> String {
        var textToPassToPopover: String!
        getLabelText(multiplier: multiplier)
        if answerUnitsLabel.textColor == UIColor.white {
            textToPassToPopover = "\(multiplier.instructionsSteps[0].heading): \( multiplier.instructionsSteps[0].instruction)"
        } else if answerHundredsLabel.textColor == theme.textColour {
            textToPassToPopover = "\(multiplier.instructionsSteps[2].heading): \( multiplier.instructionsSteps[2].instruction)"
        } else {
            if multiplicandHundredsLabel.textColor == theme.orangeColor {
                middleSteps2 = multiplicandHundreds
                middleSteps1 = multiplicandTens
            } else if multiplicandTensLabel.textColor == theme.orangeColor {
                middleSteps2 = multiplicandTens
                middleSteps1 = multiplicandUnits
            }
            getLabelText(multiplier: multiplier)
            textToPassToPopover = "\(multiplier.instructionsSteps[1].heading) \( multiplier.instructionsSteps[1].instruction)"
        }
        return textToPassToPopover
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
    
    func getRandomElementFromArray() {
        let i = Int.random(in: 0..<arrayItemsToPractice.count)
        switch arrayItemsToPractice[i] {
        case "x 11":
            multiplier = BasicMultiplicationMultiplier.eleven
        case "x 12":
            multiplier = BasicMultiplicationMultiplier.twelve
        case "x 6":
            multiplier = BasicMultiplicationMultiplier.six
        case "x 5":
            multiplier = BasicMultiplicationMultiplier.five
        case "x 7":
            multiplier = BasicMultiplicationMultiplier.seven
        case "x 9":
            multiplier = BasicMultiplicationMultiplier.nine
        case "x 8":
            multiplier = BasicMultiplicationMultiplier.eight
        case "x 4":
            multiplier = BasicMultiplicationMultiplier.four
        case "x 3":
            multiplier = BasicMultiplicationMultiplier.three
        default:
            print("Error: get random element from array malFunction")
        }
        
        //numberOfQuestions -= 1
        counter += 1
        setTitleSummaryLabels()
        multiplierLabel.text = " x \(multiplier.multiplierString)"
        pseudoMultiplierLabel.text = " x \(multiplier.multiplierString)"
        
    }
    
    func calculateAnswer() {
        wholeAnswerNumber = wholeMultiplicandNumber * multiplier.multiplierInteger
        print("answer = \(wholeAnswerNumber)")
        print("string answer: \(wholeAnswerString)")
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
    
    
    func checkAnswer() {
        //calculate given answer
        let givenAnswer = "\(answerLabelCollection[3].text!)" + "\(answerLabelCollection[2].text!)" + "\(answerLabelCollection[1].text!)" +
            "\(answerLabelCollection[0].text!)"
        print("Given answer: \(givenAnswer)")
        
        //compare to Answwer
        //show appropriate alert
        if givenAnswer == wholeAnswerString && Int(counter) == numberOfQuestions {
            saveData()
            let alertController = UIAlertController(title: "CONGRATULATIONS!", message: "You practiced \(numberOfQuestions) questions. Practice again?", preferredStyle: .alert)
            
            let practiceAgain = UIAlertAction(title: "Practice Again", style: .default, handler: {action in
                
                self.practiceAgain()
                
            })
            
//
//            let test = UIAlertAction(title: "Test", style: .default, handler: {action in
//                self.performSegue(withIdentifier: "PracticeToTest", sender: self)
//            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(practiceAgain)
            alertController.addAction(cancel)
            //alertController.addAction(test)
            self.present(alertController, animated: true, completion: nil)
            
        } else if givenAnswer == wholeAnswerString {
            let alertController = UIAlertController(title: "Correct!", message: "Well done.", preferredStyle: .alert)
            
            let next = UIAlertAction(title: "Next", style: .default, handler: {action in
                self.next()
                
            })
            
            alertController.addAction(next)
            self.present(alertController, animated: true, completion: nil)
            
            
            
            
        } else if givenAnswer != wholeAnswerString {
            
            if questionMarkedAsWrong == false {
                wrongCount += 1
                print("wrong count is \(wrongCount)")
                print("added to wrong count")
                questionMarkedAsWrong = true
            }
            
            let alertController = UIAlertController(title: "Whoops!", message: "Not quite. Did you add any 'carried' numbers? Try again! Use the 'hint' button if required.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Try again", style: .default, handler: {action in
                self.reset()
            })
            
            let showAnswer = UIAlertAction(title: "Show answer", style: .default, handler: {action in
                for i in 0..<self.answerLabelCollection.count {
                    self.answerLabelCollection[i].text = wholeAnswerArray[i]
                    self.answerLabelCollection[i].textColor = self.theme.textColour
                    //self.setLabelText()
                    self.multiplicandlabelCollection[i].textColor = self.theme.textColour
                    
                    self.nextButton.isHidden = false
                    self.hintButton.isHidden = true
                    
                }
                
            })
            
            alertController.addAction(cancelAction)
            alertController.addAction(showAnswer)
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    
    func practiceAgain() {
        //        saveData()
        counter = 0
        wrongCount = 0
        next()
    }
    
    
    func next() {
        
        questionMarkedAsWrong = false
        getRandomElementFromArray()
        getRandomNumber(for: multiplier!)
        getMultiplicandDigits()
        calculateAnswer()
        getAnswerAsString()
        wholeAnswerArray = []
        getAnswerAsStringArrayReversed()
        
        keyboardButtonStackView.isUserInteractionEnabled = true
        
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
        checkAnswerButton.isHidden = true
        hintButton.isHidden = false
        nextButton.isHidden = true
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
    
    func saveData() {
        if let savedPracticeData = PracticeData.loadFromFile() {
            practiceTableData = savedPracticeData
        } else {
            practiceTableData = PracticeData.loadOriginalPracticeData()
        }
        
        var accuracyInt: Int = 0
        
        //get date
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let currentDateString = dateFormatter.string(from: currentDate)
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        let currentTimeString = dateFormatter.string(from: currentDate)
        
        //get accuracy %
        let totalPossible = Double(numberOfQuestions)
        let accuracy = (totalPossible - wrongCount)/totalPossible * 100
        let rounded = accuracy.rounded()
        let integer = Int(rounded)
        accuracyInt = integer
        print("totalPoss = \(totalPossible)")
        print("wrong count = \(wrongCount)")
        print("Accuracy = \(accuracyInt)%")
        
        
        
        
        let data = PracticeData(date: currentDateString, internalData: [InternalData(time: currentTimeString, topics: arrayItemsToPractice, accuracy: accuracyInt)])
        
        if data.date == practiceTableData[0].date {
            practiceTableData[0].internalData.insert(contentsOf: data.internalData, at: 0)
        } else {
            practiceTableData.insert(data, at: 0)
        }
        
        //        for i in 0..<practiceTableData.count {
        //            if practiceTableData[i].date == data.date {
        //                practiceTableData[i].internalData.insert(contentsOf: data.internalData, at: 0)
        //            } else {
        //                practiceTableData.insert(data, at: 0)
        //            }
        //        }
        
        
        PracticeData.saveToFile(practiceData: practiceTableData)
        
        //practiceTableData = 
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
//        if segue.identifier == "PracticeToTest" {
//
//        } else {
            let vc = segue.destination as! PracticePopOverViewController
            vc.modalPresentationStyle = .popover
            vc.popoverPresentationController!.delegate = self
            // Pass the selected object to the new view controller.
            vc.textPassedOverFromPracticeController = getTextToPassToPopover()
        
    }
    
    
}

extension PracticeViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

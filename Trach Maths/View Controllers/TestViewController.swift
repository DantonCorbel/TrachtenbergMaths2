//
//  TestViewController.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 25/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    // MARK: - Variables and Constants
    let theme = ThemeManager.currentTheme()
    var numberPressedCounter = 0
    var questionCounter = 1
    //var answerGiven = "0"
    var arrayItemsToPractice: [String]!
    var numberOfQuestions: Int!
    var questionsArray: [Questions] = []
    //var answersArray: [String] = []
    var multiplier: BasicMultiplicationMultiplier!
    var testHistoryData = [TestHistoryData]()
    var wrongCount = 0
    
    
    // MARK: - Outlets
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var checkAnswerButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    //COLLECTIONS
    @IBOutlet var buttonCollection: [UIButton]!
    
    // MARK: - Actions
    @IBAction func checkAnswerButtonPresssed(_ sender: Any) {
        
        if (answerLabel.text != "" || answerLabel.text != "_") {
            questionsArray[numberOfQuestions - 1].givenAnswer = answerLabel.text!
        }
        else {
            questionsArray[numberOfQuestions - 1].givenAnswer = answerLabel.text ?? "0"
        }
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if questionCounter > 1 {
            questionCounter -= 1
            setLabels()
            answerLabel.text = questionsArray[questionCounter-1].givenAnswer
            
            if answerLabel.text == "" {
                numberPressedCounter = 0
            } else {
                numberPressedCounter = answerLabel.text?.count ?? 4
            }
        }
        
        
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        questionsArray[questionCounter-1].givenAnswer = answerLabel.text ?? "0"
        questionCounter += 1
        answerLabel.text = ""
        setLabels()
        numberPressedCounter = 0
        // }
        
        if questionCounter == numberOfQuestions {
            nextButton.isHidden = true
            checkAnswerButton.isHidden = false 
        }
        
        answerLabel.isUserInteractionEnabled = true
        
    }
    
    @IBAction func undoButtonPressed(_ sender: Any) {
        if numberPressedCounter > 0 {
            numberPressedCounter -= 1
            answerLabel.text?.remove(at: answerLabel.text!.startIndex)
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        numberPressedCounter = 0
        answerLabel.text = ""
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        let number = sender.title(for: .normal)
        if numberPressedCounter == 0 {
            answerLabel.text = number
            answerLabel.textColor = theme.textColour
        } else if numberPressedCounter < 4 {
            answerLabel.text = number! + answerLabel.text!
        }
        numberPressedCounter += 1
        answerLabel.isUserInteractionEnabled = false
    }
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        print("tap working")
        answerLabel.text = "_"
        answerLabel.isUserInteractionEnabled = false
    }
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ThemeManager.applyTheme(theme: theme)
        
        
        if numberOfQuestions == 1 {
            nextButton.isHidden = true
            checkAnswerButton.isHidden = false
        }
        
        view.backgroundColor = theme.backgroundColor
        
        for button in buttonCollection {
            Helper.buttonSetup(to: button)
        }
        
        answerLabel.layer.borderWidth = 2
        answerLabel.layer.borderColor = theme.orangeColor.cgColor
        answerLabel.layer.backgroundColor = UIColor.white.cgColor
        answerLabel.layer.cornerRadius = 4
        answerLabel.textColor = UIColor.lightGray
        
        
        
        getRandomElementFromArray()
        makeQuestionArray()
        setLabels()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(TestViewController.tapFunction))
        answerLabel.addGestureRecognizer(tap)
    }
    
    // MARK: - Functions
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
        
    }
    
    func makeQuestionArray() {
        for i in 1...numberOfQuestions {
            // get the multiplier
            getRandomElementFromArray()
            // get the multiplicand
            getRandomNumber(for: multiplier)
            // get the actual answer
            wholeAnswerNumber = wholeMultiplicandNumber * multiplier.multiplierInteger
            
            questionsArray.append(Questions(number: i, multiplicand: String(wholeMultiplicandNumber), multiplier: multiplier.multiplierString, result: String(wholeAnswerNumber), givenAnswer: "0"))
        }
        
        //Questions.saveToFile(data: questionsArray)
    }
    
    func setLabels() {
        let i = questionCounter - 1
        questionNumberLabel.text = "Question: \(questionCounter) of \(numberOfQuestions!)"
        questionLabel.text = "\(questionsArray[i].multiplicand) x \(questionsArray[i].multiplier) ="
        
    }
    
    func getMultiplierToPassToPopover() -> BasicMultiplicationMultiplier {
        switch questionsArray[questionCounter-1].multiplier {
        case "11":
            return .eleven
        case "12":
            return .twelve
        case "5":
            return .five
        case "6":
            return .six
        case "7":
            return .seven
        case "9":
            return .nine
        case "8":
            return .eight
        case "4":
            return .four
        case "3":
            return .three
        default:
            return .three
        }
    }
    
    func saveData() {
        if let savedTestData = TestHistoryData.loadFromFile() {
            testHistoryData = savedTestData
        } else {
            testHistoryData = TestHistoryData.loadOriginalPracticeData()
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
        let accuracy = (totalPossible - Double(wrongCount))/totalPossible * 100
        let rounded = accuracy.rounded()
        let integer = Int(rounded)
        accuracyInt = integer
        print("totalPoss = \(totalPossible)")
        print("wrong count = \(wrongCount)")
        print("Accuracy = \(accuracyInt)%")
        
        
        
        
        let data = TestHistoryData(date: currentDateString, internalData: [InternalData(time: currentTimeString, topics: arrayItemsToPractice, accuracy: accuracyInt)])
        
        if data.date == testHistoryData[0].date {
            testHistoryData[0].internalData.insert(contentsOf: data.internalData, at: 0)
        } else {
            testHistoryData.insert(data, at: 0)
        }
        
        //        for i in 0..<testData.count {
        //            if testData[i].date == data.date {
        //                testData[i].internalData.insert(contentsOf: data.internalData, at: 0)
        //            } else {
        //                testData.insert(data, at: 1)
        //            }
        //        }
        
        
        TestHistoryData.saveToFile(data: testHistoryData)
        
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "TestPopUPSegue" {
            let vc = segue.destination as! TestPopOverViewController
            vc.modalPresentationStyle = .popover
            vc.popoverPresentationController!.delegate = self
            // Pass the selected object to the new view controller.
            let multiplierToPass = getMultiplierToPassToPopover()
            
            vc.multiplier = multiplierToPass
        } else if segue.identifier == "finishTest" {
            let vc = segue.destination as! TestQuestionsTableViewController
            
            questionsArray[numberOfQuestions - 1].givenAnswer = answerLabel.text ?? "0"
            for item in questionsArray {
                if item.givenAnswer != item.result {
                    wrongCount += 1
                }
            }
            saveData()
            vc.questionsArray = questionsArray
            vc.wrongCount = wrongCount
        }
    }
    
    
}

extension TestViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

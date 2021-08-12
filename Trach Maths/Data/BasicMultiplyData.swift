//
//  BasicMultiplyData.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 14/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import Foundation

// MARK: -Basic multiplier struct

struct BasicMultiplyInstructionsStruct {
    var heading: String
    var instruction: String
}

var elevenInstructions = [BasicMultiplyInstructionsStruct]()
var twelveInstructions = [BasicMultiplyInstructionsStruct]()
var sixInstructions = [BasicMultiplyInstructionsStruct]()
var sevenInstructions = [BasicMultiplyInstructionsStruct]()
var fiveInstructions = [BasicMultiplyInstructionsStruct]()
var nineInstructions = [BasicMultiplyInstructionsStruct]()
var eightInstructions = [BasicMultiplyInstructionsStruct]()
var fourInstructions = [BasicMultiplyInstructionsStruct]()
var threeInstructions = [BasicMultiplyInstructionsStruct]()


// MARK: -Basic multiplier enum

enum BasicMultiplicationMultiplier {
    case eleven, twelve, nine, eight, seven, six, five, four, three
    
    var multiplierInteger: Int {
        switch self {
        case .twelve:
            return 12
        case .eleven:
            return 11
        case .nine:
            return 9
        case .eight:
            return 8
        case .seven:
            return 7
        case .six:
            return 6
        case .five:
            return 5
        case .four:
            return 4
        case .three:
            return 3
        }
    }
    
    var chapterIndex: Int {
        switch self {
        case .twelve:
            return 2
        case .eleven:
            return 1
        case .nine:
            return 6
        case .eight:
            return 7
        case .seven:
            return 5
        case .six:
            return 4
        case .five:
            return 3
        case .four:
            return 8
        case .three:
            return 0
        }
    }
    
    var multiplierString: String {
        switch self {
        case .twelve:
            return "12"
        case .eleven:
            return "11"
        case .nine:
            return "9"
        case .eight:
            return "8"
        case .seven:
            return "7"
        case .six:
            return "6"
        case .five:
            return "5"
        case .four:
            return "4"
        case .three:
            return "3"
        }
    }
    
    
    var instructionsSteps: [BasicMultiplyInstructionsStruct] {
        switch self {
        case .twelve:
            return twelveInstructions
        case .eleven:
            return elevenInstructions
        case .nine:
            return nineInstructions
        case .eight:
            return eightInstructions
        case .seven:
            return sevenInstructions
        case .six:
            return sixInstructions
        case .five:
            return fiveInstructions
        case .four:
            return fourInstructions
        case .three:
            return threeInstructions
        }
    }
    
    // MARK: - summary
    
    var summarySteps: String {
        switch self {
        case .twelve:
            return "Double the digit, add the neighbour"
            
        case .eleven:
            return "Add the neighbour"
            
        case .nine:
            return """
                        First Step: Subtract from 10
                        Middle Step: Subtract from 9, add the neighbour
                        Last Step: Subtract 1 from left-most digit
                        """
        //            return """
        //            First Step: 10 - digit;
        //            Middle Steps: 9 - digit + neighbour;
        //            Last step: digit - 1
        //            """
        
        case .eight:
            //            return """
            //            First Step: 2 x (10 - digit);
            //            Middle Steps: 2 x (9-digit) + neighbour;
            //            Last Step: digit - 2
            //            """
            return """
            First Step: Subtract from 10, then double
            Middle Step: Subtract from 9, double, add the neighbour
            Last Step: Subtract 2 from left-most digit
            """
        case .seven:
            return "Double the digit, if digit is odd, add 5, then add \'half\' the neighbour"
        case .six:
            return "If digit is odd, add 5, then add \'half\' the neighbour"
        case .five:
            return "Use \'half\' the neighbour, if digit is odd, add 5"
        case .four:
            //                        return """
            //                        First Step: Subtract from 10, if digit odd, add 5
            //                        Middle Step: Subtract from 9,add 5 if odd, add \'half\' the neighbour
            //                        Last Step: Take \'half\' of the left-most digit, subtract 1
            //                        """
            return """
            First Step: 10-n, if odd: + 5
            Middle Steps: 9-n + \'half\' neighbour, if odd: + 5
            Last Step: (\'half\' of n)-1
            """
        case .three:
            return """
                        First Step: Subtract from 10, double, if digit odd, add 5
                        Middle Step: Subtract from 9, double, add 5 if odd, add \'half\' the neighbour
                        Last Step: Take \'half\' of the left-most digit, subtract 2
                        """
        //            return """
        //            First Step: 2(10-n) (if n is odd: + 5);
        //            Middle Steps: 2(9-n) + \'half\' neighbour (if n is odd: + 5);
        //            Last Step: (\'half\' of n)-2
        //            """
        }
    }
    
    
}

// MARK: - External funcs

func getTheoryHTMLData(for multiplier:BasicMultiplicationMultiplier) {
    
    switch multiplier {
    case .eleven:
        data = Data(elevenTheory.utf8)
    case .twelve:
        data = Data(twelveTheory.utf8)
    case .six:
        data = Data(sixTheory.utf8)
    case .seven:
        data = Data(sevenTheory.utf8)
    case .five:
        data = Data(fiveTheory.utf8)
    case .nine:
        data = Data(nineTheory.utf8)
    case .eight:
        data = Data(eightTheory.utf8)
    case .four:
        data = Data(fourTheory.utf8)
    case .three:
        data = Data(threeTheory.utf8)
    }
    
}

// MARK: - Main instructions


func getLabelText(multiplier: BasicMultiplicationMultiplier) {
    switch multiplier {
    // MARK: - 11
    case .eleven:
        elevenInstructions = [
            BasicMultiplyInstructionsStruct(heading: "First Step:", instruction: "Starting with the right-most digit of the multiplicand (\(multiplicandUnits)), place directly down to right-most position in answer. This is because it has no neighbour:\n    ⟹ \(multiplicandUnits) + 0 = ?"),
            BasicMultiplyInstructionsStruct(heading: "Middle Steps:", instruction: "Take the next digit to the left (\(middleSteps2)) and add its right hand neighbour (\(middleSteps1)). Remember to add anything carried over from previous step calculations.\n    ⟹ \(middleSteps2) + \(middleSteps1) + carried number = ?"),
            BasicMultiplyInstructionsStruct(heading: "Last Step:", instruction: "Take left-most (first) digit of the multiplicand (\(multiplicandHundreds)), add anything carried over. This is because, moving right to left, the next digit would be zero.\n    ⟹ 0 + \(multiplicandHundreds) + carried number = ?")]
    // MARK: - 12
    case .twelve:
        twelveInstructions = [
            BasicMultiplyInstructionsStruct(heading: "First Step:", instruction: "Double the right-most digit (\(multiplicandUnits)), bring it down to right-most position in answer.\n    ⟹ \(multiplicandUnits) x 2 = ?"),
            BasicMultiplyInstructionsStruct(heading: "Middle Steps:", instruction: "Double the digit (\(middleSteps2)), and add to right hand neighbour (\(middleSteps1)). Add anything carried over.\n    ⟹ (\(middleSteps2) x 2) + \(middleSteps1) + carried = ?"),
            BasicMultiplyInstructionsStruct(heading: "Last Step:", instruction: "Take left-most digit (\(multiplicandHundreds)), add anything carried over.")
        ]
    // MARK: - 6
    case .six:
        sixInstructions = [
            BasicMultiplyInstructionsStruct(heading: "First Step:", instruction: "If digit (\(multiplicandUnits)) is an odd number, add 5, otherwise bring right-most digit down to right-most position in answer."),
            BasicMultiplyInstructionsStruct(heading: "Middle Steps:", instruction: "If digit (\(middleSteps2)) is odd, add 5, then add \'half\' (ignore decimals) of the neighbour  (\(middleSteps1))."),
            BasicMultiplyInstructionsStruct(heading: "Last Step:", instruction: "Take \'half\' of the left-most digit (\(multiplicandHundreds)), add anything carried over.")
        ]
        forSix(num1: multiplicandUnits, num2: 0, num3: 0)
        forSix(num1: middleSteps2, num2: middleSteps1, num3: 1)
        forSix(num1: 0, num2: multiplicandHundreds, num3: 2)
    // MARK: - 7
    case .seven:
        sevenInstructions = [
            BasicMultiplyInstructionsStruct(heading: "First Step:", instruction: "Double the right-most digit (\(multiplicandUnits)), if digit (\(multiplicandUnits)) was an odd number, add 5."),
            BasicMultiplyInstructionsStruct(heading: "Middle Steps:", instruction: "Double the digit (\(middleSteps2)), if digit (\(multiplicandUnits)) was odd, add 5. Then add \'half\' (ignore decimals) the neighbour (\(middleSteps1))."),
            BasicMultiplyInstructionsStruct(heading: "Last Step:", instruction: "Take \'half\' left-most digit (\(multiplicandHundreds)), add anything carried over.")
        ]
        forSeven(num1: multiplicandUnits, num2: 0, num3: 0)
        forSeven(num1: middleSteps2, num2: middleSteps1, num3: 1)
        forSeven(num1: 0, num2: multiplicandHundreds, num3: 2)
    // MARK: - 5
    case .five:
        fiveInstructions = [
            BasicMultiplyInstructionsStruct(heading: "First Step:", instruction: "If the right-most digit (\(multiplicandUnits)) is even, use '0' in the right-most position of the answer. If it is odd, use '5'."),
            BasicMultiplyInstructionsStruct(heading: "Middle Steps:", instruction: "If the digit (\(middleSteps2)) is even, take \'half\' (ignore decimals) the neighbour. If it is odd, add 5 to \'half\' the right-hand neighbour (\(middleSteps1))."),
            BasicMultiplyInstructionsStruct(heading: "Last Step: ", instruction: "Take \'half\' of the left-most digit (\(multiplicandHundreds)), add anything carried over.")
        ]
        forFive(num1: multiplicandUnits, num2: 0, num3: 0)
        forFive(num1: middleSteps2, num2: middleSteps1, num3: 1)
        forFive(num1: 0, num2: multiplicandHundreds, num3: 2)
    // MARK: - 9
    case .nine:
        nineInstructions = [
            BasicMultiplyInstructionsStruct(heading: "First Step:", instruction: "Take 10, subtract the right-most digit (\(multiplicandUnits)), and use in right-most answer position.\n    ⟹ 10 - \(multiplicandUnits) = ?"),
            BasicMultiplyInstructionsStruct(heading: "Middle Steps:", instruction: "Take 9 minus digit (\(middleSteps2)), add the right-hand neighbour (\(middleSteps1)). Add anything carried over.\n    ⟹ (9 - \(middleSteps2)) + \(middleSteps1) + carried = ?"),
            BasicMultiplyInstructionsStruct(heading: "Last Step:", instruction: "Take digit (\(multiplicandHundreds)) and subtract 1, add anything carried over.\n    ⟹ \((multiplicandHundreds) - 1) + carried = ?")
        ]
    // MARK: - 8
    case .eight:
        eightInstructions = [
            BasicMultiplyInstructionsStruct(heading: "First Step:", instruction: "Take 10, subtract the right-most digit (\(multiplicandUnits)), then double the answer, use in right-most answer position.\n    ⟹ (10 - \(multiplicandUnits)) x 2 = ?"),
            BasicMultiplyInstructionsStruct(heading: "Middle Steps:", instruction: "Take 9 minus digit (\(middleSteps2)), double the answer, then add the neighbour (\(middleSteps1)).\n    ⟹ ((9 - \(middleSteps2)) x 2 + \(middleSteps1) + carried = ?"),
            BasicMultiplyInstructionsStruct(heading: "Last Step:", instruction: "Take digit (\(multiplicandHundreds)) and subtract 2, add anything carried over.\n    ⟹ (\(multiplicandHundreds) - 2) + carried = ?")
        ]
    // MARK: - 4
    case .four:
        fourInstructions = [
            BasicMultiplyInstructionsStruct(heading: "First Step:", instruction: "Take 10, subtract the right-most digit (\(multiplicandUnits)), if digit was odd then add 5 to answer, and use in right-most answer position"),
            BasicMultiplyInstructionsStruct(heading: "Middle Steps:", instruction: "Take 9 minus digit (\(middleSteps2)), if digit (\(middleSteps2)) was odd add 5, add \'half\' the neighbour (\(middleSteps1))."),
            BasicMultiplyInstructionsStruct(heading: "Last Step:", instruction: "Subtract 1 from \'half\' the left-most digit (\(multiplicandHundreds)), add anything carried over.")
        ]
        forFour(num1: multiplicandUnits, num2: 0, num3: 0)
        forFour(num1: middleSteps2, num2: middleSteps1, num3: 1)
        forFour(num1: 0, num2: multiplicandHundreds, num3: 2)
    // MARK: - 3
    case .three:
        threeInstructions = [
            BasicMultiplyInstructionsStruct(heading: "First Step:", instruction: "Take 10, subtract the right-most digit (\(multiplicandUnits)), then double the answer, if digit was odd then also add 5, and use in right-most answer position"),
            BasicMultiplyInstructionsStruct(heading: "Middle Steps:", instruction: "Take 9 minus digit (\(middleSteps2)), double the answer, if digit (\(middleSteps2)) was odd then also add 5, add \'half\' the neighbour (\(middleSteps1))."),
            BasicMultiplyInstructionsStruct(heading: "Last Step:", instruction: "Take \'half\' of left-most digit (\(multiplicandHundreds)), and subtract 2. Add anything carried over.")
        ]
        
    }
}

// MARK: - Add to instructions
var odd: Bool!
var half = 0

func isDigitOdd(num: Int) {
    if num % 2 == 0 {
        odd = false
    } else {
        odd = true
    }
}

func findHalf(num: Int) {
    half = num/2
}
// MARK: - 6
func forSix(num1: Int, num2: Int, num3: Int) {
    //If digit is odd, add 5, then add \'half\' the neighbour
    isDigitOdd(num: num1)
    findHalf(num: num2)
    
    switch num3 {
    case 0:
        if odd {
            sixInstructions[0].instruction += "\n    ⟹ (num1) is odd\n    ⟹ \(num1) + 5 = ?"
        } else {
            sixInstructions[0].instruction += "\n    ⟹ \(num1) is even, there is nothing to add"
        }
    case 1:
        if odd {
            sixInstructions[1].instruction += "\n    ⟹ \(num1) is odd\n   ⟹ 'half' of \(num2) is \(half)\n    ⟹ \(num1) + 5 + \(String(describing: half)) + carried = ?"
        } else {
            sixInstructions[1].instruction += "\n    ⟹ \(num1) is even\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ \(num1) + \(String(describing: half)) + carried = ?"
        }
    case 2:
        sixInstructions[2].instruction += "\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ \(String(describing: half)) + carried = ?"
    default:
        print("Something went wrong forSix extra info")
    }
}

// MARK: - 7
func forSeven(num1: Int, num2: Int, num3: Int) {
    //"Double the digit, if digit is odd, add 5, then add \'half\' the neighbour"
    isDigitOdd(num: num1)
    findHalf(num: num2)
    
    switch num3 {
    case 0:
        if odd {
            sevenInstructions[0].instruction += "\n    ⟹ (num1) is odd\n    ⟹ (\(num1) x 2) + 5 = ?"
        } else {
            sevenInstructions[0].instruction += "\n    ⟹ \(num1) is even, there is nothing to add, just double the digit"
        }
    case 1:
        if odd {
            sevenInstructions[1].instruction += "\n    ⟹ \(num1) is odd\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ (\(num1) x 2) + 5 + \(String(describing: half)) + carried = ?"
        } else {
            sevenInstructions[1].instruction += "\n    ⟹ \(num1) is even\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ (\(num1) x 2) + \(String(describing: half)) + carried = ?"
        }
    case 2:
        sevenInstructions[2].instruction += "\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ \(String(describing: half)) + carried = ?"
    default:
        print("Something went wrong forSeven extra info")
    }
}
// MARK: - 5
func forFive(num1: Int, num2: Int, num3: Int) {
    //Use \'half\' the neighbour, if odd asd 5"
    isDigitOdd(num: num1)
    findHalf(num: num2)
    
    switch num3 {
    case 0:
        if odd {
            fiveInstructions[0].instruction += "\n    ⟹ \(num1) is odd\n    ⟹ right-hand answer digit is '5'"
        } else {
            fiveInstructions[0].instruction += "\n    ⟹ \(num1) is even\n    ⟹ right-hand answer digit is '0'"
        }
    case 1:
        if odd {
            fiveInstructions[1].instruction += "\n    ⟹ \(num1) is odd\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ 5 + \(String(describing: half)) + carried = ?"
        } else {
            fiveInstructions[1].instruction += "\n    ⟹ \(num1) is even\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ \(String(describing: half)) + carried = ?"
        }
    case 2:
        fiveInstructions[2].instruction += "\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ \(String(describing: half)) + carried = ?"
    default:
        print("Something went wrong forFive extra info")
    }
}
// MARK: - 4
func forFour(num1: Int, num2: Int, num3: Int) {
    // return """
    //   First Step: Subtract from 10, if digit odd, add 5
    //   Middle Step: Subtract from 9, add \'half\' the neighbour, then if digit odd add 5
    //   Last Step: Take \'half\' of the left-most digit and subtract 1
    //                        """
    isDigitOdd(num: num1)
    findHalf(num: num2)
    
    switch num3 {
    case 0:
        if odd {
            fourInstructions[0].instruction += "\n    ⟹ (num1) is odd\n    ⟹ (10 - \(multiplicandUnits)) + 5 = ?"
        } else {
            fourInstructions[0].instruction += "\n    ⟹ \(num1) is even\n    ⟹ (10 - \(multiplicandUnits)) = ?"
        }
    case 1:
        if odd {
            fourInstructions[1].instruction += "\n    ⟹ \(num1) is odd\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ (9 - \(middleSteps2)) + 5  + \(String(describing: half)) + carried = ?"
        } else {
            fourInstructions[1].instruction += "\n    ⟹ \(num1) is even\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ (9 - \(middleSteps2)) + \(String(describing: half)) + carried = ?"
        }
    case 2:
        fourInstructions[2].instruction += "\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ \(String(describing: half)) - 1 + carried = ?"
    default:
        print("Something went wrong forFour extra info")
    }
}

// MARK: - 3
func forThree(num1: Int, num2: Int, num3: Int) {
    //return """
    //First Step: Subtract from 10, double, if digit odd, add 5
    //Middle Step: Subtract from 9, double, add \'half\' the neighbour, then if digit odd add 5
    //Last Step: Take \'half\' of the left-most digit and subtract 2
    //"""                       """
    isDigitOdd(num: num1)
    findHalf(num: num2)
    
    switch num3 {
    case 0:
        if odd {
            fourInstructions[0].instruction += "\n    ⟹ (num1) is odd\n    ⟹ (10 - \(multiplicandUnits)) x 2 + 5 = ?"
        } else {
            fourInstructions[0].instruction += "\n    ⟹ \(num1) is even\n    ⟹ (10 - \(multiplicandUnits)) x 2 = ?"
        }
    case 1:
        if odd {
            fourInstructions[1].instruction += "\n    ⟹ \(num1) is odd\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ (9 - \(middleSteps2)) x 2 + 5  + \(String(describing: half)) + carried = ?"
        } else {
            fourInstructions[1].instruction += "\n    ⟹ \(num1) is even\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ (9 - \(middleSteps2)) x 2 + \(String(describing: half)) + carried = ?"
        }
    case 2:
        fourInstructions[2].instruction += "\n    ⟹ 'half' of \(num2) is \(half)\n    ⟹ \(String(describing: half)) - 2 + carried = ?"
    default:
        print("Something went wrong forThree extra info")
    }
}

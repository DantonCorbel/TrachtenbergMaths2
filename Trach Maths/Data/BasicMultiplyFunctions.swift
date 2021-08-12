//
//  NumbersAndDigits.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 17/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import Foundation

//I;m not sure why I did not make this a struct

var multiplicandUnits: Int = 8
var multiplicandTens: Int = 5
var multiplicandHundreds: Int = 3
var middleSteps1: Int = multiplicandUnits //to get middle step instruction info without re-writing
var middleSteps2: Int = multiplicandTens //to get middle step instruction info without re-writing

var answerUnits: Int = 0
var answerTens:  Int = 0
var answerHundreds: Int = 0
var answerThousands: Int = 0
var answerTenThousands: Int = 0
//var answerHunThousands: Int = 0

//var carryUnits: Int = 0
//var carryTens: Int = 0
//var carryHundreds: Int = 0
//var carryThousands: Int = 0

var wholeMultiplicandNumber: Int = 0
var wholeAnswerNumber: Int = 0
var wholeAnswerString: String = ""
var wholeAnswerArray: [String] = []


func getRandomNumber(for multiplier: BasicMultiplicationMultiplier) {
    switch multiplier {
    case .twelve:
        wholeMultiplicandNumber = Int.random(in: 100...832)
    case .eleven:
        wholeMultiplicandNumber = Int.random(in: 100...908)
    case .nine:
        wholeMultiplicandNumber = Int.random(in: 111...999)
    case .eight:
        wholeMultiplicandNumber = Int.random(in: 124...999)
    case .seven:
        wholeMultiplicandNumber = Int.random(in: 142...999)
    case .six:
        wholeMultiplicandNumber = Int.random(in: 166...999)
    case .five:
        wholeMultiplicandNumber = Int.random(in: 199...999)
    case .four:
        wholeMultiplicandNumber = Int.random(in: 249...999)
    case .three:
        wholeMultiplicandNumber = Int.random(in: 333...999)
    }
    if wholeMultiplicandNumber % 10 == 0 {
        getRandomNumber(for: multiplier)
    }
}

//func checkNotEndInZero(for multiplier: BasicMultiplicationMultiplier) {
//    if wholeMultiplicandNumber % 10 == 0 {
//        getRandomNumber(for: multiplier)
//    }
//}

func getMultiplicandDigits() {
    let num = wholeMultiplicandNumber
    // break it down to assign units, tens, hundreds to the multiplicand
    multiplicandHundreds = num/100
    let tens = num - (multiplicandHundreds * 100)
    multiplicandTens = tens/10
    multiplicandUnits = tens - (multiplicandTens * 10)
    print("Multiplicand = \(wholeMultiplicandNumber), H = \(multiplicandHundreds), T = \(multiplicandTens), U = \(multiplicandUnits)")
}

func getAnswerAsString() {
    wholeAnswerString = String(wholeAnswerNumber)
}

func getAnswerAsStringArrayReversed() {
    for char in wholeAnswerString.reversed() {
        wholeAnswerArray.append(String(char))
        print("answer array = \(wholeAnswerArray)")
    }
}

func splitAnswerIntoPlaceValues() {
    answerTenThousands = wholeAnswerNumber/10000
    let thou = wholeAnswerNumber - (answerTenThousands * 10000)
    answerThousands = thou/1000
    let hund = thou - (answerThousands*1000)
    answerHundreds = hund/100
    let ten = hund - (answerHundreds * 100)
    answerTens = ten/10
    answerUnits = ten - (answerTens * 10)
}

func changeMiddleStepInfo() {
    if middleSteps1 == multiplicandUnits {
        middleSteps1 = multiplicandTens
        middleSteps2 = multiplicandHundreds
    } else {
        middleSteps1 = multiplicandUnits
        middleSteps2 = multiplicandTens
    }
    print("Multiplicand is \(wholeAnswerNumber), middle step 1 is \(middleSteps1), middle step 2 is \(middleSteps2)")
}

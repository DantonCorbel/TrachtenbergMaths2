//
//  IntroData.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 11/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import UIKit

struct InfoData {
    var title: String
    var info: String
    
    static func returnInfoData() -> [InfoData] {
        return [
            InfoData(title: "Multiplicand", info: "The multiplicand is the number being multiplied. For instance, in 58 x 11, the multiplicand is '58'."),
            InfoData(title: "Right to left", info: """
                Like any handwritten maths problem, we work right to left through the digits. For example 58 x 11 -> we will work with the 8 first, and then the 5.
            """),
            InfoData(title: "Odds and evens", info: """
                An odd number is any number that cannot be exactly divisible by 2, or any number that has a decimal point, or 'remainder' after being divided by 2. Even numbers are exactly divisible by 2. In the examle of 58, the 5 is an odd number (5 ÷ 2 = 2.5), the 8 is an even number (8 ÷ 2 = 4).
            """),
            InfoData(title: "The ‘neighbour’", info: """
                The ‘neighbour’ is always the digit to the RIGHT of the digit of current focus. With the number 58, the neighbour of 5 is 8. The neighbour of 8 would be 0.
            """),
            InfoData(title: "Always place a zero in front", info: """
                A 0 is placed at the start of the number, so as not to forget the final step. So 58 x 11 becomes 058 x11.
            """),
            InfoData(title: "The ‘carried’ number", info: """
                You will be asked to add numbers together. When the sum is greater than 9, you will need to ‘carry over’ the left digit. For example in 5 + 8, the answer is 13. When you write your answer, you will place the 3 and ‘carry’ the 1, using it in the next part of the answer.
            """),
            InfoData(title: "‘Half’ the neighbour", info: """
                When asked to halve the neighbour, you take only the ‘whole’ number and ignore the remainder/decimal point. For example, half of 5 is 2.5 - therefore you will only take the 2 and ignore the .5
            """)
        ]
    }
}


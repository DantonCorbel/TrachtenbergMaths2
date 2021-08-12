//
//  AboutData.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 8/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import Foundation

struct AboutData{
    var title: String
    var info: String
    
    static func returnData() -> [AboutData] {
        return [
            // MARK: - Index 0
            AboutData(title: "Jakow Trachtenberg", info: """
            Jakow Trachtenberg was born in 1888 in Odessa, Russia – and died in Zurich, Switzerland, in 1953.
            
            He was an accomplished engineer and mathematition, but was persecuted throughout his life for being a pacifist. Having fled to the Weimar Republic from Russia during the 1917 revolutions for speaking out against the communists, he later became a prisoner in a Nazi concentration camp for speaking aginst fascism.
            
            He developed this system of mental arithmatic in order to keep his mind agile whilst imprisoned, as well as to escape the realities of prisoner-of-war life. He also had limited access to paper or pencils, so worked out how to add thousands of numbers in his head, without adding further than 11, and would only write the finished theory down on scraps of paper he was able to hoard.
            """),
            // MARK: - Index 1
            AboutData(title: "Why Learn This Method", info: """
            This does not replace the 'times tables', but is an alternative that can be used in conjunction with the times tables. Sometimes you just can't remember the answer to 6 x 7, or 6 x 8, this method will help you arrive at the answer by remebering a simple rule that can be applied to anything multiplied by 6. You no longer need to rely on counting on your fingers or looking it up.
            
            It is also a good way of checking your calculations. If we make a mistake in one method, us faliable humans will probably make the same mistake again if we are checking with the same method. However if we are applying different mental pathways we are more likeky to pick up the error.
            
            It may be a more efficient method than applying the 'times tables'. Certainly when it comes to 'long multiplication', it will be faster.
            
            You may be perfectly happy with the 'times tables'. Maybe you just want to take on a new challenge, unlock neuronal channels in your brain. Or maybe you wish to pull this out as a party trick to impress your friends, family and colleagues with feats of mental arithmetic prowess.
            
            In exploring the theory behind the method, you will have a different way of thinking about mathematics. This is fun, challenging, and enlightening. Have fun.
            """),
            // MARK: - Index 2
            AboutData(title: "How to use", info: """
            The Trachtenberg system is a set of rules that are applied to each problem. In basic multiplication, you will learn a rule for every multiplier - from 'x 3' to 'x 12', that can be applied to every situation for that multiplier.

            It may seem a bit tricky, at first, to learn the 'rules', but with practice it will become second nature, and for some will be easier than remembering 'times tables' by rote.

            This app will take you step by step whilst you learn the rules. It will also show you how the logic works behind the 'rules'. Understanding this logic will help some recall the rules themselves.
            
            This app will take you through three stages of gaining the Trachtenberg method skills: Learning, Practicing, then Testing your knowledge.
            
            The 'Learn" section is a step-by-step approach. A general 'rule' for the particular problem will be presented, but you will also be taken through each problem slowly. If you make a mistake you will be alerted immediately and able to rectify it. I have also attempted to explain the theory behind each rule, for anyone who is interested.
            
            Once you have cleared a learn item, that item will be available for you to practice, in the 'Practice' Section. Here, you will still be given the general rule, but you will not be given the step-by-step instructions unless you ask for them via the 'hint' button. You can use the hint button as many times as you want. You also will not be alerted to an error until you complete and check your answer.
            
            Finally, once you have cleared a practice session, you can move on to testing yourself. The 'Test' section will not reveal the general 'rule' unless you ask for a hint, however the step-by-step instructions are no longer available. Your answers will only be checked at the end of each test.
            
            I hope you have fun, whilst working through the sometimes seemingly complex methods presented. With practice these will all become second nature, and you may find yourself relying on these methods more and more as you become proficient.
            """),
            // MARK: - Index 3
            AboutData(title: "References", info: """
            - Trachtenberg J (Translated and adapted by Cutler A & McShane R): The Trachtenberg Speed System of Basic Mathematics, 1960, Doubleday & Company, New York
            """),
            // MARK: - Index 4
            AboutData(title: "Acknowledgements", info: """
                - Glyphs by Icons8
                - Coding assistance from Hacking with Swift, Medium, Stackoverflow
                """)
                
        ]
    }
    
}

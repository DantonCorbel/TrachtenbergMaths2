//
//  PracticeHistoryData.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 13/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import Foundation

//struct PracticeHistoryData: Codable {
//    var date: Date
//    var topics: [String]
//    var accuracy: Int
//}
//
//
//struct CellLabels: Codable {
//    var typeOfPractice: String
//    var numberPracticed: Int
//
//}

struct InternalData: Codable {
    var time: String
    var topics: [String]
    var accuracy: Int
}

struct PracticeData: Codable {
    //    var sectionHeaderDate: Date
    //    var cellLabels: [CellLabels]
    var date: String
    var internalData: [InternalData]
    //    var topics: [String]
    //    var accuracy: Int
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = DocumentsDirectory.appendingPathComponent("practiceData").appendingPathExtension("plist")
    
    static func loadOriginalPracticeData() ->[PracticeData] {
        //        let currentDate = Date()
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.dateStyle = .medium
        //        dateFormatter.timeStyle = .none
        //        let currentDateString = dateFormatter.string(from: currentDate)
        return [
            // PracticeData(date: "Date", internalData: [InternalData(time: "Time", topics: ["Topics"], accuracy: 0)]),
            // FIXME: Remove prior to completion
            PracticeData(date: "Jul 23, 21", internalData: [InternalData(time: "12:20", topics: ["x 11, x 12"], accuracy: 100), InternalData(time: "12:05", topics: ["x 11"], accuracy: 80)]),
            PracticeData(date: "Jul 22, 21", internalData: [InternalData(time: "15:34", topics: ["x 5, x 6, x 7, x 9"], accuracy: 97)])
            
            //            PracticeData(date: "Date", internalData: <#InternalData#>(topics: ["Topics"], accuracy: 0)),
            //            //testing data
            //            PracticeData(date: "17 Jul", topics: ["x 11"], accuracy: 100),
            //            PracticeData(date: "17 Jul", topics: ["x 11"], accuracy: 100),
            //            PracticeData(date: "17 Jul", topics: ["x 11"], accuracy: 96),
            //            PracticeData(date: "17 Jul", topics: ["x 11"], accuracy: 86),
            //            PracticeData(date: "17 Jul", topics: ["x 11"], accuracy: 75),
            //            PracticeData(date: "17 Jul", topics: ["x 11"], accuracy: 63),
            //            PracticeData(date: "17 Jul", topics: ["x 11"], accuracy: 54),
            //            PracticeData(date: "17 Jul", topics: ["x 11"], accuracy: 45)
        ]
    }
    
    static func loadFromFile() -> [PracticeData]? {
        guard let codedPracticeData = try? Data(contentsOf: archiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<PracticeData>.self, from: codedPracticeData)
    }
    
    static func saveToFile(practiceData: [PracticeData]) {
        let encoder = PropertyListEncoder()
        let codedPracticeData = try? encoder.encode(practiceData)
        ((try? codedPracticeData?.write(to: archiveURL, options: .noFileProtection)) as ()??)
    }
}

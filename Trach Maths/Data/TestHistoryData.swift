//
//  TestHistoryData.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 27/07/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import Foundation
// "Internal data coded for in"practiceHistoryData


struct TestHistoryData: Codable {
    var date: String
    var internalData: [InternalData]
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = DocumentsDirectory.appendingPathComponent("testData").appendingPathExtension("plist")
    
    static func loadOriginalPracticeData() ->[TestHistoryData] {
        return [
            // FIXME: Remove prior to completion
            TestHistoryData(date: "Jul 23, 21", internalData: [InternalData(time: "12:20", topics: ["x 11, x 12"], accuracy: 100), InternalData(time: "12:05", topics: ["x 11"], accuracy: 80)]),
            TestHistoryData(date: "Jul 22, 21", internalData: [InternalData(time: "15:34", topics: ["x 5, x 6"], accuracy: 97)])
        ]
    }
    
    static func loadFromFile() -> [TestHistoryData]? {
        guard let codedData = try? Data(contentsOf: archiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<TestHistoryData>.self, from: codedData)
    }
    
    static func saveToFile(data: [TestHistoryData]) {
        let encoder = PropertyListEncoder()
        let codedData = try? encoder.encode(data)
        ((try? codedData?.write(to: archiveURL, options: .noFileProtection)) as ()??)
    }
}

//
//  LockedUnlockedDataSet.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 10/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

import Foundation

// MARK: - Struct: LockUnlocked
struct LockedUnlocked: Codable {
    var chapterTitle: String
    var unlockedCell: Bool
    var isComplete: Bool
}

// MARK: Struct: Chapters
struct Chapters: Codable {
    
    var sectionHeader: String
    var chapterTitle: [LockedUnlocked]
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = DocumentsDirectory.appendingPathComponent("chapters").appendingPathExtension("plist")
    
    static func loadOriginalChapters() -> [Chapters] {
        return [
            //        Chapters(sectionHeader: "Introduction", chapterTitle: [
            //                    LockedUnlocked(chapterTitle: "Concepts", unlockedCell: true, isComplete: false) ]),
            //        Chapters(sectionHeader: "Basic Multiplication", chapterTitle: [
            //                    LockedUnlocked(chapterTitle: "By 11", unlockedCell: false, isComplete: false),
            //                    LockedUnlocked(chapterTitle: "By 12", unlockedCell: false, isComplete: false),
            //                    LockedUnlocked(chapterTitle: "By 5", unlockedCell: false, isComplete: false),
            //                    LockedUnlocked(chapterTitle: "By 6", unlockedCell: false, isComplete: false),
            //                    LockedUnlocked(chapterTitle: "By 7", unlockedCell: false, isComplete: false),
            //                    LockedUnlocked(chapterTitle: "By 9", unlockedCell: false, isComplete: false),
            //                    LockedUnlocked(chapterTitle: "By 8", unlockedCell: false, isComplete: false),
            //                    LockedUnlocked(chapterTitle: "By 4", unlockedCell: false, isComplete: false),
            //                    LockedUnlocked(chapterTitle: "By 3", unlockedCell: false, isComplete: false)]),
            //        Chapters(sectionHeader: "Future updates", chapterTitle: [
            //                    LockedUnlocked(chapterTitle: "Multiplying larger numbers", unlockedCell: false, isComplete: false),
            //                    LockedUnlocked(chapterTitle: "Addition", unlockedCell: false, isComplete: false),
            //                    LockedUnlocked(chapterTitle: "Division", unlockedCell: false, isComplete: false),
            //                    LockedUnlocked(chapterTitle: "Squares and square roots", unlockedCell: false, isComplete: false)])
            //        ]
            
            // FIXME: - Remove before completion of app (TESTING DATA)
            Chapters(sectionHeader: "Introduction", chapterTitle: [
                        LockedUnlocked(chapterTitle: "About Trachtenberg", unlockedCell: true, isComplete: false),
                        LockedUnlocked(chapterTitle: "Why learn this method?", unlockedCell: true, isComplete: false),
                        LockedUnlocked(chapterTitle: "How to use the app", unlockedCell: true, isComplete: false),
                        LockedUnlocked(chapterTitle: "Concepts", unlockedCell: true, isComplete: false) ]),
            Chapters(sectionHeader: "Basic Multiplication", chapterTitle: [
                        LockedUnlocked(chapterTitle: "By 11", unlockedCell: false, isComplete: false),
                        LockedUnlocked(chapterTitle: "By 12", unlockedCell: false, isComplete: false),
                        LockedUnlocked(chapterTitle: "By 5", unlockedCell: false, isComplete: false),
                        LockedUnlocked(chapterTitle: "By 6", unlockedCell: false, isComplete: false),
                        LockedUnlocked(chapterTitle: "By 7", unlockedCell: false, isComplete: false),
                        LockedUnlocked(chapterTitle: "By 9", unlockedCell: false, isComplete: false),
                        LockedUnlocked(chapterTitle: "By 8", unlockedCell: false, isComplete: false),
                        LockedUnlocked(chapterTitle: "By 4", unlockedCell: false, isComplete: false),
                        LockedUnlocked(chapterTitle: "By 3", unlockedCell: false, isComplete: false)]),
            Chapters(sectionHeader: "Future updates", chapterTitle: [
                        LockedUnlocked(chapterTitle: "Multiplying larger numbers", unlockedCell: false, isComplete: false),
                        LockedUnlocked(chapterTitle: "Addition", unlockedCell: false, isComplete: false),
                        LockedUnlocked(chapterTitle: "Division", unlockedCell: false, isComplete: false),
                        LockedUnlocked(chapterTitle: "Squares and square roots", unlockedCell: false, isComplete: false)]),
            Chapters(sectionHeader: "Resources", chapterTitle: [
                        LockedUnlocked(chapterTitle: "References", unlockedCell: true, isComplete: false),
                        LockedUnlocked(chapterTitle: "Acknowledgements", unlockedCell: true, isComplete: false),
                        ])
        ]
    }
    
    static func loadFromFile() -> [Chapters]? {
        guard let codedChapters = try? Data(contentsOf: archiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<Chapters>.self, from: codedChapters)
    }
    
    static func saveToFile(tableData: [Chapters]) {
        let encoder = PropertyListEncoder()
        let codedChapters = try? encoder.encode(tableData)
        ((try? codedChapters?.write(to: archiveURL, options: .noFileProtection)) as ()??)
    }
    
}




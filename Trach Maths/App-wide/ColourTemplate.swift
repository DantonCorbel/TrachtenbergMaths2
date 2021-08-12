//
//  ColourTemplate.swift
//  Trach Maths
//
//  Created by Deb Santa Clara on 8/06/21.
//  Copyright © 2021 Deb Santa Clara. All rights reserved.
//

//  ThemeManager.swift
import UIKit
import Foundation

/// Enum Theme Manager
/// - Note: https://github.com/durul/DRL-Theme-Manager
enum Theme: Int {
    
    case Dark, Graphical
    
    /// Main Color
    var mainColor: UIColor {
        switch self {
        case .Graphical:
            return UIColor(red: 242.0/255.0, green: 101.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        case .Dark:
            return UIColor(red:0.13, green:0.13, blue:0.17, alpha:1.0)
        }
    }
    
    /// Customizing the Navigation Bar
    var barStyle: UIBarStyle {
        switch self {
        case .Graphical:
            return .default
        case .Dark:
            return .black
        }
    }
    
    /// BackgroundColor properties
    var backgroundColor: UIColor {
        return UIColor(red: 0.951, green: 0.975, blue: 0.853, alpha: 1)
    }
    
    var tableHeaderBackground: UIColor {
        return UIColor(red: 0.8824, green: 0.9373, blue: 0.6627, alpha: 1)
    }
    
    /// MainLabelColor properties
    //    var mainLabelColor: UIColor {
    //        return UIColor(red:0.58, green:0.78, blue:0.44, alpha:1.0)
    //    }
    //
    //    /// CommentColor properties
    //    var commentColor: UIColor {
    //        return UIColor(red:0.61, green:0.64, blue:0.69, alpha:1.0)
    //    }
    
    /// OrangeColor properties
    var orangeColor: UIColor {
        return  UIColor(red: 0.988, green: 0.376, blue: 0.039, alpha: 1)
    }
    
    var orangeColorCGColour: CGColor {
        return  UIColor(red: 0.988, green: 0.376, blue: 0.039, alpha: 1).cgColor
    }
    
    //dark green
    var buttonColour: UIColor {
        return UIColor(red: 0.698, green: 0.843, blue: 0.196, alpha: 1)
    }
    
    var darkerGreen: UIColor {
        return UIColor(red: 0.42, green: 0.66, blue: 0.31, alpha: 1)
    }
    //Red:0.42 green:0.66 blue:0.31 alpha:1.0
    
    //brown/grey
    var textColour: UIColor {
        return UIColor(red: 0.282, green: 0.012, blue: 0.333, alpha: 1)
    }
    
    var textColourCGColour: CGColor {
        return UIColor(red: 0.282, green: 0.012, blue: 0.333, alpha: 1).cgColor
    }
    
    var shadowColour: CGColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
    }
}

/// Enum declaration
let SelectedThemeKey = "SelectedTheme"

/// This will let you use a theme in the app.
struct ThemeManager {
    
    /// currentTheme: static function store current theme.
    /// Returns: Theme
    /// Parameters: None
    static func currentTheme() -> Theme {
        if let storedTheme = (UserDefaults.standard.value(forKey: SelectedThemeKey) as AnyObject).integerValue {
            return Theme(rawValue: storedTheme)!
        } else {
            return .Graphical
        }
    }
    
    /// applyTheme: static function applyTheme.
    /// Returns: None
    /// Parameters: theme
    static func applyTheme(theme: Theme) {
        // First persist the selected theme using NSUserDefaults.
        UserDefaults.standard.setValue(theme.rawValue, forKey: SelectedThemeKey)
        UserDefaults.standard.synchronize()
        
        // You get your current (selected) theme and apply the main color to the tintColor property of your application’s window.
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = theme.textColour
        
        UINavigationBar.appearance().barTintColor = theme.backgroundColor
        UINavigationBar.appearance().tintColor = theme.textColour
        // UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : theme.textColour, NSAttributedString.Key.font: UIFont(name: "Futura", size: 20)!]
        
        //        let attr = NSDictionary(object: UIFont(name: "Futura", size: 20.0)!, forKey: NSAttributedString.Key.font as NSCopying)
        //
        //        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: attr]
        
    }
    
}



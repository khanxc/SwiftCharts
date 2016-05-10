//
//  ChartAxisLabel.swift
//  swift_charts
//
//  Created by ischuetz on 01/03/15.
//  Copyright (c) 2015 ivanschuetz. All rights reserved.
//

import UIKit

/// A model of an axis label
public class ChartAxisLabel {
    
    struct YAxis {
        static let red          = "Red"
        static let orange       = "Orange"
        static let yellow       = "Yellow"
        static let lightGreen   = "Light Green"
        static let darkGreen    = "Dark Green"
    }
    
    public let text: String
    let settings: ChartLabelSettings
    
    var hidden: Bool = false
    
    /// The size of the bounding rectangle for the axis label, taking into account the font and rotation it will be drawn with
    lazy var textSize: CGSize = {
        let size = ChartUtils.textSize(self.text, font: self.settings.font)
        if self.settings.rotation == 0 {
            return size
        } else {
            return ChartUtils.boundingRectAfterRotatingRect(CGRectMake(0, 0, size.width, size.height), radians: self.settings.rotation * CGFloat(M_PI) / 180.0).size
        }
    }()
    
    public init(text: String, settings: ChartLabelSettings) {
        //        if text == "50" {
        //            self.text = YAxis.red.localized()
        //        } else if text == "60" {
        //            self.text = YAxis.orange.localized()
        //        } else if text == "70" {
        //            self.text = YAxis.yellow.localized()
        //        } else if text == "80" {
        //            self.text = YAxis.lightGreen.localized()
        //        } else if text == "100" {
        //            self.text = YAxis.darkGreen.localized()
        //        } else if text == "0" || text == "10" || text == "20" || text == "30" || text == "40" || text == "90" {
        //            self.text = ""
        //        } else {
        //            self.text = text
        //        }
        self.text = text
        self.settings = settings
    }
}

public extension String {
    
    func localized() -> String {
        let languageCodeStr = NSUserDefaults.standardUserDefaults().stringForKey("userSelectedLanguage")
        if let path = NSBundle.mainBundle().pathForResource(languageCodeStr?.characters.count > 0 ? languageCodeStr : "en", ofType: "lproj"), bundle = NSBundle(path: path) {
            return bundle.localizedStringForKey(self, value: nil, table: nil)
        }
        return self
    }
}


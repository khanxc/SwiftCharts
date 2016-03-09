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
        if text == "50" {
            self.text = "Red"
        } else if text == "60" {
            self.text = "Orange"
        } else if text == "70" {
            self.text = "Yellow"
        } else if text == "80" {
            self.text = "Light Green"
        } else if text == "100" {
            self.text = "Dark Green"
        } else if text == "0" || text == "10" || text == "20" || text == "30" || text == "40" || text == "90" {
            self.text = ""
        } else {
            self.text = text
        }
        self.settings = settings
    }
}

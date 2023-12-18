//
//  UIFont.swift
//  Viper Architecture
//
//  Created by Minata on 18/12/2023.
//

import UIKit
import Foundation

enum FontSansType: String {
    case regular = "Regular"
    case bold = "Bold"
    case medium = "Medium"
    case light = "Light"
}

public struct FontSans {
    let fontSansType: FontSansType
    let fontSize: CGFloat
    
    init(fontSansType: FontSansType, fontSize: CGFloat) {
        self.fontSansType = fontSansType
        self.fontSize = fontSize
    }
    
    func set() -> UIFont {
        return UIFont(name: "Product Sans \(self.fontSansType.rawValue)", size: self.fontSize) ?? UIFont.systemFont(ofSize: self.fontSize)
    }
}

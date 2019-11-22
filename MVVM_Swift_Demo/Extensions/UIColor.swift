//
//  UIColor.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: Int, alpha: Double = 1.0) {
        self.init(red: CGFloat((hex>>16)&0xFF)/255.0, green: CGFloat((hex>>8)&0xFF)/255.0, blue: CGFloat((hex)&0xFF)/255.0, alpha: CGFloat(255 * alpha) / 255)
    }
    
    convenience init(hexString: String, alpha: Double = 1.0) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(255 * alpha) / 255)
    }
    
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

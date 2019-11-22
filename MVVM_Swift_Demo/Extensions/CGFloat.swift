//
//  CGFloat.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

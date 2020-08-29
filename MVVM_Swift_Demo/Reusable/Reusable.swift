//
//  Reusable.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 15/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import UIKit


protocol ResuableViews {
    static var reuseIdentifier: String { get }
}

extension ResuableViews where Self: UIView {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}


protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

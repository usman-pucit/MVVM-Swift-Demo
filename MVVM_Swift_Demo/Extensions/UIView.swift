//
//  UIView.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 15/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import UIKit

extension UIView{
    
    static var nib: UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.1).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 8
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor, cornerRadius: CGFloat = 0){

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = cornerRadius
            gradientLayer.zPosition = -100
            self.layer.insertSublayer(gradientLayer, at: 0)
        })
    
    }
    
}

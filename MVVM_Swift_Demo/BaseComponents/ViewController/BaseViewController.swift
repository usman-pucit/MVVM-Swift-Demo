//
//  BaseViewController.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import UIKit
import DGActivityIndicatorView

class BaseViewController: UIViewController {
    
    @IBOutlet weak var spinner: DGActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
    }
    
    func setupAppearance(){
        spinner.type = .ballClipRotateMultiple
        spinner.size = 50.0;
        spinner.tintColor = #colorLiteral(red: 0.768627451, green: 0.1490196078, blue: 0, alpha: 1).withAlphaComponent(1.0)
    }
    
    func showLoader(){
        self.view.backgroundColor?.withAlphaComponent(0.2)
        spinner.startAnimating()
    }
    
    func hideLoader(){
        self.view.backgroundColor?.withAlphaComponent(1.0)
        spinner.stopAnimating()
    }
}

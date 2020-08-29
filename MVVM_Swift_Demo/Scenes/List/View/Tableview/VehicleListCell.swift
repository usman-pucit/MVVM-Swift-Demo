//
//  VehicleListCell.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import UIKit

class VehicleListCell: BaseTableViewCell {

    @IBOutlet weak var imgFleetType: UIImageView!
    @IBOutlet weak var lblHeadingValue: KernedLabel!
    @IBOutlet weak var lblHeadingTitle: KernedLabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var roundedView: RoundedView!
    @IBOutlet weak var lblFleetType: KernedLabel!
    @IBOutlet weak var lblLatitude: KernedLabel!
    @IBOutlet weak var lblLongitude: KernedLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAppearance()
    }

    private func setupAppearance(){
        shadowView.dropShadow()
        sideView.backgroundColor = .random()
        sideView.roundCorners([.bottomLeft,.topLeft], radius: 8)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func updateCell(model: Any){
        
        if let object = model as? PoiList{
            
         lblFleetType.text = object.fleetType
         imgFleetType.image = object.fleetType == "TAXI" ? #imageLiteral(resourceName: "taxi") : #imageLiteral(resourceName: "pooling")
            
         lblHeadingValue.text = String(format: "%.4f", object.heading ?? 0)
         lblLatitude.text = String(format: "%.4f", object.coordinate?.latitude ?? 0)
         lblLongitude.text = String(format: "%.4f", object.coordinate?.longitude ?? 0)
        
        }
    }
    
}

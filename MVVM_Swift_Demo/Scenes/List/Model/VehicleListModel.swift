//
//  VehicleListModel.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 15/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import Foundation
struct VehicleListModel : Codable {
    
	var poiList : [PoiList]?

	enum CodingKeys: String, CodingKey {

		case poiList = "poiList"
	}
    
    init(){
        
    }
    
    init(poiList : [PoiList]){
        self.poiList = poiList
    }
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		poiList = try values.decodeIfPresent([PoiList].self, forKey: .poiList)
	}

}

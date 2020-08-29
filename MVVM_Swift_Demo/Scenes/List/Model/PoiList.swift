//
//  PoiList.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 15/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//


import Foundation

struct PoiList : Codable {
	var id : Int?
	var coordinate : Coordinate?
	var fleetType : String?
	var heading : Double?

    init(id: Int, coordinate: Coordinate, fleatType: String, heading: Double) {
        self.id = id
        self.coordinate = coordinate
        self.fleetType = fleatType
        self.heading = heading
    }
    
	enum CodingKeys: String, CodingKey {

		case id = "id"
		case coordinate = "coordinate"
		case fleetType = "fleetType"
		case heading = "heading"
	}

    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		coordinate = try values.decodeIfPresent(Coordinate.self, forKey: .coordinate)
		fleetType = try values.decodeIfPresent(String.self, forKey: .fleetType)
		heading = try values.decodeIfPresent(Double.self, forKey: .heading)
	}

}

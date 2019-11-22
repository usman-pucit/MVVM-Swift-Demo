//
//  Coordinate.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 15/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import Foundation

struct Coordinate : Codable {
	let latitude : Double?
	let longitude : Double?

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
	enum CodingKeys: String, CodingKey {

		case latitude = "latitude"
		case longitude = "longitude"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
	}

}

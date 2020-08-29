//
//  VehiclesListContract.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 15/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import Foundation

protocol VehicleListViewContract {
    func fetchVehiclesList(coordinates: (p1Lat: Double, p2Lat: Double, p1Long: Double, p2Long: Double))
}

protocol VehicleListAPIProtocol {
    typealias completionHandler = (Result<VehicleListModel, APIError>) -> ()
    func fetchVehiclesList(coordinates: (p1Lat: Double, p2Lat: Double, p1Long: Double, p2Long: Double))
}

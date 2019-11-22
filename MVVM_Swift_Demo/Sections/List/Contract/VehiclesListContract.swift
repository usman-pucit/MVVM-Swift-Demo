//
//  VehiclesListContract.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 15/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import Foundation

protocol VehicleListViewContract {
    func getVehiclesListRquest()
}

protocol VehicleListAPIProtocol {
    typealias completionHandler = (Result<VehicleListModel, APIError>)->()
    func getVehiclesList(route: APIRouter, completionHandler: @escaping completionHandler)
}

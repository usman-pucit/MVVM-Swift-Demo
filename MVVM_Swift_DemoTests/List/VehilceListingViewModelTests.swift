//
//  VehilceListingViewModelTests.swift
//  MVVM_Swift_DemoTests
//
//  Created by Malik Usman on 19/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import Alamofire
@testable import MVVM_Swift_Demo
import XCTest

@available(iOS 13.0, *)
class VehilceListingViewModelTests: XCTestCase {
    
    // MARK :-  Propertise
    
    var viewModel: VehiclesListViewModel!
    var vc: VehiclesListController!
    var dataSource: GenericDataSource<PoiList>!
    var mockApiClient: MockAPIClient!
    
    // Life cycle
    
    override func setUp() {
        super.setUp()
        
        // Initializing properties
        dataSource = GenericDataSource<PoiList>()
        viewModel = VehiclesListViewModel(dataSource: dataSource)
        vc = VehiclesListController()
        mockApiClient = MockAPIClient()
    }
    
    // Life cycle
    
    override func tearDown() {
        
        // Deinitializing propertise
        viewModel = nil
        vc = nil
        dataSource = nil
        mockApiClient = nil
        
        super.tearDown()
    }
    
    
    
    /// METHOD to test if fetch vehicles list is working peoperly or not
    /// Expectation will catch a callback and listner would be called to update UI
    
    func testFetchVehiclesListWorking() {
        let expectation = XCTestExpectation(description: "Vehicles List fetch")
        
        // giving a service mocking vehicles list
        mockApiClient.vehicleModel = VehicleListModel(poiList: [PoiList(id: 1, coordinate: Coordinate(latitude: 10.0, longitude: 10.0), fleatType: "TAXI", heading: 100.0)])
        
        viewModel.onError = { _ in
            XCTAssert(false, "Failed to fetch vehicles list")
        }
        
        dataSource.data.addObserver(self) { _ in
            expectation.fulfill()
        }
        
        viewModel.fetchVehiclesList(coordinates: vc.coordinates)
        wait(for: [expectation], timeout: 5.0)
    }
    
    /// Testing fetch vehiles list method is calling properly
    /// Expectation is onError or datasourse observer is called
    
    func testFetchVehiclesListCalled() {
        let expectation = XCTestExpectation(description: "Vehicles List fetch")
        
        viewModel.onError = { _ in
           expectation.fulfill()
        }
        
        dataSource.data.addObserver(self) { _ in
            expectation.fulfill()
        }
        
        viewModel.fetchVehiclesList(coordinates: vc.coordinates)
        wait(for: [expectation], timeout: 5.0)
    }
    
    ///Test case for testing activity loader working
    /// expectation is will show and hide loading and functions are called properly
    
    func testActivityLoaderShowing() {
        let expectation = XCTestExpectation(description: "Vehicles List fetch")
        
        viewModel.setupLoader = {(loader) in
            if loader {
                expectation.fulfill()
            }else{
                expectation.fulfill()
            }
        }
    
        viewModel.fetchVehiclesList(coordinates: vc.coordinates)
        wait(for: [expectation], timeout: 5.0)
    }
    
}


/// MOCK APIClient class for testing
/// Conforming APIClient protocol to call web service

class MockAPIClient: APIClientProtocol {
    
    var sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = TimeInterval(60)
        configuration.timeoutIntervalForResource = TimeInterval(60)
        configuration.requestCachePolicy = NSURLRequest.CachePolicy.reloadRevalidatingCacheData
        configuration.httpCookieStorage = nil
        
        var trustedPolicy: ServerTrustPolicyManager?
        let sessionManager = SessionManager(
            configuration: configuration,
            serverTrustPolicyManager: trustedPolicy
        )
        
        return sessionManager
    }()
    
    var vehicleModel : VehicleListModel?
    
    func performRequest<T>(route: APIRouter, completionHandler: @escaping (DataResponse<T>) -> ()) where T : Decodable {
      
        sessionManager.request(route).responseObject { (response) in
            completionHandler(response)
        }
    }
    
}

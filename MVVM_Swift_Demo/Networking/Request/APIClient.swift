//
//  APIClient.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 15/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import Foundation
import Alamofire

/// - Networking class
/// - Conformming APIClient protocol to make a HTTP request
/// - Using Alamofire session manager object for REST Api calling

class APIClient : APIClientProtocol{

    /// Alamofire session manager object with some custom configurations
    
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
    
    /// APIClient protocol method performing a network request with session manager
    /// This method makes a network call and parse it into a response object of Decodable type
    /// - parameter T: generic object of Decodable type
    /// - parameter route: request object
    /// - parameter completionHandler: to receive callback after getting response
    
    func performRequest<T>(route: APIRouter, completionHandler: @escaping (DataResponse<T>) -> ()) where T : Decodable {
        sessionManager.request(route).responseObject { (response) in
            completionHandler(response)
        }
    }
   
}

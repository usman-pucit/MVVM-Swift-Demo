//
//  BaseRouter.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 14/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//


import Alamofire
import Foundation


// APIRouter Enum to create request

enum APIRouter: URLRequestConvertible {
    case vehiclelist(p1Lat: Double, p2Lat: Double,p1Long : Double,p2Long : Double)
    // MARK: - HTTPMethod
    
    private var method: HTTPMethod {
        switch self {
        case .vehiclelist:
            return .get
        }
    }
    
    // MARK: - Path
    
    private var path: String {
        switch self {
        case .vehiclelist(let p1Lat, let p2Lat, let p1Long, let p2Long):
            return "?p1Lat=\(p1Lat)&p1Lon=\(p1Long)&p2Lat=\(p2Lat)&p2Lon=\(p2Long)"
        }
    }
    
    // MARK: - Parameters
    
    private var parameters: Parameters? {
        switch self {
        case .vehiclelist:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url =  Environment.rootURL
        var urlRequest = URLRequest(url:  URL(string: url.appending(path).removingPercentEncoding ?? "")!)

        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Common Headers
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}


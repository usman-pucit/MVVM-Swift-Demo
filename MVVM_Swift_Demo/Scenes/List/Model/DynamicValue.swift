//
//  DynamicValue.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 23/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import Foundation

/// MARK : - Class
/// Class to make generic datasource with change data listner and notifies UI updates

class DynamicValue<T> {
    
    /// MARK : - Properties
    
    typealias CompletionHandler = ((T) -> Void)
    private var observers = [String: CompletionHandler]()
    

    /// MARK : - Initializer
    /// - parameter value: generic datasource object
    
    init(_ value: T) {
        self.value = value
    }
    
    
    /// MARK : - Datasource element

    var value : T {
        didSet {
            self.notify()
        }
    }
    
    /// Method to add observer on datasource to update its dat
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    /// Add and notify observer method update data and notify the listner
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    
    /// Method to notify datasource listner to update UI or perform required action
    
    private func notify() {
        observers.forEach({ $0.value(value) })
    }
    
    /// MARK : - De-Initializer
    
    deinit {
        observers.removeAll()
    }
}

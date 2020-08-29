//
//  GenericDataSource.swift
//  MVVM_Swift_Demo
//
//  Created by Malik Usman on 25/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

import Foundation
import UIKit

/// Genenic datasource class with Dynamic values
/// Auto notify and update UI on data change
/// Mapping response data in a generic object extended with tableview datasource to present data in a list


class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

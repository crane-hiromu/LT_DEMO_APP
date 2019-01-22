//
//  ClassNameProtocol.swift
//  LT_Demo_APP
//
//  Created by Hiromu Tsuruta on 2019/01/22.
//  Copyright © 2019年 Hiromu Tsuruta. All rights reserved.
//

import Foundation

protocol ClassNameProtocol {
    
    static var className: String { get }
    var className: String { get }
}

extension ClassNameProtocol {
    
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}

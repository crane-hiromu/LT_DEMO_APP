//
//  UITableView+Extensions.swift
//  LT_Demo_APP
//
//  Created by Hiromu Tsuruta on 2019/01/22.
//  Copyright © 2019年 Hiromu Tsuruta. All rights reserved.
//

import UIKit

extension UITableView {
    
    // MARK: UITableViewCell
    
    func registerFromNib<T: UITableViewCell>(type: T.Type) {
        
        let className = type.className
        let nib = UINib(nibName: className, bundle: Bundle(for: T.self))
        register(nib, forCellReuseIdentifier: className)
    }
    
    func register<T: UITableViewCell>(type: T.Type) {
        register(T.self, forCellReuseIdentifier: type.className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
    
    
    // MARK: UITableheaderFooterView
    
    func registerFromNib<T: UITableViewHeaderFooterView>(type: T.Type) {
        
        let className = type.className
        let nib = UINib(nibName: className, bundle: Bundle(for: T.self))
        register(nib, forHeaderFooterViewReuseIdentifier: className)
    }
    
    func register<T: UITableViewHeaderFooterView>(type: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: type.className)
    }
}


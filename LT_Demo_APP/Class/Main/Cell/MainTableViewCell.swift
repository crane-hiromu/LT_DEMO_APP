//
//  MainTableViewCell.swift
//  LT_Demo_APP
//
//  Created by Hiromu Tsuruta on 2019/01/22.
//  Copyright © 2019年 Hiromu Tsuruta. All rights reserved.
//

import UIKit
import Nuke

// MAKR: - Cell

final class MainTableViewCell: UITableViewCell {
    
    // MARK: Variables
    
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var tLabel: UILabel!
    @IBOutlet private weak var dLabel: UILabel!
    
    // MARK: Override
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userImageView.image = #imageLiteral(resourceName: "man")
    }
}


// MARK: - Internal

extension MainTableViewCell {
    
    func setup(by model: MainViewModel) {
        
        print("------model")
        print(model)
        
        if let url = model.user?.profileImageUrl {
            Nuke.loadImage(with: url, into: userImageView)
        }

        idLabel.text = model.user?.id
        tLabel.text = model.title
        dLabel.text = model.body
    }
}

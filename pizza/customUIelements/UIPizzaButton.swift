//
//  UIPizzaButton.swift
//  pizza
//
//  Created by bimal pariyar on 9/11/18.
//  Copyright © 2018 Binod Pariyar. All rights reserved.
//

import Foundation
import UIKit

class UIPizzaButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setProp()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProp()
    }
    
    func setProp() {
        backgroundColor = .red
        tintColor = .white
        layer.cornerRadius = 5
        titleEdgeInsets.top = 5
        titleEdgeInsets.left = 5
        titleEdgeInsets.bottom = 5
        titleEdgeInsets.right = 5
        titleLabel?.font = UIFont(name: "ChunkFive", size: 17)
    }
}

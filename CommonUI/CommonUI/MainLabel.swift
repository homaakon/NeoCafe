//
//  MainLabel.swift
//  CommonUI
//
//  Created by iPak Tulane on 06/02/24.
//

import Foundation
import SnapKit
import UIKit

public class MainLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        font = UIFont.systemFont(ofSize: 32)
        textColor = .white
        
        layer.masksToBounds = true
    }
    
    public required init?(coder aDecoder: NSCoder) {
        return nil
    }
}


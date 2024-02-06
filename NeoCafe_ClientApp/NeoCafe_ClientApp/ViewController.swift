//
//  ViewController.swift
//  NeoCafe_ClientApp
//
//  Created by iPak Tulane on 05/02/24.
//

import UIKit
import CommonUI
import SwiftUI

class ViewController: UIViewController {

    private(set) lazy var label: MainLabel = {
       let label = MainLabel()
        label.text = "Hello"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        view.backgroundColor = .black
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
}

#if DEBUG

@available(iOS 13.0, *)
struct VCProvider: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview()
    }
}
#endif

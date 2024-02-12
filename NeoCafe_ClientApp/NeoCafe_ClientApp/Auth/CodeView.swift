//
//  CodeView.swift
//  NeoCafe_ClientApp
//
//  Created by iPak Tulane on 12/02/24.
//

import UIKit
import SwiftUI
import SnapKit


class ViewController3: UIViewController {
    
    // headerView
    lazy var headerView: UIImageView = {
        let image = UIImage(named: "header")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // headerLabel
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .app1St
        label.textAlignment = .center
        return label
    }()
    
    private lazy var segmentedControlBackground: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .appGrey
        backgroundView.layer.cornerRadius = 25
        backgroundView.clipsToBounds = true
        return backgroundView
    }()

    private lazy var toggleSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Login", "Registration"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(toggleSegmentedControlValueChanged), for: .valueChanged)

        // Customize segmented control appearance
        segmentedControl.selectedSegmentTintColor = .orange
        let font = UIFont.systemFont(ofSize: 15)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)

        return segmentedControl
    }()

    @objc private func toggleSegmentedControlValueChanged() {
        // Handle segmented control value change
        let isLogin = toggleSegmentedControl.selectedSegmentIndex == 0
        // Perform actions based on the toggle state
        print("Toggle is \(isLogin ? "Login" : "Registration")")
    }
    
    /// codeLabel
    let codeLabel: UILabel = {
        let label = UILabel()
        let email = "client@gmail.com"
        label.text = "Введите 4-х значный код, \nотправленный на \(email)"
        label.textColor = .appBlack
//        label.text = "Код введен неверно, \nпопробуйте еще раз"
//        label.textColor = .appRed
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isHidden = false
        return label
    }()

    
     // stack
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
//        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    // digitOne
    let digitOne: UILabel = {
        let label = UILabel()
        label.text = "_"
        label.textColor = .appBlack
        label.backgroundColor = .appGrey
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.font = UIFont.systemFont(ofSize: 32)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.isHidden = false
        return label
    }()
    
    // digitTwo
    let digitTwo: UILabel = {
        let label = UILabel()
        label.text = "_"
        label.textColor = .appBlack
        label.backgroundColor = .appGrey
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.font = UIFont.systemFont(ofSize: 32)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.isHidden = false
        return label
    }()
    
    // digitThree
    let digitThree: UILabel = {
        let label = UILabel()
        label.text = "_"
        label.textColor = .appBlack
        label.backgroundColor = .appGrey
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.font = UIFont.systemFont(ofSize: 32)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.isHidden = false
        return label
    }()
    
    // digitFour
    let digitFour: UILabel = {
        let label = UILabel()
        label.text = "_"
        label.textColor = .appBlack
        label.backgroundColor = .appGrey
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.font = UIFont.systemFont(ofSize: 32)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.isHidden = false
        return label
    }()
    
    
    /// button
    let placeholderView: UIView = {
        let view = UIView()
        view.backgroundColor = .appWhite
        return view
    }()
    
    /// button
    let buttonView: UIButton = {
        let button = UIButton()
        button.setTitle("Получить код", for: .normal)
        button.layer.cornerRadius = 13
        button.backgroundColor = .appBlack
        return button
    }()

    /// timerLabel
    let timerLabel: UILabel = {
        let label = UILabel()
        let text = "Отправить еще раз"
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        
        label.attributedText = attributedString
        
        label.textColor = .appDarkGrey
//        label.textColor = .appPrimary
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }

    func setupSubviews() {
        view.addSubview(headerView)
        headerView.addSubview(headerLabel)
        
        view.addSubview(segmentedControlBackground)
        segmentedControlBackground.addSubview(toggleSegmentedControl)
        
        view.addSubview(placeholderView)
        placeholderView.addSubview(codeLabel)
        placeholderView.addSubview(stackView)
        
        stackView.addArrangedSubview(digitOne)
        stackView.addArrangedSubview(digitTwo)
        stackView.addArrangedSubview(digitThree)
        stackView.addArrangedSubview(digitFour)
        
        view.addSubview(buttonView)
        view.addSubview(timerLabel)
    }
    
    func setupConstraints() {
        
//        headerView
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
//        headerLabel
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        segmentedControlBackground.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(-25)
            make.width.equalTo(343) // Adjust the width as needed
            make.height.equalTo(48) // Adjust the height as needed
        }

        toggleSegmentedControl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

//        placeholderView
        placeholderView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(70)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(160)
        }
        
        // codeLabel
        codeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        // stackView
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-15)
            make.leading.equalToSuperview().inset(80)
            make.trailing.equalToSuperview().offset(-80)
            make.height.equalTo(48)
        }
        
        // digitOne
        digitOne.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview()
            make.height.equalTo(52)
            make.width.equalTo(40)
        }
        
        // digitTwo
        digitTwo.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
//            make.leading.equalTo(digitOne.snp.trailing)
            make.height.equalTo(52)
            make.width.equalTo(40)
        }
        
        // digitThree
        digitThree.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
//            make.leading.equalTo(digitTwo.snp.trailing)
            make.height.equalTo(52)
            make.width.equalTo(40)
        }
        
        // digitFour
        digitFour.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
//            make.leading.equalTo(digitThree.snp.trailing)
            make.height.equalTo(52)
            make.width.equalTo(40)
        }
        
//        buttonView
        buttonView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(placeholderView.snp.bottom).offset(25)
            make.width.equalTo(343)
            make.height.equalTo(48)
        }
        
//        timerLabel
        timerLabel.snp.makeConstraints { make in
//            make.leading.trailing.bottom.equalToSuperview()
//            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(buttonView.snp.bottom).offset(20)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
    }
    
}

#if DEBUG
@available(iOS 13.0, *)
struct ViewController3_Provider: PreviewProvider {
    static var previews: some View {
        ViewController3().showPreview()
    }
}
#endif


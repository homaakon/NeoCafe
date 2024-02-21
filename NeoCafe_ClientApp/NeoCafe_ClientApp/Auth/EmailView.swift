//
//  EmailView.swift
//  NeoCafe_ClientApp
//
//  Created by iPak Tulane on 12/02/24.
//

import UIKit
import SwiftUI
import SnapKit


class ViewController2: UIViewController {
    
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
    
    /// errorLabel
    let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Неправильный адрес электронной почты, попробуйте еще раз"
        label.textColor = .appRed
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isHidden = false
        return label
    }()
    
    // emailField
    let emailField: UITextField = {
        let field = UITextField()
        field.clearButtonMode = .whileEditing
        field.layer.cornerRadius = 16
        field.textColor = .appGrey
        field.backgroundColor = .white
        field.placeholder = "Введите электронную почту"

        // Set border properties
        field.layer.borderWidth = 1.0  // Set the width of the border
        field.layer.borderColor = UIColor.appRed.cgColor  // Set the color of the border

        // Create a container view for the image with left padding
        let leftViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: field.frame.height))

        let image = UIImageView(image: UIImage(systemName: "at"))
        image.tintColor = .appRed
        image.contentMode = .center

        // Set the frame of the image within the container view
        image.frame = CGRect(x: 10, y: 0, width: 30, height: field.frame.height)

        // Add the image to the container view
        leftViewContainer.addSubview(image)

        // Set the left view of the text field to the custom container view
        field.leftView = leftViewContainer
        field.leftViewMode = .always

        // Create an attributed string for the red placeholder
        let attributedPlaceholder = NSAttributedString(string: "Введите электронную почту", attributes: [NSAttributedString.Key.foregroundColor: UIColor.appRed])

        // Apply the attributed placeholder to the text field
        field.attributedPlaceholder = attributedPlaceholder

        return field
    }()
    
    /// button
    let placeholderView: UIView = {
        let view = UIView()
        view.backgroundColor = .appGrey
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
        label.text = "Отправить еще раз"
        label.textColor = .appDarkGrey
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
        placeholderView.addSubview(errorLabel)
        placeholderView.addSubview(emailField)
        
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
            make.height.greaterThanOrEqualTo(125)
        }
        
        // errorLabel
        errorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        // emailField
        emailField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-15)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(48)
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
            make.centerX.equalToSuperview()
            make.top.equalTo(buttonView.snp.bottom).offset(20)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
    }
    
}

#if DEBUG
@available(iOS 13.0, *)
struct ViewController2_Provider: PreviewProvider {
    static var previews: some View {
        ViewController2().showPreview()
    }
}
#endif




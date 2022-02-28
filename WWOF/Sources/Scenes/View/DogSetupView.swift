//
//  DogSetupView.swift
//  WWOF
//
//  Created by Roman on 27.02.2022.
//

import UIKit

class DogSetupView: UIView {

    // MARK: - Configuration
    func configureView() {

    }
    
    // MARK: - Properties
    var delegate: DogSetupViewDelegate?

    // MARK: - Views
    // Buttons
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.loginButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.backgroundColor = Colors.loginButtonBackGround
        button.setTitleColor(Colors.loginButtonTitle, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5

        return button
    }()

    // MARK: - Initial

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .cyan
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings
    private func setupHierarchy() {
        addSubview(loginButton)
    }

    private func setupLayout() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    // Button actions
    @objc private func goBack(){
        delegate?.goBackToProfilePage()
    }

}

// MARK: - Constants

extension DogSetupView {
    enum Colors {
        static let ColectionViewBackGround: UIColor = .orange
        static let headerViewBackGround: UIColor = .systemTeal
        static let textFieldPlaceHolder: UIColor = .red
        static let loginButtonBackGround: UIColor = .white
        static let registerButtonBackGround: UIColor = .clear
        static let registerButtonTitle: UIColor = .cyan
        static let loginButtonTitle: UIColor = .blue
        static let infoLabelTextColor: UIColor = .white

    }

    enum Metric {
        // headerView
        static let headerViewTopIndent: CGFloat = 0
        static let headerViewBottomIndent: CGFloat = 160
        static let headerViewLeftIndent: CGFloat = 10
        static let headerViewRightIndent: CGFloat = -10
        static let headerViewCornerRadius: CGFloat = 15
        // collectionView
        static let collectionViewTopIndent: CGFloat = 10

    }

    enum Strings {
        static let dogCellViewNibName: String = "DogViewCell"
        static let dogCellViewId: String = "DogViewCellid"
        static let registerButtonTitle: String = "Registration"
        static let loginButtonTitle: String = "Login"
        static let infoText: String = ""

        static let textFieldLoginText: String = "danil@yandex.ru"
        static let textFieldPasswordText: String = "Danil2000"
    }
}

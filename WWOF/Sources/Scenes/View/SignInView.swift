//
//  SignInView.swift
//  WWOF
//
//  Created by Roman on 09.02.2022.
//

import UIKit

class SignInView: UIView {

    // MARK: - Configuration
    func configureView() {

    }

    // MARK: - Properties
    var delegate: SignInViewDelegate?

    // MARK: - Views
    // TextFields
    lazy var textFieldLogin: UITextField = {
        let field = UITextField()
        field.backgroundColor = Colors.textFieldBackGround
        field.textColor = Colors.textFieldText
        field.attributedPlaceholder = NSAttributedString(string: Strings.textFieldLoginPlaceholder, attributes: [NSAttributedString.Key.foregroundColor: Colors.textFieldPlaceHolder])
        field.autocapitalizationType = .none
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Metric.textFieldCornerRadius
        field.text = Strings.textFieldLoginText

        return field
    }()

    lazy var textFieldPassword: UITextField = {
        let field = UITextField()
        field.backgroundColor = Colors.textFieldBackGround
        field.textColor = Colors.textFieldText
        field.attributedPlaceholder = NSAttributedString(string: Strings.textFieldPasswordPlaceholder, attributes: [NSAttributedString.Key.foregroundColor: Colors.textFieldPlaceHolder])

        field.layer.masksToBounds = true
        field.layer.cornerRadius = Metric.textFieldCornerRadius
        field.autocapitalizationType = .none
        field.isSecureTextEntry = true
        field.text = Strings.textFieldPasswordText

        return field
    }()

    // Buttons
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.loginButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(autorization), for: .touchUpInside)
        button.backgroundColor = Colors.loginButtonBackGround
        button.setTitleColor(Colors.loginButtonTitle, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metric.buttonCornerRadius

        return button
    }()

    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.registerButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(moveToRegistrationPage), for: .touchUpInside)
        button.backgroundColor = Colors.registerButtonBackGround
        button.setTitleColor(Colors.registerButtonTitle, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metric.buttonCornerRadius

        return button
    }()

    // Labels
    private lazy var infoLabel: UILabel = {
        var label = UILabel()
        label.text = Strings.infoText
        label.textColor = Colors.infoLabelTextColor
        label.font = .systemFont(ofSize: Metric.infoLabelFontSize, weight: .light)
        label.textAlignment = .center
        label.preferredMaxLayoutWidth = 250
        label.numberOfLines = 3

        return label
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
        backgroundColor = .black
        setupHierarchy()
        setupLayout()
    }

//    override func draw(_ rect: CGRect) {
//        let s = 5
//        let r = 12
//            for g in 0...16 {
//                for b in 0...16 {
//                    let pathRec = CGRect(x: 10 + g * s, y: 450 + b * s, width: s, height: s)
//                    let path = UIBezierPath(rect: pathRec)
//                    let color = UIColor(red: CGFloat(r * 16)/255, green: CGFloat(g * 16)/255, blue: CGFloat(b * 16)/255, alpha: 1.0)
//                    color.setFill()
//                    path.fill()
//                }
//            }
//
//    }

    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(textFieldLogin)
        addSubview(textFieldPassword)
        addSubview(loginButton)
        addSubview(registerButton)
        addSubview(infoLabel)
    }

    private func setupLayout() {
        textFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        textFieldLogin.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textFieldLogin.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.textFieldFirstTopOffset).isActive = true
        textFieldLogin.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight).isActive = true
        textFieldLogin.widthAnchor.constraint(equalToConstant: Metric.textFieldWidth).isActive = true

        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textFieldPassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: Metric.textFieldTopIndent).isActive = true
        textFieldPassword.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight).isActive = true
        textFieldPassword.widthAnchor.constraint(equalToConstant: Metric.textFieldWidth).isActive = true

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: Metric.loginButtonTopIndent).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: Metric.loginButtonHeight).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: Metric.loginButtonWidth).isActive = true

        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Metric.registerButtonBottomIndent).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: Metric.registerButtonHeight).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: Metric.registerButtonWidth).isActive = true

        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: Metric.infoLabelTopIndent).isActive = true

    }

    // Button actions
    @objc private func moveToRegistrationPage(){
        delegate?.moveToRegistrationPage()
    }

    @objc private func autorization() {
        let email = textFieldLogin.text ?? "error"
        let password = textFieldPassword.text ?? "error"
        

        delegate?.autorization(email: email, password: password)

    }

    func showError(info: String) {
        infoLabel.text = info
    }
    
    // MARK: - Constants
    enum Colors {
        static let textFieldBackGround: UIColor = .orange
        static let textFieldText: UIColor = .systemGray
        static let textFieldPlaceHolder: UIColor = .red
        static let loginButtonBackGround: UIColor = .white
        static let registerButtonBackGround: UIColor = .clear
        static let registerButtonTitle: UIColor = .cyan
        static let loginButtonTitle: UIColor = .blue
        static let infoLabelTextColor: UIColor = .white

    }

    enum Metric {
        // textField
        static let textFieldCornerRadius: CGFloat = 2
        static let textFieldHeight: CGFloat = 30
        static let textFieldWidth: CGFloat = 200
        static let textFieldFirstTopOffset: CGFloat = 160
        static let textFieldTopIndent: CGFloat = 20
        // button
        static let buttonCornerRadius: CGFloat = 5
        // registerButton
        static let registerButtonHeight: CGFloat = 20
        static let registerButtonWidth: CGFloat = 100
        static let registerButtonBottomIndent: CGFloat = -40
        // loginButton
        static let loginButtonHeight: CGFloat = 30
        static let loginButtonWidth: CGFloat = 80
        static let loginButtonTopIndent: CGFloat = 50
        // infoLabel
        static let infoLabelTopIndent: CGFloat = 20
        static let infoLabelFontSize: CGFloat = 15

    }

    enum Strings {
        static let textFieldLoginPlaceholder: String = "Enter login"
        static let textFieldPasswordPlaceholder: String = "Enter password"
        static let registerButtonTitle: String = "Registration"
        static let loginButtonTitle: String = "Login"
        static let infoText: String = ""

        static let textFieldLoginText: String = "danil@yandex.ru"
        static let textFieldPasswordText: String = "Danil2000"
    }
}


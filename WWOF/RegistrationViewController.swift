//
//  RegistrationViewController.swift
//  WWOF
//
//  Created by Roman on 16.01.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class RegistrationViewController: UIViewController {

    // MARK: - Components
    // TextFields
    lazy var textFieldLogin: UITextField = {
        let field = UITextField()
        field.backgroundColor = Colors.textFieldBackGround
        field.textColor = Colors.textFieldText
        field.attributedPlaceholder = NSAttributedString(string: Strings.textFieldLoginPlaceholder, attributes: [NSAttributedString.Key.foregroundColor: Colors.textFieldPlaceHolder])

        field.layer.masksToBounds = true
        field.layer.cornerRadius = Metric.textFieldCornerRadius
        field.autocapitalizationType = .none

        return field
    }()

    lazy var textFieldPassword: UITextField = {
        let field = UITextField()
        field.backgroundColor = Colors.textFieldBackGround
        field.textColor = Colors.textFieldText
        field.attributedPlaceholder = NSAttributedString(string: Strings.textFieldPasswordPlaceholder, attributes: [NSAttributedString.Key.foregroundColor: Colors.textFieldPlaceHolder])

        field.layer.masksToBounds = true
        field.layer.cornerRadius = Metric.textFieldCornerRadius
        field.isSecureTextEntry = true
        field.autocapitalizationType = .none

        return field
    }()

    lazy var textFieldName: UITextField = {
        let field = UITextField()
        field.backgroundColor = Colors.textFieldBackGround
        field.textColor = Colors.textFieldText
        field.attributedPlaceholder = NSAttributedString(string: Strings.textFieldNamePlaceholder, attributes: [NSAttributedString.Key.foregroundColor: Colors.textFieldPlaceHolder])

        field.layer.masksToBounds = true
        field.layer.cornerRadius = Metric.textFieldCornerRadius

        return field
    }()

    lazy var textFieldSurname: UITextField = {
        let field = UITextField()
        field.backgroundColor = Colors.textFieldBackGround
        field.textColor = Colors.textFieldText
        field.attributedPlaceholder = NSAttributedString(string: Strings.textFieldSurnamePlaceholder, attributes: [NSAttributedString.Key.foregroundColor: Colors.textFieldPlaceHolder])

        field.layer.masksToBounds = true
        field.layer.cornerRadius = Metric.textFieldCornerRadius

        return field
    }()

    // Buttons
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(registration), for: .touchUpInside)
        button.setTitle(Strings.registerButtonTitle, for: .normal)
        button.backgroundColor = Colors.buttonBackGround
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

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.title = NSLocalizedString("RegistrationViewTitle", comment: "")
        setupHierarchy()
        setupLayout()


    }

    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(textFieldName)
        view.addSubview(textFieldSurname)
        view.addSubview(textFieldLogin)
        view.addSubview(textFieldPassword)
        view.addSubview(registerButton)
        view.addSubview(infoLabel)

    }

    private func setupLayout() {

        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        textFieldName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Metric.textFieldFirstTopOffset).isActive = true
        textFieldName.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight).isActive = true
        textFieldName.widthAnchor.constraint(equalToConstant: Metric.textFieldWidth).isActive = true

        textFieldSurname.translatesAutoresizingMaskIntoConstraints = false
        textFieldSurname.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldSurname.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: Metric.textFieldTopIndent).isActive = true
        textFieldSurname.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight).isActive = true
        textFieldSurname.widthAnchor.constraint(equalToConstant: Metric.textFieldWidth).isActive = true

        textFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        textFieldLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldLogin.topAnchor.constraint(equalTo: textFieldSurname.bottomAnchor, constant: Metric.textFieldTopIndent).isActive = true
        textFieldLogin.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight).isActive = true
        textFieldLogin.widthAnchor.constraint(equalToConstant: Metric.textFieldWidth).isActive = true

        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldPassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: Metric.textFieldTopIndent).isActive = true
        textFieldPassword.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight).isActive = true
        textFieldPassword.widthAnchor.constraint(equalToConstant: Metric.textFieldWidth).isActive = true

        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: Metric.registerButtonTopIndent).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: Metric.registerButtonHeight).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: Metric.registerButtonWidth).isActive = true

        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: Metric.infoLabelTopIndent).isActive = true

    }

}

// MARK: - Functions
extension RegistrationViewController{

    // Button actions
    @objc private func registration(){
        //navigationController?.pushViewController(UserPageController(), animated: true)
        let email = textFieldLogin.text ?? "error"
        let password = textFieldPassword.text ?? "error"
        let name = textFieldName.text ?? "error"
        let surname = textFieldSurname.text ?? "error"
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.infoLabel.text = "\(String(describing: error?.localizedDescription))"
            } else {
                let bd = Firestore.firestore()
                bd.collection("users").document(result!.user.uid).setData([
                    "First name": name,
                    "Last name": surname
                ], merge: true){ (error) in
                    if error != nil {
                        fatalError("Error in saving")
                    }
                }
                self.navigationController?.popViewController(animated: true)
            }

        }

    }
}

// MARK: - Constants

extension RegistrationViewController{
    enum Colors {
        static let textFieldBackGround: UIColor = .orange
        static let textFieldText: UIColor = .systemGray
        static let textFieldPlaceHolder: UIColor = .red
        static let buttonBackGround: UIColor = .white
        static let infoLabelTextColor: UIColor = .white

    }

    enum Metric {
        static let textFieldCornerRadius: CGFloat = 2
        static let textFieldHeight: CGFloat = 30
        static let textFieldWidth: CGFloat = 200
        static let textFieldFirstTopOffset: CGFloat = 120
        static let textFieldTopIndent: CGFloat = 20
        // registerButton
        static let registerButtonHeight: CGFloat = 30
        static let registerButtonWidth: CGFloat = 80
        static let registerButtonTopIndent: CGFloat = 50
        static let buttonCornerRadius: CGFloat = 5
        // infoLabel
        static let infoLabelTopIndent: CGFloat = 20
        static let infoLabelFontSize: CGFloat = 15

    }

    enum Strings {
        static let textFieldLoginPlaceholder: String = "Enter login"
        static let textFieldPasswordPlaceholder: String = "Enter password"
        static let textFieldNamePlaceholder: String = "Enter name"
        static let textFieldSurnamePlaceholder: String = "Enter surname"
        static let registerButtonTitle: String = "Register"
        static let infoText: String = ""

    }
}



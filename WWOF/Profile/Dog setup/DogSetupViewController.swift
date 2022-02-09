//
//  DogSetupViewController.swift
//  WWOF
//
//  Created by Roman on 18.01.2022.
//

import Foundation
import UIKit

class DogSetupViewController: UIViewController {

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

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "dog setting"
        navigationController?.navigationBar.isHidden = false
        
        view.backgroundColor = .cyan
        setupHierarchy()
        setupLayout()


    }

    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(loginButton)
    }

    private func setupLayout() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}

// MARK: - Functions
extension DogSetupViewController {

    // Button actions
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }

    // Functions


}



// MARK: - Constants

extension DogSetupViewController{
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

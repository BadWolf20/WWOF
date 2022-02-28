//
//  UserPageControlView.swift
//  WWOF
//
//  Created by Roman on 16.01.2022.
//

import Foundation
import UIKit

protocol ProfileViewDelegate {
    func moveToDogSetup()
    func setupButton()
}

class ProfileViewController: UIViewController, ProfileViewDelegate {

    // MARK: - Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    private var ProfileView: ProfileView? {
        guard isViewLoaded else { return nil }
        return view as? ProfileView
    }

    let head = headerView(frame: CGRect(x: 10, y: 10, width: 100, height: 40))
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view = WWOF.ProfileView()
        navigationItem.title = "Settings"
        //navigationItem.title = NSLocalizedString("SignInViewTitle", comment: "")
        configureView()

    }

    // MARK: - Settings
    func configureView() {
        ProfileView?.configureView()
        ProfileView?.delegate = self
    }

}

// MARK: - Functions
extension ProfileViewController {

    // Button actions
    func setupButton() {
        print("action")
    }

    func moveToDogSetup() {
        navigationController?.pushViewController(DogSetupViewController(), animated: true)
    }
}



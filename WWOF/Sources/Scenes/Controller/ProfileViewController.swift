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

    // MARK: - Properties
    private var ProfileView: ProfileView? {
        guard isViewLoaded else { return nil }
        return view as? ProfileView
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
            //title = NSLocalizedString("ProfileViewTitle", comment: "")

        view = WWOF.ProfileView()
        configureView()
        let add = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: .none)
        navigationItem.rightBarButtonItems = [add]

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.navigationBar.isHidden = true

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



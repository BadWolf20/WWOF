//
//  DogSetupViewController.swift
//  WWOF
//
//  Created by Roman on 18.01.2022.
//

import Foundation
import UIKit

protocol DogSetupViewDelegate {
    func goBackToProfilePage()
}

class DogSetupViewController: UIViewController, DogSetupViewDelegate {

    private var DogSetupView: DogSetupView? {
        guard isViewLoaded else { return nil }
        return view as? DogSetupView
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view = WWOF.DogSetupView()
        title = "dog setting"
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = NSLocalizedString("SignInViewTitle", comment: "")
        configureView()

    }

    // MARK: - Settings
    func configureView() {
        DogSetupView?.configureView()
        DogSetupView?.delegate = self
    }

}

// MARK: - Functions
extension DogSetupViewController {

    // Button actions
    func goBackToProfilePage() {
        navigationController?.popViewController(animated: true)
    }

    // Functions


}





//
//  RegistrationViewController.swift
//  WWOF
//
//  Created by Roman on 16.01.2022.
//

import UIKit
import Firebase
import FirebaseAuth

protocol RegistrationViewDelegate {
    func registration(email: String, password: String, name: String , surname: String)
}

class RegistrationViewController: UIViewController, RegistrationViewDelegate {

    private var RegistrationView: RegistrationView? {
        guard isViewLoaded else { return nil }
        return view as? RegistrationView
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.title = NSLocalizedString("RegistrationViewTitle", comment: "")

        view = WWOF.RegistrationView()
        configureView()


    }

    // MARK: - Settings
    func configureView() {
        RegistrationView?.configureView()
        RegistrationView?.delegate = self
    }

    // MARK: - Functions
    // Button actions
    func registration(email: String, password: String, name: String , surname: String){
        //navigationController?.pushViewController(UserPageController(), animated: true)

        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                //self.infoLabel.text = "\(String(describing: error?.localizedDescription))"
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



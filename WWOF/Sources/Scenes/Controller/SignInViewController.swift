//
//  ViewController.swift
//  WWOF
//
//  Created by Roman on 15.01.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {


    private var SignInView: SignInView? {
        guard isViewLoaded else { return nil }
        return view as? SignInView
    }

    let head = headerView(frame: CGRect(x: 10, y: 10, width: 100, height: 40))
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view = WWOF.SignInView()
        navigationItem.title = NSLocalizedString("SignInViewTitle", comment: "")
        configureView()
    }

    // MARK: - Settings
    func configureView() {
        SignInView?.configureView()
    }

}

// MARK: - Functions
extension SignInViewController {

    // Button actions
    func moveToRegistrationPage() {
        
        navigationController?.pushViewController(RegistrationViewController(), animated: true)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.navigationBar.isHidden = false
    }

    func autorization(email: String, password: String) {

        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                //self.infoLabel.text = error?.localizedDescription
            } else {
                userUId = result?.user.uid ?? "uid error"
                
                let bd = Firestore.firestore()
//                bd.collection("users").document(uid).getDocument(){ (document, error) in
//                    guard error == nil else {completion(nil); return}
//                }
                bd.collection("users").document(userUId).getDocument(completion: { (document, error) in
                    if let document = document, document.exists {
                        print(document.get("First name") ?? "error")
                        let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                        print("-Document data: \(dataDescription)")
                        profileData = document.data()!
                    } else {
                        //self.infoLabel.text = "Document does not exist"
                    }
                })
                self.SignInView?.showError(info: "j")
                self.moveToMain()
            }
        }
    }

    // Functions
    private func moveToMain() {

        let tabBarController = UITabBarController()

        let UserPageViewController = ProfileViewController()
        UserPageViewController.tabBarItem = UITabBarItem(title: "Profile", image: .remove, tag: 0)

        tabBarController.setViewControllers([
            UserPageViewController
        ], animated: true)
        tabBarController.tabBar.backgroundColor = .white

        navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false

        navigationController?.pushViewController(tabBarController, animated: true)
    }

    
}


//
//  ViewController.swift
//  WWOF
//
//  Created by Roman on 15.01.2022.
//

import UIKit
import Firebase
import FirebaseAuth

protocol SignInViewDelegate {
    func moveToRegistrationPage()
    func autorization(email: String, password: String)
}

class SignInViewController: UIViewController, SignInViewDelegate {

    private var SignInView: SignInView? {
        guard isViewLoaded else { return nil }
        return view as? SignInView
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view = WWOF.SignInView()
        navigationItem.title = NSLocalizedString("SignInViewTitle", comment: "")
        configureView()
        moveToMain()
    }

    // MARK: - Settings
    func configureView() {
        SignInView?.configureView()
        SignInView?.delegate = self
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
                self.SignInView?.showError(info: "j")
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

                self.moveToMain()
            }
        }
    }

    // Functions
    private func moveToMain() {

        let tabBarController = UITabBarController()


        let userPageViewController = UINavigationController(rootViewController: ProfileViewController())//ProfileViewController()
        userPageViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("ProfileViewTitle", comment: ""),
                                                         image: .remove, tag: 1)
//        userPageViewController.title = NSLocalizedString("ProfileViewTitle", comment: "")
//        userPageViewController.tabBarItem.image = .add


        let searchViewController = UINavigationController(rootViewController: SearchViewController()) //SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("SearchViewTitle", comment: ""),
                                                       image: .remove, tag: 0)
        
        let chatViewController = UINavigationController(rootViewController: ChatViewController())
        chatViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("ChatViewTitle", comment: ""),
                                                     image: .remove, tag: 2)

        tabBarController.setViewControllers([
            searchViewController,
            chatViewController,
            userPageViewController
        ], animated: true)
        tabBarController.selectedIndex = 2
        tabBarController.tabBar.backgroundColor = .red
        //navigationItem.hidesBackButton = true


        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true, completion: nil)

       // navigationController?.navigationBar.isHidden = true
        //navigationController?.interactivePopGestureRecognizer?.isEnabled = false

        //navigationController?.pushViewController(tabBarController, animated: true)
    }

    
}



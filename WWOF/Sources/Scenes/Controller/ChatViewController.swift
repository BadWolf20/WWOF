//
//  ChatViewController.swift
//  WWOF
//
//  Created by Roman on 07.03.2022.
//

import UIKit

protocol ChatViewDelegate {
}

class ChatViewController: UIViewController, ChatViewDelegate {

    // MARK: - Properties
    private var ChatView: ChatView? {
        guard isViewLoaded else { return nil }
        return view as? ChatView
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("ChatViewTitle", comment: "")

        view = WWOF.ChatView()
        configureView()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.navigationBar.isHidden = true
    }

    // MARK: - Settings
    func configureView() {
        ChatView?.configureView()
        ChatView?.delegate = self
    }

}

// MARK: - Functions
extension ChatViewController {

    // Button actions

    // Functions


}

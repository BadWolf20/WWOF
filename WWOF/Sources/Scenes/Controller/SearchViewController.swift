//
//  SearchViewController.swift
//  WWOF
//
//  Created by Roman on 28.02.2022.
//

import UIKit

protocol SearchViewDelegate {

}

class SearchViewController: UIViewController, SearchViewDelegate {

    // MARK: - Properties
    private var SearchView: SearchView? {
        guard isViewLoaded else { return nil }
        return view as? SearchView
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("SearchViewTitle", comment: "")
        tabBarController?.title = "fgh"

       // navigationController?.navigationBar.isHidden = false
        navigationItem.title = NSLocalizedString("SignInViewTitle", comment: "")
        view = WWOF.SearchView()
        configureView()


    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = NSLocalizedString("SignInViewTitle", comment: "")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //navigationController?.navigationBar.isHidden = true

        print("dis")
    }

    // MARK: - Settings
    func configureView() {
        SearchView?.configureView()
        SearchView?.delegate = self
    }

}

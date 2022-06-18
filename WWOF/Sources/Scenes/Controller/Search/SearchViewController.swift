//
//  SearchViewController.swift
//  WWOF
//
//  Created by Roman on 28.02.2022.
//

import UIKit

protocol SearchViewDelegate {
    func openFilter()
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

        view = WWOF.SearchView()
        configureView()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    // MARK: - Settings
    func configureView() {
        SearchView?.configureView()
        SearchView?.delegate = self
    }

}

// MARK: - Functions
extension SearchViewController {
    func openFilter() {
        let navigationController = UINavigationController(rootViewController: FilterViewController())

        present(navigationController, animated: true, completion: nil)
    }
}

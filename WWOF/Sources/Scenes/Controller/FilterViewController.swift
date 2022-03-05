//
//  FilterViewController.swift
//  WWOF
//
//  Created by Roman on 04.03.2022.
//

import UIKit

protocol FilterViewDelegate {

}

class FilterViewController: UIViewController, FilterViewDelegate {

    private var FilterView: FilterView? {
        guard isViewLoaded else { return nil }
        return view as? FilterView
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view = WWOF.FilterView()
        navigationItem.largeTitleDisplayMode = .always
        title = NSLocalizedString("FilterViewTitle", comment: "")
        configureView()

    }

    // MARK: - Settings
    func configureView() {
        FilterView?.configureView()
        FilterView?.delegate = self
    }

}


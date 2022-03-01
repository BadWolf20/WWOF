//
//  SearchView.swift
//  WWOF
//
//  Created by Roman on 28.02.2022.
//

import UIKit

class SearchView: UIView {

    // MARK: - Configuration
    func configureView() {

    }

    // MARK: - Properties
    var delegate: SearchViewDelegate?

    // MARK: - Views


    // MARK: - Initial

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .systemOrange
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings

    private func setupHierarchy() {

    }

    private func setupLayout() {

    }

    // MARK: - Buttons actions
    @objc private func moveToRegistrationPage() {
        
    }

}

// MARK: - Constants
extension SearchView {
    enum Colors {
        static let textFieldBackGround: UIColor = .orange

    }

    enum Metric {
        // textField
        static let textFieldCornerRadius: CGFloat = 2

    }

    enum Strings {
        static let textFieldLoginPlaceholder: String = "Enter login"

    }
}

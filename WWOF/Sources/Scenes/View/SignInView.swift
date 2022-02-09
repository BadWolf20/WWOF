//
//  SignInView.swift
//  WWOF
//
//  Created by Roman on 09.02.2022.
//

import UIKit

class SignInView: UIView {


    // MARK: - Configuration
    func configureView() {


    }

    // MARK: - Private properties


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
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings

    private func setupHierarchy() {

    }

    private func setupLayout() {

    }
}


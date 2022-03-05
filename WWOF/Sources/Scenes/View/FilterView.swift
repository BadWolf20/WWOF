//
//  FilterView.swift
//  WWOF
//
//  Created by Roman on 04.03.2022.
//

import UIKit

class FilterView: UIView {

        // MARK: - Configuration
        func configureView() {

        }

        // MARK: - Properties
        var delegate: FilterViewDelegate?

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
            backgroundColor = .blue
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
extension FilterView {
    enum Colors {
        static let searchCollectionViewBackground: UIColor = .red
        static let cityTextFieldBackground: UIColor = .blue
        static let cityTextFieldPlaceholder: UIColor = .gray
        static let filterButtonBackground: UIColor = .blue
        static let mapButtonBackground: UIColor = .blue
        static let searchButtonBackground: UIColor = .cyan
    }

    enum Metric {
        static let cityTextFieldCornerRadius: CGFloat = 5
        static let cityTextFieldFontSize: CGFloat = 18
        static let filterButtonImageSize: CGSize = CGSize(width: 40, height: 40)
        static let mapButtonImageSize: CGSize = CGSize(width: 40, height: 40)
        static let searchButtonImageSize: CGSize = CGSize(width: 30, height: 30)


    }

    enum Strings {
        static let cityTextFieldPlaceholder: String = "Введите город"
    }

    enum Images {
        static let filterButtonImage: UIImage? = UIImage(named: "Filter")
        static let mapButtonImage: UIImage? = UIImage(systemName: "map")
        static let searchButtonImage: UIImage? = UIImage(systemName: "magnifyingglass")
    }
}



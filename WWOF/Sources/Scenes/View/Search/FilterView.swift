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
    // buttons
    private lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(filtrate), for: .touchUpInside)
        button.setTitle(NSLocalizedString("FiltButtonTitle", comment: ""), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: Metric.filterButtonFontSize)
        button.backgroundColor = Colors.filterButtonBackground
        button.setTitleColor(Colors.filterButtonTitle, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metric.filterButtonCornerRadius

        return button
    }()

    private lazy var cleanButton: UIButton = {
        let button = UIButton(type: .system)
        //button.addTarget(self, action: #selector(autorization), for: .touchUpInside)
        button.setTitle(NSLocalizedString("CleanButtonTitle", comment: ""), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: Metric.cleanButtonFontSize)
        button.backgroundColor = Colors.cleanButtonBackground
        button.setTitleColor(Colors.cleanButtonTitle, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metric.cleanButtonCornerRadius

        return button
    }()

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
        addSubview(filterButton)
        addSubview(cleanButton)
    }

    private func setupLayout() {
        cleanButton.translatesAutoresizingMaskIntoConstraints = false
        cleanButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        cleanButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -5).isActive = true
        cleanButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        cleanButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        filterButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 5).isActive = true
        filterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }

    // MARK: - Buttons actions
    @objc private func filtrate() {
        delegate?.filtrate()
    }

}



// MARK: - Constants
extension FilterView {
    enum Colors {
        static let filterButtonBackground: UIColor = .red
        static let filterButtonTitle: UIColor = .blue
        static let cleanButtonBackground: UIColor = .red
        static let cleanButtonTitle: UIColor = .blue

        static let cityTextFieldPlaceholder: UIColor = .gray
        static let mapButtonBackground: UIColor = .blue
        static let searchButtonBackground: UIColor = .cyan
    }

    enum Metric {
        static let filterButtonCornerRadius: CGFloat = 10
        static let filterButtonFontSize: CGFloat = 15
        static let cleanButtonCornerRadius: CGFloat = 10
        static let cleanButtonFontSize: CGFloat = 15


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



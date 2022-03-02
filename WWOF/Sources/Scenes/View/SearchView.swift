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
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsTableViewCell.self,
                           forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.frame = CGRect.init(origin: .zero, size: frame.size)
        tableView.rowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    // TextFields
    lazy var cityTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .blue
        //field.textColor = Colors.textFieldText
        field.attributedPlaceholder = NSAttributedString(string: "Введите город", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        field.font = .systemFont(ofSize: 18)
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Metric.textFieldCornerRadius
        field.autocapitalizationType = .none
        //field.text = Strings.textFieldPasswordText

        return field
    }()

    // Buttons
    private lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        //button.addTarget(self, action: #selector(registration), for: .touchUpInside)
        //button.setTitle(Strings.registerButtonTitle, for: .normal)
        button.setImage(UIImage(named: "Filter")?.scalePreservingAspectRatio(targetSize: CGSize(width: 40, height: 40)), for: .normal)


        button.backgroundColor = .blue//Colors.buttonBackGround
        button.layer.masksToBounds = true

        return button
    }()

    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        //button.addTarget(self, action: #selector(registration), for: .touchUpInside)
        //button.setTitle(Strings.registerButtonTitle, for: .normal)
        button.setImage(UIImage(systemName: "magnifyingglass")?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30)), for: .normal)

        button.backgroundColor = .cyan//Colors.buttonBackGround
        button.layer.masksToBounds = true

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
        backgroundColor = .systemOrange
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(filterButton)
        addSubview(searchButton)
        addSubview(cityTextField)
    }

    private func setupLayout() {
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        filterButton.bottomAnchor.constraint(equalTo:  bottomAnchor, constant: -110).isActive = true

        filterButton.heightAnchor.constraint(equalToConstant: (filterButton.currentImage?.size.height)! * 1.5).isActive = true
        filterButton.widthAnchor.constraint(equalToConstant: (filterButton.currentImage?.size.width)! * 1.5).isActive = true
        filterButton.layer.cornerRadius = (filterButton.currentImage?.size.width ?? 10) * 1.5 / 2

        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        searchButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: (searchButton.currentImage?.size.width)! + 20).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: (searchButton.currentImage?.size.height)! + 10).isActive = true

        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        cityTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        cityTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        cityTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -5).isActive = true
        cityTextField.heightAnchor.constraint(equalTo: searchButton.heightAnchor).isActive = true

        
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
        static let textFieldCornerRadius: CGFloat = 5

    }

    enum Strings {
        static let textFieldLoginPlaceholder: String = "Enter login"

    }
}


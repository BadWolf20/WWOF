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
        tableView.register(DogSearchTableViewCell.self,
                           forCellReuseIdentifier: DogSearchTableViewCell.identifier)
        tableView.frame = CGRect.init(origin: .zero, size: frame.size)
        tableView.rowHeight = 100
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        //tableView.separatorInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20);

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

    private lazy var mapButton: UIButton = {
        let button = UIButton(type: .system)
        //button.addTarget(self, action: #selector(registration), for: .touchUpInside)
        //button.setTitle(Strings.registerButtonTitle, for: .normal)
        button.setImage(UIImage(systemName: "map")?.scalePreservingAspectRatio(targetSize: CGSize(width: 40, height: 40)), for: .normal)


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
        addSubview(tableView)
        addSubview(filterButton)
        addSubview(searchButton)
        addSubview(cityTextField)
        addSubview(mapButton)
    }

    private func setupLayout() {
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        filterButton.bottomAnchor.constraint(equalTo:  bottomAnchor, constant: -110).isActive = true

        filterButton.heightAnchor.constraint(equalToConstant: (filterButton.currentImage?.size.height)! * 1.5).isActive = true
        filterButton.widthAnchor.constraint(equalToConstant: (filterButton.currentImage?.size.width)! * 1.5).isActive = true
        filterButton.layer.cornerRadius = (filterButton.currentImage?.size.width ?? 10) * 1.5 / 2

        mapButton.translatesAutoresizingMaskIntoConstraints = false
        mapButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        mapButton.bottomAnchor.constraint(equalTo:  bottomAnchor, constant: -110).isActive = true

        mapButton.heightAnchor.constraint(equalToConstant: (filterButton.currentImage?.size.height)! * 1.5).isActive = true
        mapButton.widthAnchor.constraint(equalToConstant: (filterButton.currentImage?.size.width)! * 1.5).isActive = true
        mapButton.layer.cornerRadius = (filterButton.currentImage?.size.width ?? 10) * 1.5 / 2

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


        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        
    }

    // MARK: - Buttons actions
    @objc private func moveToRegistrationPage() {
        
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension SearchView: UITableViewDelegate, UITableViewDataSource {

    // При выборе строки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You push '\(indexPath.row)' row")

        moveToSetttingView()

    }

    // При момент до выбора строки (собираемся выбрать)
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        if indexPath.row == 0 && indexPath.section == 0 {
//            return nil
//        }
        return indexPath
    }


    // Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     //Количество ячеек в каждой секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10

    }

    // Set the spacing between sections
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100
//    }

    // Определение содержимого ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: DogSearchTableViewCell.identifier, for: indexPath) as! DogSearchTableViewCell


        cell.configureView()

        return cell
    }

    // Переход на нужное View
    func moveToSetttingView() {

            print("No page")

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


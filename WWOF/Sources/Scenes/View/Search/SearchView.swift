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
    lazy var searchCollectionView: UICollectionView = {
        let view = UICollectionView(frame: bounds, collectionViewLayout: createDogSection())
        view.backgroundColor = Colors.searchCollectionViewBackground

        view.register(DogSearchCollectionViewCell.self, forCellWithReuseIdentifier: DogSearchCollectionViewCell.reuseId)

        view.delegate = self
        view.dataSource = self

        return view
    }()

    // TextFields
    lazy var cityTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = Colors.cityTextFieldBackground
        field.attributedPlaceholder = NSAttributedString(string: Strings.cityTextFieldPlaceholder,
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        field.font = .systemFont(ofSize: Metric.cityTextFieldFontSize)
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Metric.cityTextFieldCornerRadius
        field.autocapitalizationType = .none
        //field.text = Strings.textFieldPasswordText

        return field
    }()

    // Buttons
    private lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(openFilter), for: .touchUpInside)
        //button.setTitle(Strings.registerButtonTitle, for: .normal)
        button.setImage(Images.filterButtonImage?.scalePreservingAspectRatio(targetSize: Metric.filterButtonImageSize), for: .normal)


        button.backgroundColor = Colors.filterButtonBackground
        button.layer.masksToBounds = true

        return button
    }()

    private lazy var mapButton: UIButton = {
        let button = UIButton(type: .system)
        //button.addTarget(self, action: #selector(registration), for: .touchUpInside)
        //button.setTitle(Strings.registerButtonTitle, for: .normal)
        button.setImage(Images.mapButtonImage?.scalePreservingAspectRatio(targetSize: Metric.mapButtonImageSize), for: .normal)


        button.backgroundColor = Colors.mapButtonBackground
        button.layer.masksToBounds = true

        return button
    }()

    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        //button.addTarget(self, action: #selector(registration), for: .touchUpInside)
        //button.setTitle(Strings.registerButtonTitle, for: .normal)
        button.setImage(Images.searchButtonImage?.scalePreservingAspectRatio(targetSize: Metric.searchButtonImageSize), for: .normal)

        button.backgroundColor = Colors.searchButtonBackground
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
        addSubview(searchCollectionView)
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


        searchCollectionView.translatesAutoresizingMaskIntoConstraints = false
        searchCollectionView.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 10).isActive = true
        searchCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        searchCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        searchCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        
    }

    // MARK: - Buttons actions
    @objc private func openFilter() {
        delegate?.openFilter()
    }

}

    // MARK: - collectionViewLayout
extension SearchView {
    func createDogSection() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout{ (sectionindex, layoutEnviroment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(140 + 10))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .estimated(1))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)


            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .none
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            return section
        }

        return layout

    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension SearchView: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5//dogList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DogSearchCollectionViewCell.reuseId, for: indexPath) as? DogSearchCollectionViewCell
        cell?.layer.cornerRadius = 10
        cell?.configure()
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        collectionView.deselectItem(at: indexPath, animated: true)
    }

}

// MARK: - Constants
extension SearchView {
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


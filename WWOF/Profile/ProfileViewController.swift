//
//  UserPageControlView.swift
//  WWOF
//
//  Created by Roman on 16.01.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Views
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: view.bounds, collectionViewLayout: createCompLayout())
        view.backgroundColor = Colors.ColectionViewBackGround
        //view.register(DogCell.self, forCellWithReuseIdentifier: DogCell.reuseId)
        let nibCell = UINib(nibName: Strings.dogCellViewNibName, bundle: nil)
        view.register(nibCell, forCellWithReuseIdentifier: Strings.dogCellViewId)

        view.delegate = self
        view.dataSource = self

        return view
    }()

    lazy var head: headerView = {
        let v = headerView(frame: CGRect(x: 20, y: 20, width: 330, height: 140))
        v.settingsButton.addTarget(self, action: #selector(headerButton), for: .touchUpInside)
        v.backgroundColor = Colors.headerViewBackGround
        v.layer.cornerRadius = 20 //Metric.headerViewCornerRadius
        
        return v
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Settings"
        setupHierarchy()
        setupLayout()

    }

    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(head)
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        view.backgroundColor = .cyan
        head.translatesAutoresizingMaskIntoConstraints = false
        head.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Metric.headerViewTopIndent).isActive = true
        head.bottomAnchor.constraint(equalTo: view.topAnchor, constant: Metric.headerViewBottomIndent).isActive = true
        head.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Metric.headerViewRightIndent).isActive = true
        head.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.headerViewLeftIndent).isActive = true

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: head.bottomAnchor, constant: Metric.collectionViewTopIndent).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }

}

// MARK: - Functions
extension ProfileViewController {

    // Button actions
    @objc func headerButton() {
        print("action")
    }

    // Functions
    func createCompLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout{ (sectionindex, layoutEnviroment) -> NSCollectionLayoutSection? in
            let section = dogList[sectionindex]

            switch section.name {
            case "1":
                return self.createFriendsSection()
            case "2":
                return self.createDogsSection()
            default:
                return self.createDogsSection()
            }
        }
        return layout
    }

    func createFriendsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(86))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item, item])


        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10)
        return section
    }

    func createDogsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(222))
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
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10//dogList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // nibCell = UINib(nibName: "DogViewCell", bundle: nil)
        //collectionView.register(nibCell, forCellWithReuseIdentifier: "DogViewCellid")

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogViewCellid", for: indexPath) as? DogViewCell
        cell?.layer.cornerRadius = 10
        cell?.configure(with: dogList[0])
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }

}

// MARK: - Constants

extension ProfileViewController{
    enum Colors {
        static let ColectionViewBackGround: UIColor = .orange
        static let headerViewBackGround: UIColor = .systemTeal
        static let textFieldPlaceHolder: UIColor = .red
        static let loginButtonBackGround: UIColor = .white
        static let registerButtonBackGround: UIColor = .clear
        static let registerButtonTitle: UIColor = .cyan
        static let loginButtonTitle: UIColor = .blue
        static let infoLabelTextColor: UIColor = .white

    }

    enum Metric {
        // headerView
        static let headerViewTopIndent: CGFloat = 0
        static let headerViewBottomIndent: CGFloat = 160
        static let headerViewLeftIndent: CGFloat = 10
        static let headerViewRightIndent: CGFloat = -10
        static let headerViewCornerRadius: CGFloat = 15
        // collectionView
        static let collectionViewTopIndent: CGFloat = 10

    }

    enum Strings {
        static let dogCellViewNibName: String = "DogViewCell"
        static let dogCellViewId: String = "DogViewCellid"
        static let registerButtonTitle: String = "Registration"
        static let loginButtonTitle: String = "Login"
        static let infoText: String = ""

        static let textFieldLoginText: String = "danil@yandex.ru"
        static let textFieldPasswordText: String = "Danil2000"
    }
}

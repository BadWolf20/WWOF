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
        //view.frame = CGRect.init(origin: CGPoint(x: 10, y: head.frame.height + 20), size: view.frame.size)
        view.backgroundColor = .systemOrange

        //view.register(DogCell.self, forCellWithReuseIdentifier: DogCell.reuseId)
        let nibCell = UINib(nibName: "DogViewCell", bundle: nil)
        view.register(nibCell, forCellWithReuseIdentifier: "DogViewCellid")


        view.delegate = self
        view.dataSource = self

        return view
    }()

    
    lazy var head: headerView = {
        let v = headerView(frame: CGRect(x: 20, y: 20, width: 330, height: 140))
        v.settingsButton.addTarget(self, action: #selector(rtt), for: .touchUpInside)
        v.personImage.image = UIImage(named: "DefaultPerson")
        return v
    }()

    @objc func rtt() {
        print("action")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Settings"
        setupHierarchy()
        setupLayout()


        //createDataSouse()
        //reloadData()
    }


    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(collectionView)
        view.addSubview(head)
    }

    private func setupLayout() {
        head.translatesAutoresizingMaskIntoConstraints = false
        head.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        head.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        head.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        head.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: head.bottomAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }


    func createCompLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout{ (sectionindex, layoutEnviroment) -> NSCollectionLayoutSection? in
            let section = dogList[sectionindex]

            switch section.name {
            case "1":
                return self.createFriendsSection()
            case "2":
                return self.createFriendRequestSection()
            default:
                return self.createFriendRequestSection()
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

    func createFriendRequestSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(156))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])


        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10//dogList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let nibCell = UINib(nibName: "DogViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "DogViewCellid")

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogViewCellid", for: indexPath) as? DogViewCell
        cell?.configure(with: dogList[0])
        return cell!
    }

}

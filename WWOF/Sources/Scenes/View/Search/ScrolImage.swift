//
//  ScrolImage.swift
//  WWOF
//
//  Created by Roman on 07.03.2022.
//

import UIKit

class ScrolImage: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .red
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    // MARK: - Settings
    func setupHierarchy() {
        addSubview(searchCollectionView)

    }

    func setupLayout() {
        searchCollectionView.translatesAutoresizingMaskIntoConstraints = false
        searchCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        searchCollectionView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        searchCollectionView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        searchCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true

    }

    lazy var searchCollectionView: UICollectionView = {
        let view = UICollectionView(frame: bounds, collectionViewLayout: createDogSection())
        view.backgroundColor = .red //Colors.searchCollectionViewBackground

        view.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseId)

        view.delegate = self
        view.dataSource = self

        return view
    }()

    func createDogSection() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout{ (sectionindex, layoutEnviroment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(130 + 10),
                                                  heightDimension: .fractionalHeight(130 + 10 + 35))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(1),
                                                   heightDimension: .estimated(1))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item, item])
            //group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

            return section
        }

        return layout

    }

}
// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ScrolImage: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5//dogList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseId, for: indexPath) as? ImageCollectionViewCell
        cell?.layer.cornerRadius = 10
        cell?.configure()
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        collectionView.deselectItem(at: indexPath, animated: true)
    }

}

//
//  ImageCollectionViewCell.swift
//  WWOF
//
//  Created by Roman on 07.03.2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    static var reuseId: String = "ImageCell"

    // MARK: - Views
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill

        return image
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        let redView = UIView(frame: bounds)
            redView.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        self.selectedBackgroundView = redView

        self.clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings
    func setupHierarchy() {
        addSubview(mainImage)

    }

    func setupLayout() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mainImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainImage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        mainImage.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }

}

// MARK: - Functions
extension ImageCollectionViewCell {

    func configure() {
        mainImage.image = UIImage(named: "DefaultDog")
        mainImage.backgroundColor = .yellow
    }

}

// MARK: - Constants

extension ImageCollectionViewCell{
    enum Colors {
        static let breedLabelTextColor: UIColor = .black
        static let sexLabelTextColor: UIColor = .black
        static let ageLabelTextColor: UIColor = .black
        static let distanceLabelTextColor: UIColor = .black



    }

    enum Metric {
        static let distanceLabelFontSize: CGFloat = 16
    }
}


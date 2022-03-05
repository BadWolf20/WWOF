//
//  DogSearchCollectionViewCell.swift
//  WWOF
//
//  Created by Roman on 02.03.2022.
//

import UIKit

class DogSearchCollectionViewCell: UICollectionViewCell {
    
    static var reuseId: String = "DogSearchCell"

    // MARK: - Views
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill

        return image
    }()

    // Labels
    private lazy var breedLabel: UILabel = {
        var label = UILabel()
        label.text = "Breed"
        label.textColor = Colors.breedLabelTextColor
        //label.font = .systemFont(ofSize: Metric.infoLabelFontSize, weight: .light)
        label.textAlignment = .left
        //label.preferredMaxLayoutWidth = 250
        // label.numberOfLines = 1

        return label
    }()

    private lazy var sexLabel: UILabel = {
        var label = UILabel()
        label.text = "Sex"
        label.textColor = Colors.sexLabelTextColor
        label.textAlignment = .left

        return label
    }()

    private lazy var ageLabel: UILabel = {
        var label = UILabel()
        label.text = "Age"
        label.textColor = Colors.ageLabelTextColor
        label.textAlignment = .left

        return label
    }()

    private lazy var distanceLabel: UILabel = {
        var label = UILabel()
        label.text = "Dist"
        label.textColor = Colors.distanceLabelTextColor
        label.textAlignment = .center
        label.font = .systemFont(ofSize: Metric.distanceLabelFontSize, weight: .regular)

        return label
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
        addSubview(breedLabel)
        addSubview(sexLabel)
        addSubview(ageLabel)
        addSubview(distanceLabel)
    }

    func setupLayout() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        mainImage.bottomAnchor.constraint(equalTo: distanceLabel.topAnchor, constant: -5).isActive = true
       // mainImage.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
       // mainImage.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).priority = UILayoutPriority.init(999)
        //mainImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        mainImage.widthAnchor.constraint(equalTo: mainImage.heightAnchor).isActive = true

        breedLabel.translatesAutoresizingMaskIntoConstraints = false
        breedLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 20).isActive = true
        breedLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20).isActive = true
        breedLabel.topAnchor.constraint(equalTo: mainImage.topAnchor).isActive = true

        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        sexLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 20).isActive = true
        sexLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20).isActive = true
        sexLabel.topAnchor.constraint(equalTo: breedLabel.bottomAnchor, constant: 0).isActive = true

        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 20).isActive = true
        ageLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20).isActive = true
        ageLabel.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 0).isActive = true

        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.leadingAnchor.constraint(lessThanOrEqualTo: mainImage.leadingAnchor, constant: 0).isActive = true
        distanceLabel.trailingAnchor.constraint(lessThanOrEqualTo: mainImage.trailingAnchor, constant: 0).isActive = true
        distanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        distanceLabel.centerXAnchor.constraint(equalTo: mainImage.centerXAnchor).isActive = true
        distanceLabel.heightAnchor.constraint(equalToConstant: Metric.distanceLabelFontSize).isActive = true


    }

}

// MARK: - Functions
extension DogSearchCollectionViewCell {

    func configure() {
        mainImage.image = UIImage(named: "DefaultDog")
        mainImage.backgroundColor = .yellow
    }

}

// MARK: - Constants

extension DogSearchCollectionViewCell{
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

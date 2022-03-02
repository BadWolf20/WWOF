//
//  DogSearchCollectionViewCell.swift
//  WWOF
//
//  Created by Roman on 02.03.2022.
//

import UIKit

class DogSearchCollectionViewCell: UICollectionViewCell {
    
    static var reuseId: String = "DogSearchCell"

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

    }

    func setupLayout() {

    }

}

// MARK: - Functions
extension DogSearchCollectionViewCell {

    func configure() {

    }

}

// MARK: - Constants

extension DogSearchCollectionViewCell{
    enum Colors {

    }

    enum Metric {

    }
}

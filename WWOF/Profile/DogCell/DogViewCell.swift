//
//  DogViewCell.swift
//  WWOF
//
//  Created by Roman on 16.01.2022.
//

import UIKit

class DogViewCell: UICollectionViewCell {
    //var reuseIdentifier = "DogViewCell"

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with info: Dog) {
        //breedLabel.text = info.breed
        //NameLabel.text = info.name
        //friendImageView.image = info.imageMain
    }
}

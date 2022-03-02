//
//  DogSearchTableViewCell.swift
//  WWOF
//
//  Created by Roman on 02.03.2022.
//

import UIKit

final class DogSearchTableViewCell: UITableViewCell {

    static let identifier = "DogSearchTableViewCell"

    // MARK: - Configuration
    func configureView() {
        var content = defaultContentConfiguration()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 20
        backgroundColor = .green
        content.text = "data.name"
        //content.image = data.imageMain
        //content.imageProperties.maximumSize = CGSize(width: 30, height: 30)
        contentConfiguration = content
        
    }

    // При повторном использовании
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.layer.masksToBounds = true

        self.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//    }

}

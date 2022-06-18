//
//  ChatView.swift
//  WWOF
//
//  Created by Roman on 07.03.2022.
//

import UIKit

class ChatView: UIView {

    // MARK: - Configuration
    func configureView() {

    }

    // MARK: - Properties
    var delegate: ChatViewDelegate?

    // MARK: - Views
    // Buttons
    private lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        //button.addTarget(self, action: #selector(openFilter), for: .touchUpInside)
        button.setTitle("efrfr", for: .normal)
        //button.setImage(Images.filterButtonImage?.scalePreservingAspectRatio(targetSize: Metric.filterButtonImageSize), for: .normal)


        button.backgroundColor = .red //Colors.filterButtonBackground
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
       // backgroundColor = .cyan
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings
    private func setupHierarchy() {
        addSubview(filterButton)

    }

    private func setupLayout() {
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        filterButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }

    // Button actions
    @objc private func goBack(){
    }

}

//
//  headerView.swift
//  WWOF
//
//  Created by Roman on 17.01.2022.
//

import UIKit

class headerView: UIView {
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var surnameLabel: UILabel!
    let kCONTENT_XIB_NAME = "headerView"


    // nib/xib load
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func commonInit() {
        let viewFrom = Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)![0] as! UIView
        viewFrom.frame = self.bounds
        addSubview(viewFrom)
    }

}

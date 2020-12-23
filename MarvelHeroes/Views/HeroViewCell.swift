//
//  HeroViewCell.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 20/12/20.
//

import UIKit

class HeroViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var heroLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupAppearance()
    }

    // MARK: - Utils
    fileprivate func setupAppearance() {
        AppearanceCustom.setCornerRadius(to: self.contentView, cornerRadius: 12)
        AppearanceCustom.setCornerRadius(to: self.visualEffectView, cornerRadius: 12)
        AppearanceCustom.setShadow(to: [self],
                                   shadowColor: UIColor.black.cgColor,
                                   shadowOffset: CGSize(width: 0, height: 2),
                                   shadowRadius: 2.0,
                                   shadowOpacity: 0.5)
    }
}

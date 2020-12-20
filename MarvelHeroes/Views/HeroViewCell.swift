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
    func setupAppearance() {
        self.contentView.layer.cornerRadius = 12
        self.contentView.layer.masksToBounds = true
        
        self.visualEffectView.layer.cornerRadius = 12
        self.visualEffectView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
}

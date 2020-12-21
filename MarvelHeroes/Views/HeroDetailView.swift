//
//  HeroDetailView.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 20/12/20.
//

import UIKit

class HeroDetailView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var detailLinkButton: UIButton!
    @IBOutlet weak var wikiLinkButton: UIButton!
    @IBOutlet weak var comicsLinkButton: UIButton!
    
    var heroTest: HeroTest!
    
    // MARK: - Actions
    @IBAction func goToDetailHero(_ sender: UIButton) {
        if let url = URL(string: heroTest.urls.detail) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func goToWikiHero(_ sender: UIButton) {
        if let url = URL(string: heroTest.urls.wiki) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func goToComicsHero(_ sender: UIButton) {
        if let url = URL(string: heroTest.urls.comics) {
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - CycleView
    override func viewDidLoad() {
        super.viewDidLoad()
        showHeroData()
        setupAppearance()
    }
    
    // MARK: - Funcs
    func showHeroData() {
        if let image = UIImage(named: heroTest.image) {
            self.imageView.image = image
        }
        self.nameLabel.text = heroTest.name
        self.descriptionLabel.text = heroTest.description
    }
    
    // MARK: - Utils
    func setupAppearance() {
        self.backgroundView.layer.cornerRadius = 12
        self.backgroundView.layer.masksToBounds = true
        self.backgroundView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        
        self.backgroundView.layer.shadowColor = UIColor.black.cgColor
        self.backgroundView.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.backgroundView.layer.shadowRadius = 10
        self.backgroundView.layer.shadowOpacity = 0.9
        self.backgroundView.layer.masksToBounds = false
        
        self.detailLinkButton.layer.cornerRadius = 6
        self.detailLinkButton.layer.masksToBounds = true
        
        self.wikiLinkButton.layer.cornerRadius = 6
        self.wikiLinkButton.layer.masksToBounds = true
        
        self.comicsLinkButton.layer.cornerRadius = 6
        self.comicsLinkButton.layer.masksToBounds = true
    }
}

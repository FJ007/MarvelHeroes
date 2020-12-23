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
    @IBOutlet weak var closedButton: UIButton!
    
    var hero: Hero!
    var urlDetail: String?
    var urlWiki: String?
    var urlComics: String?
    
    /// Testing Data Debug
    var heroTest: HeroTest!
    
    // MARK: - Actions
    @IBAction func goToDetailHero(_ sender: UIButton) {
        if let url = URL(string: urlDetail ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func goToWikiHero(_ sender: UIButton) {
        if let url = URL(string: urlWiki ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func goToComicsHero(_ sender: UIButton) {
        if let url = URL(string: urlComics ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showHeroData()
        self.setupAppearance()
        
        /// Testing Data Debug
        //testDataDetailView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateUI()
    }
    
    // MARK: - Funcs
    fileprivate func showHeroData() {
        if let url = URL(string: (hero.thumbnail.getImageURL())) {
            NetworkinkgProvider.shared.loadNetworkImage(url: url) { image in
                self.imageView.image = image
            }
        }
        self.nameLabel.text = hero.name
        if hero.description == "" {
            self.descriptionLabel.text = NSLocalizedString("heroDescriptionViewDetail", comment: "Hero Description")
        } else {
            self.descriptionLabel.text = hero.description
        }
    }
    
    fileprivate func updateUI() {
        self.dismissButtons()
        
        for item in hero.urls {
            switch item.type {
            case .detail:
                urlDetail = item.url
                self.detailLinkButton.isHidden = false
            case .wiki:
                urlWiki = item.url
                self.wikiLinkButton.isHidden = false
            case .comiclink:
                urlComics = item.url
                self.comicsLinkButton.isHidden = false
            }
        }
    }
    
    // MARK: - Utils
    fileprivate func setupAppearance() {
        self.backgroundView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        AppearanceCustom.setCornerRadius(to: self.backgroundView, cornerRadius: 12)
        AppearanceCustom.setShadow(to: self.backgroundView,
                                      shadowColor: UIColor.black.cgColor,
                                      shadowOffset: CGSize(width: 5, height: 5),
                                      shadowRadius: 10,
                                      shadowOpacity: 0.9)
        
        self.closedButton.alpha = 0.9
        AppearanceCustom.setShadow(to: self.closedButton,
                                   shadowColor: UIColor.black.cgColor,
                                   shadowOffset: CGSize(width: 1, height: 1),
                                   shadowRadius: 1.0,
                                   shadowOpacity: 0.5)
        
        AppearanceCustom.setCornerRadius(to: self.detailLinkButton, cornerRadius: 12)
        AppearanceCustom.setCornerRadius(to: self.wikiLinkButton, cornerRadius: 12)
        AppearanceCustom.setCornerRadius(to: self.comicsLinkButton, cornerRadius: 12)
    }
    
    private func dismissButtons() {
        self.detailLinkButton.isHidden = true
        self.wikiLinkButton.isHidden = true
        self.comicsLinkButton.isHidden = true
    }
}


// MARK: - Testing Debug
extension HeroDetailView {
    func testDataDetailView() {
        if let image = UIImage(named: heroTest.image) {
            self.imageView.image = image
        }
        self.nameLabel.text = heroTest.name
        self.descriptionLabel.text = heroTest.description
    }
}

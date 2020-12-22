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
        showHeroData()
        setupAppearance()
        
        /// Testing Data Debug
        //testDataDetailView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
        
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
            self.descriptionLabel.text = "Currently there are not information."
        } else {
            self.descriptionLabel.text = hero.description
        }
    }
    
    fileprivate func updateUI() {
        self.detailLinkButton.isHidden = true
        self.wikiLinkButton.isHidden = true
        self.comicsLinkButton.isHidden = true
        
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
    func setupAppearance() {
        self.backgroundView.layer.cornerRadius = 12
        self.backgroundView.layer.masksToBounds = true
        self.backgroundView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        
        self.backgroundView.layer.shadowColor = UIColor.black.cgColor
        self.backgroundView.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.backgroundView.layer.shadowRadius = 10
        self.backgroundView.layer.shadowOpacity = 0.9
        self.backgroundView.layer.masksToBounds = false
        
        self.closedButton.alpha = 0.9
        self.closedButton.layer.shadowColor = UIColor.black.cgColor
        self.closedButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.closedButton.layer.shadowRadius = 1.0
        self.closedButton.layer.shadowOpacity = 0.5
        self.closedButton.layer.masksToBounds = false
        
        self.detailLinkButton.layer.cornerRadius = 6
        self.detailLinkButton.layer.masksToBounds = true
        
        self.wikiLinkButton.layer.cornerRadius = 6
        self.wikiLinkButton.layer.masksToBounds = true
        
        self.comicsLinkButton.layer.cornerRadius = 6
        self.comicsLinkButton.layer.masksToBounds = true
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

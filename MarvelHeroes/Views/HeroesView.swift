//
//  HeroesView.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 20/12/20.
//

import UIKit

class HeroesView: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let reuseIdentifier = "HeroCell"
    private let segueDetailView = "segueDetailView"
    
    let heroes = NetworkinkgProvider.shared
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("titleHeroesView", comment: "Title Navigation Bar")
        self.navigationController?.navigationBar.accessibilityIdentifier = "InitAppListHeroesNavBar"
        self.setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        heroes.getAllHeroes()
        self.reloadDataCollectionView()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueDetailView {
            if let selectedIndexPath = sender as? NSIndexPath,
               let detailView = segue.destination as? HeroDetailView {
                detailView.hero = (heroes.searchCharacters?.data.results[selectedIndexPath.row])! as Hero
                
                /// Testing  Data Debug
                //detailView.heroTest = heroesTest.heroes[selectedIndexPath.row] as HeroTest
            }
        }
    }
    
    @IBAction func unwindToDetailView(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
    }
    
    // MARK: - Funcs
    fileprivate func setupCollectionView() {
        self.collectionView.register(UINib(nibName: "HeroViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.accessibilityIdentifier = "InitAppCollectionView"
    }
    
    fileprivate func reloadDataCollectionView() {
        self.activityIndicator.startAnimating()
        NetworkinkgProvider.shared.dispatchGroup.notify(queue: .main) {
            self.collectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    
    // MARK: - Utils
    func getImageURL(row: Int) -> String? {
        heroes.searchCharacters?.data.results[row].thumbnail.getImageURL()
    }
}

// MARK: - UICollectionViewDataSource
extension HeroesView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroes.searchCharacters?.data.results.count ?? 0
        
        /// Testing Data Debug
        //heroesTest.heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HeroViewCell

        if let url = URL(string: getImageURL(row: indexPath.row)!) {
            heroes.loadNetworkImage(url: url) { image in
                cell.imageView.image = image
            }
        }
        cell.heroLabel.text = heroes.searchCharacters?.data.results[indexPath.row].name ?? ""

        /// Testing Data Debug
        //testDataCollectionView(cell: cell, row: indexPath.row)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension HeroesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: segueDetailView, sender: indexPath)
    }
}


// MARK: - Testing Debug
extension HeroesView {
    func testDataCollectionView(cell: HeroViewCell, row: Int) {
        if let image = UIImage(named: heroesTest.heroes[row].image) {
            cell.imageView.image = image
        }
        cell.heroLabel.text = heroesTest.heroes[row].name
    }
}

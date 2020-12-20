//
//  HeroesView.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 20/12/20.
//

import UIKit

class HeroesView: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Vars & Let
    private let reuseIdentifier = "HeroCell"
    private let segueDetailView = "segueDetailView"
    
    // MARK: - CycleView
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "HeroViewCell", bundle: nil),
                                     forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.title = "SuperHeroes"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueDetailView {
            if let selectedIndexPath = sender as? NSIndexPath,
               let detailView = segue.destination as? HeroDetailView {
                detailView.heroTest = heroesTest.heroes[selectedIndexPath.row] as HeroTest
            }
        }
    }
}


// MARK: - UICollectionViewDataSource
extension HeroesView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroesTest.heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HeroViewCell
        
        let imageString = heroesTest.heroes[indexPath.row].image
        cell.imageView.image = UIImage(named: imageString)
        cell.heroLabel.text = heroesTest.heroes[indexPath.row].name
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension HeroesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: segueDetailView, sender: indexPath)
    }
}


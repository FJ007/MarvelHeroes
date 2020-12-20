//
//  HeroDetailView.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 20/12/20.
//

import UIKit

class HeroDetailView: UIViewController {

    var heroTest: HeroTest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(heroTest.name)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

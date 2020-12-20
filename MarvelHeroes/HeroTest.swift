//
//  HeroeTest.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 20/12/20.
//

import Foundation
import UIKit

struct HeroTest {
    let name: String
    let description: String
    let image: String
}

final class HeroesTest {
    var heroes: [HeroTest]
    
    init() {
        let spiderman = HeroTest(name: "Spider-man",
                                 description:
                                """
                                Spider-Man es un superhéroe ficticio creado por los escritores y editores Stan Lee y Steve Ditko. Apareció por primera vez en el
                                cómic de antología Amazing Fantasy # 15, en la Edad de Plata de los cómics.
                                """,
                                 image: "spiderman-test")
        let batman = HeroTest(name: "Batman",
                              description:
                                """
                                Batman es un personaje creado por los estadounidenses Bob Kane y Bill Finger, ​ y propiedad de DC Comics. Apareció por primera vez en
                                la historia titulada «El caso del sindicato químico» de la revista Detective Comics N.º 27, lanzada por la editorial National
                                Publications el 30 de marzo de 1939.
                                """,
                              image: "batman-test")
        let ironman = HeroTest(name: "Iron Man",
                               description:
                                """
                                Iron Man es un superhéroe ficticio que aparece en los cómics estadounidenses publicados por Marvel Comics. El personaje fue cocreado
                                por el escritor y editor Stan Lee, desarrollado por el guionista Larry Lieber y diseñado por los artistas Don Heck y Jack Kirby.
                                """,
                               image: "ironman-test")
        
        heroes = [spiderman, batman, ironman, spiderman, batman, ironman]
    }
}

let heroesTest = HeroesTest()

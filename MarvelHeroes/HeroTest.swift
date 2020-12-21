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
    let urls: Links
}

struct Links {
    let detail: String
    let wiki: String
    let comics: String
}

final class HeroesTest {
    var heroes: [HeroTest]
    
    init() {
        let spiderman = HeroTest(name: "Spider-man",
                                 description:
                                """
                                Spider-Man es un superhéroe ficticio creado por los escritores y editores Stan Lee y Steve Ditko.
                                Apareció por primera vez en el cómic de antología Amazing Fantasy # 15, en la Edad de Plata de los
                                cómics.
                                """,
                                 image: "spiderman-test",
                                 urls: Links(
                                        detail:                                "http://marvel.com/comics/characters/1009610/spider-man?utm_campaign=apiRef&utm_source=9fbf6495c4d40b6b81df06bf92f12ca1",
                                        wiki: "http://marvel.com/universe/Spider-Man_(Peter_Parker)?utm_campaign=apiRef&utm_source=9fbf6495c4d40b6b81df06bf92f12ca1",
                                        comics: "http://marvel.com/comics/characters/1009610/spider-man?utm_campaign=apiRef&utm_source=9fbf6495c4d40b6b81df06bf92f12ca1"
                                 ))
        let captainAmerica = HeroTest(name: "Captain America",
                              description:
                                """
                                Tras tres meses de someterse a un programa de entrenamiento físico y táctico, encomiendan a Steve Rogers
                                su primera misión como Capitán América. Armado con un escudo indestructible, emprende la guerra contra
                                la perversa organización HYDRA.
                                """,
                              image: "captain-test",
                              urls: Links(
                                    detail:                                "http://marvel.com/comics/characters/1009220/captain_america?utm_campaign=apiRef&utm_source=9fbf6495c4d40b6b81df06bf92f12ca1",
                                    wiki: "http://marvel.com/universe/Captain_America_(Steve_Rogers)?utm_campaign=apiRef&utm_source=9fbf6495c4d40b6b81df06bf92f12ca1",
                                    comics: "http://marvel.com/comics/characters/1009220/captain_america?utm_campaign=apiRef&utm_source=9fbf6495c4d40b6b81df06bf92f12ca1"
                              ))
        let ironman = HeroTest(name: "Iron Man",
                               description:
                                """
                                Iron Man es un superhéroe ficticio que aparece en los cómics estadounidenses publicados por Marvel
                                Comics. El personaje fue cocreado por el escritor y editor Stan Lee, desarrollado por el guionista Larry
                                Lieber y diseñado por los artistas Don Heck y Jack Kirby.
                                """,
                               image: "ironman-test",
                               urls: Links(
                                    detail:                                "http://marvel.com/comics/characters/1009368/iron_man?utm_campaign=apiRef&utm_source=9fbf6495c4d40b6b81df06bf92f12ca1",
                                    wiki: "http://marvel.com/universe/Iron_Man_(Anthony_Stark)?utm_campaign=apiRef&utm_source=9fbf6495c4d40b6b81df06bf92f12ca1",
                                    comics: "http://marvel.com/comics/characters/1009368/iron_man?utm_campaign=apiRef&utm_source=9fbf6495c4d40b6b81df06bf92f12ca1"
                               ))
        
        heroes = [spiderman, captainAmerica, ironman, spiderman, captainAmerica, ironman]
    }
}

/// Variable Global para Testing
let heroesTest = HeroesTest()

//
//  GameModel.swift
//  ChessTrainer2
//
//  Created by Guest User on 6/11/21.
//

import Foundation
import UIKit


struct JsonOpening: Codable {
    var name: String?
    var moves: String?
}

let uniqueOpenings2 = ["Alekhine Defense", "Amar Gambit", "Amar Opening", "Amazon Attack", "Amsterdam Attack", "Anderssen Opening", "Australian Defense", "Barnes Defense", "Barnes Opening", "Benko Gambit", "Benoni Defense", "Bird Opening", "Bishop\'s Opening", "Blackburne Shilling", "Blackmar-Diemer Gambit", "Blumenfeld Countergambit", "Bogo-Indian Defense", "Bongcloud Attack", "Borg Defense", "Borg Opening", "Bronstein Gambit", "Budapest Defense", "Canard Opening", "Caro-Kann Defense", "Carr Defense", "Catalan Opening", "Center Game", "Clemenz Opening", "Colle System", "Crab Opening", "Czech Defense", "Danish Gambit", "Doery Defense", "Dresden Opening", "Duras Gambit", "Dutch Defense", "East Indian", "Elephant Gambit", "English Defense", "English Opening", "English Openings", "English Orangutan", "English Rat", "Englund Gambit", "Formation", "Four Knights", "Franco-Benoni Defense", "French Defense", "Fried Fox", "Gedult\'s Opening", "Giuoco Piano", "Global Opening", "Goldsmith Defense", "Grob Opening", "Gruenfeld Defense", "Guatemala Defense", "Gunderam Defense", "Hippopotamus Defense", "Horwitz Defense", "Hungarian Opening", "Indian Game", "Irish Gambit", "Italian Game", "Kadas Opening", "Kangaroo Defense", "King\'s Gambit", "King\'s Indian", "King\'s Knight", "King\'s Pawn", "Lasker Simul", "Latvian Gambit", "Lemming Defense", "Lion Defense", "London System", "Marienbad System", "Mexican Defense", "Mieses Opening", "Mikenas Defense", "Modern Defense", "Montevideo Defense", "Neo-Gruenfeld Defense", "Nimzo-Indian Defense", "Nimzo-Larsen Attack", "Nimzowitsch Defense", "Nimzowitsch-Larsen Attack", "Norwegian Defense", "Old Benoni", "Old Indian", "Owen Defense", "Paleface Attack", "Petrov", "Petrov\'s Defense", "Philidor Defense", "Pirc Defense", "Polish Defense", "Polish Opening", "Ponziani Opening", "Portuguese Opening", "Pterodactyl Defense", "Queen\'s Gambit", "Queen\'s Indian", "Queen\'s Pawn", "Rat Defense", "Reti Opening", "Richter-Veresov Attack", "Robatsch (Modern)", "Robatsch Defense", "Rubinstein Opening", "Russian Game", "Ruy Lopez", "Saragossa Opening", "Scandinavian Defense", "Scotch Gambit", "Scotch Game", "Semi-Slav Defense", "Sicilian Defense", "Slav Defense", "Slav Indian", "Sodium Attack", "Spanish Opening", "St. George", "System", "Tarrasch Defense", "Tayler Opening", "Three Knights", "Torre Attack", "Trompowsky Attack", "Valencia Opening", "Van Geet", "Van\'t Kruijs", "Venezolana Opening", "Veresov Opening", "Vienna Game", "Vulture Defense", "Wade Defense", "Ware Defense", "Ware Opening", "Yusupov-Rubinstein System", "Zaire Defense", "Zukertort Defense", "Zukertort Opening"]

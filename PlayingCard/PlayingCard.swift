//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Irakli Nozadze on 08.10.22.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    
    var description: String { return "\(suit)\(rank)" }
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        
        var description: String { return rawValue }
        
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️ "
        case diamonds = "♦️"
        
        static var all = [Suit.spades, .hearts, .clubs, .diamonds]
    }
    
    enum Rank: CustomStringConvertible {
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .numeric(let pips): return String(pips)
            case .face(let kind): return kind
            }
        }
    
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace:
                return 1
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            case .numeric(let pips):
                return pips
            default: return 0
            }
        }
        
        static var all: [Rank] {
//            needs type cant infer it or change Rank.ace
            var allRanks: [Rank] = [.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
//            same here it can only infer if first element has it
            allRanks += [Rank.face("J"), .face("Q"), .face("K")]
            return allRanks
        }
    }
}

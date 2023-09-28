//
//  BitList.swift
//  Bitcoin_App
//
//

import Foundation

// Based off the profs example, not sure if its right.
class BitList: Codable{
    var BitSet : BitSetType
}

class BitSetType: Codable{
    var Query: String
    var Result: [BitCoin]
}

// I dont think we used this when I get it to work go through everything and remove extra code
class BitCoin: Codable{
    var price: Int
}

//
//  BitList.swift
//  Bitcoin_App
import Foundation


class BitList: Codable{
    var BitSet : BitSetType
}

class BitSetType: Codable{
    var Query: String
    var Result: [BitCoin]
}

class BitCoin: Codable{
    var price: Int
}

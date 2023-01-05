//
//  NFT.swift
//  CryptoWallet
//
//  Created by Nikita on 05.01.2023.
//

import Foundation

import SwiftUI

class NFT: Identifiable {
    let id = UUID()

    var name: String
    var imgUrl: String
    var floor: String
    var volume: String
    
    init(name: String, imgUrl: String, floor: String, volume: String) {
        self.name = name
        self.imgUrl = imgUrl
        self.floor = floor
        self.volume = volume
    }
    
}

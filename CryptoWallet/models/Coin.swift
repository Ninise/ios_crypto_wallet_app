//
//  Coin.swift
//  CryptoWallet
//
//  Created by Nikita on 29.12.2022.
//

import Foundation
import SwiftUI

class Coin: Identifiable {
    let id = UUID()

    var coinName: String
    var coinTicker: String
    var coinImage: String
    var coinPrice: String
    var coinGoingUp: Bool
    var coinMove: String
    var coinColors: [Color]
    
    init(coinName: String, coinTicker: String, coinImage: String, coinPrice: String, coinGoingUp: Bool, coinMove: String, coinColors: [Color]) {
        self.coinName = coinName
        self.coinTicker = coinTicker
        self.coinImage = coinImage
        self.coinPrice = coinPrice
        self.coinGoingUp = coinGoingUp
        self.coinMove = coinMove
        self.coinColors = coinColors
    }
    
}

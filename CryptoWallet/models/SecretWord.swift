//
//  SecretWord.swift
//  CryptoWallet
//
//  Created by Nikita on 23.12.2022.
//

import Foundation


class SecretWord: Identifiable {
    let id = UUID()

    var text: String
    var isSelected: Bool = true
    
    init(text: String, isSelected: Bool) {
        self.text = text
        self.isSelected = isSelected
    }
    
}

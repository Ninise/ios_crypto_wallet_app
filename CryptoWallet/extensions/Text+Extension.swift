//
//  Text+Extension.swift
//  CryptoWallet
//
//  Created by Nikita on 19.12.2022.
//

import Foundation
import SwiftUI

extension Text {
    public func foregroundLinearGradient(
        colors: [Color],
        startPoint: UnitPoint,
        endPoint: UnitPoint) -> Text
    {
        
        self.foregroundStyle(
            
            LinearGradient(
                colors: [.red, .blue, .green, .yellow],
                startPoint: .leading,
                endPoint: .trailing
            )
        ) as! Text
        
    }
}

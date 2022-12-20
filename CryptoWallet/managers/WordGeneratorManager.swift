//
//  WordGeneratorManager.swift
//  CryptoWallet
//
//  Created by Nikita on 20.12.2022.
//

import Foundation

class WordGeneratorManager {
    
    class func getSecretWords() async throws -> [String] {
        guard let url = URL(string: "https://random-word-api.herokuapp.com/word?number=12") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode([String].self, from: data)
        
        return decodedData
    }
}

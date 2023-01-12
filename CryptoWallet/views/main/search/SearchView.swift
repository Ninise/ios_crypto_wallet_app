//
//  SearchView.swift
//  CryptoWallet
//
//  Created by Nikita on 06.01.2023.
//

import SwiftUI

struct SearchView: View {
    
    var coins: [Coin] = [
        Coin(coinName: "Bitcoin", coinTicker: "BTC", coinImage: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/1024/Bitcoin-BTC-icon.png", coinPrice: "17,000", coinGoingUp: true, coinMove: "2.5", coinColors: [Color(hex: "#FEA82E"), Color(hex: "#F49219")], mcap: "893.12"),
        
        Coin(coinName: "Ethreum", coinTicker: "ETH", coinImage: "https://png.pngtree.com/png-vector/20210427/ourmid/pngtree-ethereum-cryptocurrency-coin-icon-png-image_3246438.jpg", coinPrice: "1,100", coinGoingUp: false, coinMove: "1.5", coinColors: [Color(hex: "#383838"), Color(hex: "#161717")], mcap: "393.12"),
        
        Coin(coinName: "Polygon", coinTicker: "MATIC", coinImage: "https://cloudfront-us-east-1.images.arcpublishing.com/coindesk/DPYBKVZG55EWFHIK2TVT3HTH7Y.png", coinPrice: "0,8", coinGoingUp: false, coinMove: "0.5", coinColors: [Color(hex: "#7E43DA"), Color(hex: "#6A32CF")], mcap: "33.12"),
        
        
        Coin(coinName: "Solana", coinTicker: "SOL", coinImage: "https://upload.wikimedia.org/wikipedia/en/b/b9/Solana_logo.png", coinPrice: "18", coinGoingUp: true, coinMove: "5", coinColors: [Color(hex: "#1DEA97"), Color(hex: "#9241F2")], mcap: "3.12")
        
    ]
    
    private var gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let nfts = [
        NFT(name: "Cryptopunk", imgUrl: "https://static01.nyt.com/images/2021/03/12/arts/11nft-auction-cryptopunks-print/11nft-auction-cryptopunks-print-mobileMasterAt3x.jpg", floor: "3.1", volume: "2,124"),
        NFT(name: "Bored Mutant Ape", imgUrl: "https://openseauserdata.com/files/5980f00bb92660428bdd057a5e2f4b96.png", floor: "7.5", volume: "17,242"),
        
        NFT(name: "Doodles", imgUrl: "https://pbs.twimg.com/media/FNYNaDAVIAY1x6b.png", floor: "5.1", volume: "15,670"),
        NFT(name: "Cool Cat", imgUrl: "https://coolcatstron.com/img/9987.jpg", floor: "0.6", volume: "22.2"),
        NFT(name: "Bored Ape", imgUrl: "https://www.ledgerinsights.com/wp-content/uploads/2021/12/adidas-nft-bored-ape-810x524.jpg", floor: "10.6", volume: "22,242"),
        NFT(name: "Bored Ape", imgUrl: "https://academy-public.coinmarketcap.com/optimized-uploads/0dfcf8328ee841dead9e67e28e1887c1.jpg", floor: "13.1", volume: "12,124")
        
    ]
    
        
    @State private var text: String = "Bitcoin"
   
    @State private var isEditing = false
    
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            VStack {

                HStack {
                    
                    
                    TextField("Search ...", text: $text)
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                        .font(.custom(FontUtils.MAIN_REGULAR, size: 16))
                                   .padding(7)
                                   .padding(.horizontal, 25)
                                   .background(Color(.white))
                                   .cornerRadius(8)
                                   .padding(.horizontal, 10)
                                   .onTapGesture {
                                       self.isEditing = true
                                   }
                                   .overlay(
                                       HStack {
                                           Image(systemName: "magnifyingglass")
                                               .foregroundColor(.gray)
                                               .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                               .padding(.leading, 20)
                                    
                                           if isEditing {
                                               Button(action: {
                                                   self.text = ""
                                               }) {
                                                   Image(systemName: "multiply.circle.fill")
                                                       .foregroundColor(.gray)
                                                       .padding(.trailing, 20)
                                               }
                                           }
                                       }
                                   )
                                   .padding(.horizontal, 20)
                                   .padding(.top, 10)
                                   .shadow(radius: 5)
                    
                               if isEditing {
                                   Button(action: {
                                       self.isEditing = false
                                       self.text = ""
                    
                                   }) {
                                       Text("Cancel")
                                           .foregroundColor(.gray)
                                           .padding(.trailing, 20)
                                   }
                                   .padding(.trailing, 10)
                                   .transition(.move(edge: .trailing))
                                   .animation(.default)
                               }
                }
                
                
                SectionButtonView(title: "My coins", action: {
                    
                })
                
                
                ScrollView (.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(coins) { coin in
                            ListItemView(coin: coin)
                        }
                        
                    }
                }
                .padding(.top, 15)
                
                SectionButtonView(title: "My NFTs", action: {
                    
                })
                
                ScrollView (.vertical, showsIndicators: false) {
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(0..<nfts.count) { index in
                            
                            NFTItemView(nft: nfts[index])
                                .background(.white)
                                .cornerRadius(10, corners: .allCorners)
                                .shadow(radius: 5)
                                .padding(.top, 5)
                            
                            
                        }
                    }
                }
                
                
            }
        }
        .padding(.top, 55)
    
    }
}

struct SearchView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchView()
    }
}

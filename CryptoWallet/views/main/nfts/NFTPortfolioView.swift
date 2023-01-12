//
//  NFTPortfolioView.swift
//  CryptoWallet
//
//  Created by Nikita on 05.01.2023.
//

import SwiftUI

struct NFTPortfolioView: View {
    
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
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            
            VStack (alignment: .leading) {
                Text("Your NFT portfolio")
                    .font(.custom(FontUtils.MAIN_BOLD, size: 16))
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                
                Text("$63,120.80")
                    .font(.custom(FontUtils.MAIN_BOLD, size: 28))
                    .foregroundColor(.black)
                
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
        .navigationBarHidden(true)
        .padding()
    }
}

struct NFTPortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        NFTPortfolioView()
    }
}

struct NFTItemView: View {
    
    var nft: NFT
    
    var body: some View {
        VStack (alignment: .leading) {
            AsyncImage(url: URL(string: nft.imgUrl)) { image in image.resizable()
                
            } placeholder: { Color.gray }
                .frame(width: 160, height: 160)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(nft.name).foregroundColor(.purple).font(.custom(FontUtils.MAIN_BOLD, size: 18))
                .lineLimit(1)
                .gradientForeground([Color(hex: "#7A17D7"), Color(hex: "#ED74CD"), Color(hex: "#EBB5A3") ])
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Floor")
                        .font(.custom(FontUtils.MAIN_MEDIUM, size: 14))
                        .foregroundColor(.gray)
                    
                    HStack {
                   
                        Image("eth_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15)
                        
                        Text(nft.floor)
                            .font(.custom(FontUtils.MAIN_BOLD, size: 14))
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        
                        Image(systemName: "lines.measurement.horizontal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10)
                        
                    }
                    
                }
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Volume")
                        .font(.custom(FontUtils.MAIN_MEDIUM, size: 14))
                        .foregroundColor(.gray)
                    
                    HStack {
                   
                        Image("eth_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15)
                        
                        Text(nft.volume)
                            .font(.custom(FontUtils.MAIN_BOLD, size: 14))
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        
                        Image(systemName: "lines.measurement.horizontal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10)
                        
                    }
                    
                }
            }
            .padding(.top, 5)
        }
        .padding(15)
        .frame(width: 190)
    }
}

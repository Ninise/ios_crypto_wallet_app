//
//  HomeView.swift
//  CryptoWallet
//
//  Created by Nikita on 02.01.2023.
//

import SwiftUI
import Charts
import Toast

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct HomeView: View {
    
    private let url = "https://pyxis.nymag.com/v1/imgs/654/1f1/08de774c11d89cb3f4ecf600a33e9c8283-24-keanu-reeves.rsquare.w700.jpg"
    
    @State var selectedList: String
    
    var coins: [Coin] = [
        Coin(coinName: "Bitcoin", coinTicker: "BTC", coinImage: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/1024/Bitcoin-BTC-icon.png", coinPrice: "17,000", coinGoingUp: true, coinMove: "2.5", coinColors: [Color(hex: "#FEA82E"), Color(hex: "#F49219")], mcap: "893.12"),
        
        Coin(coinName: "Ethreum", coinTicker: "ETH", coinImage: "https://png.pngtree.com/png-vector/20210427/ourmid/pngtree-ethereum-cryptocurrency-coin-icon-png-image_3246438.jpg", coinPrice: "1,100", coinGoingUp: false, coinMove: "1.5", coinColors: [Color(hex: "#383838"), Color(hex: "#161717")], mcap: "393.12"),
        
        Coin(coinName: "Polygon", coinTicker: "MATIC", coinImage: "https://cloudfront-us-east-1.images.arcpublishing.com/coindesk/DPYBKVZG55EWFHIK2TVT3HTH7Y.png", coinPrice: "0,8", coinGoingUp: false, coinMove: "0.5", coinColors: [Color(hex: "#7E43DA"), Color(hex: "#6A32CF")], mcap: "33.12"),
        
        
        Coin(coinName: "Solana", coinTicker: "SOL", coinImage: "https://upload.wikimedia.org/wikipedia/en/b/b9/Solana_logo.png", coinPrice: "18", coinGoingUp: true, coinMove: "5", coinColors: [Color(hex: "#1DEA97"), Color(hex: "#9241F2")], mcap: "3.12")
        
    ]
    
    var lists = [
        "💠 All",
        "⭐️ Favorites",
        "📺 Watchlist"
    ]
    
    init() {
        self.selectedList = self.lists[0]
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            RadialGradient(gradient: Gradient(colors: [Color(hex: "#7A17D7"), Color(hex: "#ED74CD"), Color(hex: "#EBB5A3") ]), center: .topTrailing, startRadius: 100, endRadius: 800)
                .frame(height: 250)
                .edgesIgnoringSafeArea(.top)
          
            
            VStack {
                
                HomeTopView(url: url)
                    .padding(.top, 50) // beacause of the background gradient on main view
                
                HomeBalanceView()
                
                
                SectionButtonView(title: "Your Stock", action: {
                    Toast.text("Your Stock clicked").show()
                })
                
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(coins) { coin in
                            YourStockItemView(coinName: coin.coinName, coinTicker: coin.coinTicker, coinImage: coin.coinImage, coinPrice: coin.coinPrice, coinGoingUp: coin.coinGoingUp, coinMove: coin.coinMove, coinColors: coin.coinColors)
                        }
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                           
                    }
                    
                }
                .padding(.horizontal, 15)
                
                SectionButtonView(title: "Lists", action: {
                    Toast.text("Lists clicked").show()
                })
                
                ListsCategoriesView(selectedList: $selectedList, lists: lists)
                
                ScrollView (.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(coins) { coin in
                            ListItemView(coin: coin)
                        }
                        
                    }
                }
                .padding(.top, 15)
                
                Spacer(minLength: 50)
                
                
            }
        }
        
        
    }
}

struct HomeTopView: View {
    
    var url: String
    
    var body: some View {
        ZStack {
            
            VStack {
                HStack {
                    
                    Button(action: {}, label: {
                        AsyncImage(url: URL(string: url)) { image in image.resizable()
                            
                        } placeholder: { Color.gray }
                            .frame(width: 65, height: 65)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                    })
                    
                    
                    VStack (alignment: .leading) {
                        
                        
                        Button(action: {}, label: {
                            HStack {
                                Text("0x2D3b3A14c7ff8156dF61c85b77392291c0747e87")
                                    .font(.custom(FontUtils.MAIN_BOLD, size: 16))
                                    .truncationMode(.middle)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: 160)
                                    .lineLimit(1)
                                Image(systemName: "doc.on.doc")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: 15, height: 15)
                            }
                        })
                        
                        
                        Button(action: {}, label: {
                            Image(systemName: "qrcode.viewfinder")
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                            Text("Receive")
                                .font(.custom(FontUtils.MAIN_REGULAR, size: 14))
                                .foregroundColor(.white)
                        })
                    }
                    .padding(.leading, 15)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "bell")
                            .resizable()
                            .foregroundColor(.black)
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    })
                    .frame(width: 45, height: 45)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(radius: 5)
                    
                    
                }
                .padding(20)
                
            }
            .padding(.horizontal, 10)
        }
    }
}

struct HomeBalanceView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack (alignment: .leading) {
                    Text("Your Balance")
                        .font(.custom(FontUtils.MAIN_REGULAR, size: 18)).foregroundColor(.gray)
                        .padding(.bottom, 2)
                    
                    Text("$63,120.80")
                        .font(.custom(FontUtils.MAIN_BOLD, size: 24)).foregroundColor(.black)
                }
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                })
                .frame(width: 40, height: 40)
                .background(.black)
                .cornerRadius(30)
                .shadow(radius: 5)
            }
            .padding(.top, 20)
            .padding(.horizontal, 25)
            
            Spacer()
            
            HStack {
                Chart {
                    ForEach(0..<7, id: \.self) { item in
                        LineMark(
                            x: .value("x", item),
                            y: .value("y", Int.random(in: 0...7))
                        )
                        .lineStyle(.init(lineWidth: 3))
                        .foregroundStyle(.green)
                        
                    }
                }
                .chartYAxis(.hidden)
                .chartXAxis(.hidden)
                
            }
            .padding(.top, 10)
            .padding(.horizontal, 25)
            .padding(.bottom, 20)
            
        }
        .frame(height: 170)
        .background(.white)
        .cornerRadius(15, corners: .allCorners)
        .shadow(radius: 4)
        .padding(.horizontal, 30)
    }
}

struct YourStockItemView: View {
    
    var coinName: String
    var coinTicker: String
    var coinImage: String
    var coinPrice: String
    var coinGoingUp: Bool
    var coinMove: String
    var coinColors: [Color]

    var body: some View {
    
            VStack (alignment: .leading) {
                
                HStack (alignment: .center) {
                    AsyncImage(url: URL(string: coinImage)) { image in image.resizable()
                        
                    } placeholder: { Color.gray }
                        .frame(width: 45, height: 45)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    
                    
                    
                    VStack (alignment: .leading) {
                        Text(coinName)
                            .font(.custom(FontUtils.MAIN_BOLD, size: 16))
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        
                        
                        
                        Text(coinTicker)
                            .font(.custom(FontUtils.MAIN_MEDIUM, size: 14))
                            .foregroundColor(.white)
                            .opacity(0.5)
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                HStack {
                    VStack (alignment: .leading) {
                        Text("$\(coinPrice)")
                            .font(.custom(FontUtils.MAIN_BOLD, size: 16))
                            .foregroundColor(.white)
                        
                        HStack (alignment: .center) {
                            Image(systemName: coinGoingUp ? "chevron.up" : "chevron.down")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12)
                                .foregroundColor(coinGoingUp ? .green : .red)
                                .font(Font.title.weight(.bold))
                            
                            Text("\(coinMove)%")
                                .font(.custom(FontUtils.MAIN_REGULAR, size: 14))
                                .foregroundColor(coinGoingUp ? .green : .red)
                            
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 7)
                        .background(.white)
                        .cornerRadius(30, corners: .allCorners)
                        
                    }
                    
                    Chart {
                        ForEach(0..<5, id: \.self) { item in
                            LineMark(
                                x: .value("x", item),
                                y: .value("y", Int.random(in: 0...5))
                            )
                            .lineStyle(.init(lineWidth: 2))
                            .foregroundStyle(.white)
                            .opacity(0.5)
                            
                        }
                    }
                    .chartYAxis(.hidden)
                    .chartXAxis(.hidden)
                }
                
                
            }
            .padding()
            .frame(width: 190, height: 170)
            .background( LinearGradient(
                colors: coinColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing))
            
            .cornerRadius(15, corners: .allCorners)
            .shadow(radius: 3)
        
    }
}

struct SectionButtonView: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Text(title)
                    .font(.custom(FontUtils.MAIN_BOLD, size: 24))
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.gray)
            }
            .padding(.top, 10)
            .padding(.horizontal, 30)
        })
    }
}

struct ListsCategoriesView: View {
    
    @Binding var selectedList: String
    var lists: [String]
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                
                ForEach(lists, id: \.self) { string in
                    Button(action: {
                        selectedList = string
                    }, label: {
                        Text(string)
                            .font(.custom(FontUtils.MAIN_BOLD, size: 16))
                            .foregroundColor(selectedList == string ? .white : .black)
                            .padding(10)
                            .padding(.horizontal, 5)
                            .background(selectedList == string ? .black : .white)
                            .cornerRadius(20, corners: .allCorners)
                        
                    })
                }
                
            }
        }
        .padding(.horizontal, 30)
    }
}

struct ListItemView: View {
    
    var coin: Coin
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: coin.coinImage)) { image in image.resizable()
                
            } placeholder: { Color.gray }
                .frame(width: 45, height: 45)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 40))
            
            VStack (alignment: .leading) {
                Text(coin.coinName)
                    .font(.custom(FontUtils.MAIN_BOLD, size: 16))
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                
                HStack (alignment: .center) {
                    Image(systemName: coin.coinGoingUp ? "chevron.up" : "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12)
                        .foregroundColor(coin.coinGoingUp ? .green : .red)
                        .font(Font.title.weight(.bold))
                    
                    Text("\(coin.coinMove)%")
                        .font(.custom(FontUtils.MAIN_REGULAR, size: 14))
                        .foregroundColor(coin.coinGoingUp ? .green : .red)
                    
                }
                
                
            }
            
            Spacer()
            
            VStack (alignment: .trailing) {
                Text("$\(coin.coinPrice)")
                    .font(.custom(FontUtils.MAIN_BOLD, size: 16))
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                
                Text("MCap $\(coin.mcap) Bn")
                    .font(.custom(FontUtils.MAIN_REGULAR, size: 13))
                    .foregroundColor(.black)
            }
            
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 10)
    }
}

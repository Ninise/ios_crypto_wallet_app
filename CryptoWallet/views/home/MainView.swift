//
//  HomeView.swift
//  CryptoWallet
//
//  Created by Nikita on 27.12.2022.
//

import SwiftUI
import Charts

struct MainView: View {
    
    @State var selectedIndex = 0
    private let AVATAR_URL = "https://ninisee.com/static/media/profile.844de107a17fe45c9adf.jpg"
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
          

            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
                
            ScrollView {
                ZStack {
                    switch selectedIndex {
                    case 0:
                        HomeView(withURL: AVATAR_URL)

                    case 1:
                        NavigationView {
                            VStack {
                                Text("search")
                            }
                        }
                    case 2:
                        NavigationView {
                            VStack {
                                Text("scan")
                            }
                        }
                    case 3:
                        NavigationView {
                            VStack {
                                Text("history")
                            }
                        }
                        
                    default:
                        NavigationView {
                            VStack {
                                Text("profile")
                            }
                        }
                        
                    }
                }
                
            }
            .edgesIgnoringSafeArea(.top)
            

            
            
            
            BottomNavigationView(selectedIndex: $selectedIndex)
        }
        .navigationBarBackButtonHidden()
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct BottomNavigationView: View {
    
    @Binding var selectedIndex: Int
    
    let icons = [
        "house",
        "magnifyingglass",
        "qrcode.viewfinder",
        "clock.arrow.circlepath",
        "person"
    ]
    
    var body: some View {
        VStack {
            
            Divider()
            
            ZStack {
                
                EmptyView()
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.white)
                    .blur(radius: 30)
                
                
                HStack {
                    
                    ForEach(0..<5, id: \.self) { number in
                        Spacer()
                        
                        Button(action: {
                            self.selectedIndex = number
                        }, label: {
                            if number == 2 {
                                Image(systemName: icons[number])
                                    .font(.system(size: 25, weight: .regular, design: .rounded))
                                    .foregroundColor(.white)
                                    .frame(width: 40, height: 40)
                                    .padding(2)
                                    .background(selectedIndex == number ? .black : Color(UIColor.lightGray))
                                    .cornerRadius(30)
                            } else {
                                Image(systemName: icons[number])
                                    .font(.system(size: 25, weight: .regular, design: .rounded))
                                    .foregroundColor(selectedIndex == number ? .black : Color(UIColor.lightGray))
                            }
                        })
                        
                        Spacer()
                        
                        
                    }
                }
                
                
            }
            
            
        }
    }
}

struct HomeView: View {
    
    @State var url: String
    
    
    
    var coins: [Coin] = [
        Coin(coinName: "Bitcoin", coinTicker: "BTC", coinImage: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/1024/Bitcoin-BTC-icon.png", coinPrice: "17,000", coinGoingUp: true, coinMove: "2.5", coinColors: [Color(hex: "#FEA82E"), Color(hex: "#F49219")]),
        
        Coin(coinName: "Ethreum", coinTicker: "ETH", coinImage: "https://png.pngtree.com/png-vector/20210427/ourmid/pngtree-ethereum-cryptocurrency-coin-icon-png-image_3246438.jpg", coinPrice: "1,100", coinGoingUp: false, coinMove: "1.5", coinColors: [Color(hex: "#383838"), Color(hex: "#161717")]),
        
        Coin(coinName: "Polygon", coinTicker: "MATIC", coinImage: "https://cloudfront-us-east-1.images.arcpublishing.com/coindesk/DPYBKVZG55EWFHIK2TVT3HTH7Y.png", coinPrice: "0,8", coinGoingUp: false, coinMove: "0.5", coinColors: [Color(hex: "#7E43DA"), Color(hex: "#6A32CF")]),
        
        
        Coin(coinName: "Solana", coinTicker: "SOL", coinImage: "https://upload.wikimedia.org/wikipedia/en/b/b9/Solana_logo.png", coinPrice: "18", coinGoingUp: true, coinMove: "5", coinColors: [Color(hex: "#1DEA97"), Color(hex: "#9241F2")])
        
    ]
    
    init(withURL url:String) {
        self.url = url
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            RadialGradient(gradient: Gradient(colors: [Color(hex: "#7A17D7"), Color(hex: "#ED74CD"), Color(hex: "#EBB5A3") ]), center: .topTrailing, startRadius: 100, endRadius: 800)
                .frame(height: 250)
                .edgesIgnoringSafeArea(.top)
          
            
            VStack {
                
                HomeTopView(url: url)
                
                HomeBalanceView()
                
                
                Button(action: {
                    
                }, label: {
                    HStack {
                        Text("Your Stock")
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
                
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(coins) { coin in
                            YourStockListView(coinName: coin.coinName, coinTicker: coin.coinTicker, coinImage: coin.coinImage, coinPrice: coin.coinPrice, coinGoingUp: coin.coinGoingUp, coinMove: coin.coinMove, coinColors: coin.coinColors)
                        }
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                           
                    }
                    
                }
                .padding(.horizontal, 15)
                
                
                
                
                
                
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
                                    .frame(maxWidth: 90)
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
                
                Spacer()
            }
            .padding(.top, 50)
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
        .padding(.top, 5)
    }
}


struct YourStockListView: View {
    
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
                                y: .value("y", Int.random(in: 0...7))
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

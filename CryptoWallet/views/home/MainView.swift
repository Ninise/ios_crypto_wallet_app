//
//  HomeView.swift
//  CryptoWallet
//
//  Created by Nikita on 27.12.2022.
//

import SwiftUI

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
                        NavigationView {
                            HomeView(withURL: AVATAR_URL)
                                .edgesIgnoringSafeArea(.top)
                        }
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
                .edgesIgnoringSafeArea(.top)
                
                
            }
            .edgesIgnoringSafeArea(.top)
            
            
            BottomNavigationView(selectedIndex: $selectedIndex)
        }
        
        
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
    
    init(withURL url:String) {
        self.url = url
    }
    
    var body: some View {
        
        VStack {
            
            VStack {
                HStack {
                    
                    Button(action: {}, label: {
                        AsyncImage(url: URL(string: url)) { image in image.resizable()
                            
                        } placeholder: { Color.gray }
                            .frame(width: 60, height: 60) .clipShape(RoundedRectangle(cornerRadius: 30))
                    })
                    
                    
                    VStack (alignment: .leading) {
                        
                        
                        Button(action: {}, label: {
                            HStack {
                                Text("0x2D3b3A14c7ff8156dF61c85b77392291c0747e87")
                                    .font(.custom(FontUtils.MAIN_BOLD, size: 14))
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
                                .font(.custom(FontUtils.MAIN_REGULAR, size: 12))
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
                    
                    
                }
                .padding(20)
                .padding(.top, 50)
                
                Spacer()
                
            }
            .background(RadialGradient(gradient: Gradient(colors: [Color(hex: "#7A17D7"), Color(hex: "#ED74CD"), Color(hex: "#EBB5A3") ]), center: .topTrailing, startRadius: 100, endRadius: 800)
                .frame(height: 250)
                .opacity(1))
            
            .frame(height: 250)
            
            Spacer()
            
        }
    }
}

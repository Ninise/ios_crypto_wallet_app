//
//  HomeView.swift
//  CryptoWallet
//
//  Created by Nikita on 27.12.2022.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedIndex = 0
    
  
    var body: some View {
        
        ZStack(alignment: .bottom) {
            

            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
                
            ScrollView {
                ZStack {
                    switch selectedIndex {
                    case 0:
                        HomeView()
                            
                    case 1:
                        SearchView()
                    case 2:
                        ScanView()
                    case 3:
                        
                        RadialGradient(gradient: Gradient(colors: [.purple.opacity(0.5), .white]), center: .topTrailing, startRadius: 30, endRadius: 300)
                            .opacity(1)
                            .edgesIgnoringSafeArea(.all)
                        
                        NFTPortfolioView()
                            .padding(.top, 55)
                        
                        
                        
                    default:
                        RadialGradient(gradient: Gradient(colors: [Color(hex: "#7A17D7"), Color(hex: "#ED74CD"), Color(hex: "#EBB5A3") ]), center: .topTrailing, startRadius: 100, endRadius: 800)
                            .frame(height: 550)
                            .edgesIgnoringSafeArea(.top)
                        
                        ProfileView()
                            .padding(.top, 50)
                        
                    }
                }
                
            }
            .edgesIgnoringSafeArea(.top)
            
            

            
            
            
            BottomNavigationView(selectedIndex: $selectedIndex)
                .edgesIgnoringSafeArea(.bottom)
                
        }
        .navigationBarBackButtonHidden()
        .preferredColorScheme(.dark)
        
        
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
        "crown",
        "person"
    ]
    
    var body: some View {
        VStack {
            
            ZStack {
                Divider()
                    .shadow(radius: 10)
                    
                    ZStack {
                    
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.white)
                    
                    
                
                
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



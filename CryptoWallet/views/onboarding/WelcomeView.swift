//
//  WelcomeView.swift
//  CryptoWallet
//
//  Created by Nikita on 19.12.2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [Color(hex: "#7A17D7"), Color(hex: "#ED74CD"), Color(hex: "#EBB5A3") ]), center: .topTrailing, startRadius: 100, endRadius: 800)
                    .opacity(1)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    ZStack  {
                        Image("welcome_crypto")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .padding(.top, 50)
                    }
                  
                    Spacer()
                        
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Buy & Sell")
                                .font(.custom(FontUtils.MAIN_BOLD, size: 28))
                            
                            Text("Instantly").foregroundColor(.purple).font(.custom(FontUtils.MAIN_BOLD, size: 32))
                                .underline()
                                .gradientForeground([Color(hex: "#7A17D7"), Color(hex: "#ED74CD"), Color(hex: "#EBB5A3") ])
                        }
                        
                            
                        
                        Text("Use our swapper to safely swap tokens at the best prives, instantly")
                            .foregroundColor(.gray)
                            .font(.custom(FontUtils.MAIN_REGULAR, size: 16))
                            .multilineTextAlignment(.center)
                            .padding(.top, 1)
                        
                        Spacer(minLength: 20)
                        
                        Button {} label: {
                                           Text("Create a New Wallet")
                                .font(.custom(FontUtils.MAIN_REGULAR, size: 18))
                                                 .foregroundColor(.white)
                                                 .padding(10)
                                                 
                                         }
                                         .frame(maxWidth: .infinity, minHeight: 50)
                                         .padding(5)
                                         .background(Color.black)
                                         .cornerRadius(30)
                        
                        Button {} label: {
                                           Text("Already Have a Wallet")
                                .font(.custom(FontUtils.MAIN_MEDIUM, size: 18))
                                                 .foregroundColor(.black)
                                                 .padding(10)
                                                 
                                         }
                                         .frame(maxWidth: .infinity, minHeight: 50)
                                         .padding(5)
                                         .background(Color.white)
                                         .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                               .stroke(Color.black, lineWidth: 2)
                                         )
                                         .cornerRadius(30)
                                         .padding(.top, 10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .padding(.all, 20)
                    .background(.white)
                    
                }
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

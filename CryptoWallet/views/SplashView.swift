//
//  SplashView.swift
//  CryptoWallet
//
//  Created by Nikita on 14.12.2022.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                
                
                RadialGradient(gradient: Gradient(colors: [.purple.opacity(0.5), .white]), center: .topTrailing, startRadius: 30, endRadius: 300)
                    .opacity(1)
                    .edgesIgnoringSafeArea(.all)
                    
                RadialGradient(gradient: Gradient(colors: [.purple.opacity(0.5), .white.opacity(0)]), center: .bottomLeading, startRadius: 10, endRadius: 300)
                    .edgesIgnoringSafeArea(.all)

                
                Image("splash_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                NavigationLink(destination: WelcomeView(),
                                                              isActive: $isActive,
                                                              label: {  })
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            self.isActive = true
                        }
        })
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

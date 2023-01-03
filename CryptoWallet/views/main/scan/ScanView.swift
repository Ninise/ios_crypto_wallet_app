//
//  ScanView.swift
//  CryptoWallet
//
//  Created by Nikita on 03.01.2023.
//

import SwiftUI

struct ScanView: View {
    
    @State var address: String = ""
    
    var body: some View {
        ZStack (alignment: .top) {
            RadialGradient(gradient: Gradient(colors: [Color(hex: "#7A17D7"), Color(hex: "#ED74CD"), Color(hex: "#EBB5A3") ]), center: .topTrailing, startRadius: 100, endRadius: 800)
                .frame(maxHeight: .infinity)
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                
                VStack {
                    Image(systemName: "qrcode.viewfinder")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 200)
                }
                .frame(height: 400)
                
                
                
                VStack (alignment: .leading) {
                    Text("Scan Barcode")
                        .font(.custom(FontUtils.MAIN_BOLD, size: 26))
                        .foregroundColor(.black)
                    
                    Text("Or Input Wallet Address")
                        .font(.custom(FontUtils.MAIN_REGULAR, size: 16))
                        .foregroundColor(.gray)
                    
                    
                    TextField("Input Wallet address", text: $address)
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .padding(5)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .cornerRadius(30)
                        .padding(.top, 10)
                    
                    
                    Button {  } label: {
                        Text("Confirmation")
                            .font(.custom(FontUtils.MAIN_REGULAR, size: 18))
                            .foregroundColor(.white)
                            .padding(10)
                        
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .padding(5)
                    .background(Color.black)
                    .cornerRadius(30)
                    .padding(.top, 50)
                    
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal, 30)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                
                
            }
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}

//
//  FaceIdFingerScanView.swift
//  CryptoWallet
//
//  Created by Nikita on 26.12.2022.
//

import SwiftUI
import Toast

struct FaceIdFingerScanView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var animate = true
    
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                VStack {
                    
                    Text("FaceID scan")
                        .font(.custom(FontUtils.MAIN_BOLD, size: 28))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Please let the app do the Face id scan for login authentication")
                        .font(.custom(FontUtils.MAIN_REGULAR, size: 14))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, -10)
                }
                
                Spacer()
                
                Circle()
                    .foregroundColor(Color(hex: "#F1F1F2"))
                    .overlay {
                        Image("face-scan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    }
                    .frame(width: 180, height: 180)
                    .onAppear { self.animate = true }
                    .animation(animate ? Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true) : .default, value: animate)
                    .onChange(of: 1) { _ in
                           self.animate = false
                           DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                               self.animate = true
                           }
                    }
                    .onTapGesture {
                        let authManager = AuthManager()
                        authManager.canEvaluate { (canEvaluate, _, canEvaluateError) in
                            guard canEvaluate else {
                                let toast = Toast.text("FaceID is not available")
                                toast.show()
                                return
                            }
                            
                            authManager.evaluate { [self] (success, error) in
                                guard success else {
                                    let toast = Toast.text("FaceID is not available")
                                    toast.show()
                                    return
                                }
                                
                                let toast = Toast.text("You are good to RECT")
                                toast.show()

                            }
                        }
                    }
                    
                
                Spacer()
                
                Text("By let FaceID, you agree to our \(Text("Terms").foregroundColor(.black)) and \(Text("Conditions").foregroundColor(.black))")
                    .font(.custom(FontUtils.MAIN_MEDIUM, size: 14))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, -10)
            }
            .padding(20)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
                Image(systemName: "arrow.backward")
                    .foregroundColor(.gray)
                    .font(.system(size: 25))
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
        }
    }
}

struct FaceIdFingerScanView_Previews: PreviewProvider {
    static var previews: some View {
        FaceIdFingerScanView()
    }
}

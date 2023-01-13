//
//  ProfileView.swift
//  CryptoWallet
//
//  Created by Nikita on 13.01.2023.
//

import SwiftUI

struct ProfileView: View {
    
    private let url = "https://pyxis.nymag.com/v1/imgs/654/1f1/08de774c11d89cb3f4ecf600a33e9c8283-24-keanu-reeves.rsquare.w700.jpg"
    
    
    var body: some View {
        ZStack (alignment: .top) {
           
            
            VStack (alignment: .center) {
                
                HStack (alignment: .top) {
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .foregroundColor(.black)
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    })
                    .frame(width: 45, height: 45)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(radius: 5)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        AsyncImage(url: URL(string: url)) { image in image.resizable()
                            
                        } placeholder: { Color.gray }
                            .frame(width: 80, height: 80)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                    })
                    .frame(width: 75, height: 75)
                    .background(.white)
                    .cornerRadius(50)
                    .shadow(radius: 5)
                    
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
                .padding(30)
                
                Button(action: {}, label: {
                    HStack {
                        Text("0x2D3b3A14c7ff8156dF61c85b77392291c0747e87")
                            .font(.custom(FontUtils.MAIN_BOLD, size: 18))
                            .truncationMode(.middle)
                            .foregroundColor(.white)
                            .frame(maxWidth: 90)
                            .lineLimit(1)
                        Image(systemName: "doc.on.doc")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 18, height: 18)
                    }
                })
                
                Text("Nikita Nikitin")
                    .font(.custom(FontUtils.MAIN_MEDIUM, size: 16))
                    .truncationMode(.middle)
                    .foregroundColor(.white)

                
                VStack {
                    HStack (alignment: .center) {
                        VStack (alignment: .leading) {
                            Text("Your Balance")
                                .font(.custom(FontUtils.MAIN_MEDIUM, size: 16))
                                .foregroundColor(.gray)
                                .padding(.bottom, 5)
                                
                            Text("$63,120.80")
                                .font(.custom(FontUtils.MAIN_BOLD, size: 24)).foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            HStack {
                                VStack (alignment: .leading) {
                                    
                                    HStack (alignment: .center) {
                                        Image(systemName: true ? "chevron.up" : "chevron.down")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 12)
                                            .foregroundColor(.white)
                                            .font(Font.title.weight(.bold))
                                        
                                        Text("2.5%")
                                            .font(.custom(FontUtils.MAIN_REGULAR, size: 14))
                                            .foregroundColor(.white)
                                        
                                    }
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 12)
                                    .background(.green)
                                    .cornerRadius(30, corners: .allCorners)
                                    
                                }
                                
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12)
                                    .foregroundColor(.gray)
                                    .font(Font.title.weight(.regular))
                                
                            }
                        })
                        
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                    
                    HStack {
                        Button(action: {}, label: {
                           VStack (alignment: .center) {
                               
                               Image(systemName: "paperplane")
                                   .resizable()
                                   .scaledToFit()
                                   .foregroundColor(.green)
                                   .frame(width: 24, height: 24)
                                   .padding(.bottom, 10)
                               
                               Text("Send")
                                   .font(.custom(FontUtils.MAIN_REGULAR, size: 14))
                                   .foregroundColor(.black)
                                   
                           }
                       })
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            VStack (alignment: .center) {
                                
                                Image(systemName: "square.and.arrow.down")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.blue)
                                    .frame(width: 24, height: 24)
                                    .padding(.bottom, 10)
                                
                                Text("Receive")
                                    .font(.custom(FontUtils.MAIN_REGULAR, size: 14))
                                    .foregroundColor(.black)
                                    
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            VStack (alignment: .center) {
                                
                                Image(systemName: "cart")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.red)
                                    .frame(width: 24, height: 24)
                                    .padding(.bottom, 10)
                                
                                Text("Buy")
                                    .font(.custom(FontUtils.MAIN_REGULAR, size: 14))
                                    .foregroundColor(.black)
                                    
                            }
                        })
                    }
                    .padding(.horizontal, 60)
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(30, corners: .allCorners)
                .padding(20)
                
            }
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

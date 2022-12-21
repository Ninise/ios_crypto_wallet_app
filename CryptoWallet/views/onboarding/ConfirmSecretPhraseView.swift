//
//  ConfirmSecretPhraseView.swift
//  CryptoWallet
//
//  Created by Nikita on 21.12.2022.
//

import SwiftUI

struct ConfirmSecretPhraseView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var words: [String]?

    var body: some View {
        NavigationView {
            ZStack (alignment: .leading) {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                
                LoadingView()
                    .task {
                        do {
                            words = try await WordGeneratorManager.getSecretWords()
                            
                        } catch {
                            print("Error getting weather")
                        }
                    }
                
                VStack {
                    ScrollView {
                        VStack {
                            TitleTopView()
                            ConfirmedListView(words: words)
                            WordsToConfirmView(words: words)
                        
                        }
                        .padding(20)
                    }
                    .padding(10)
                    
                    
                    BottomView()
                }
            }
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

struct ConfirmSecretPhraseView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmSecretPhraseView()
    }
}

struct ConfirmedListView: View {
    
    private var gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(words: [String]?) {
        self.words = words
    }
    
    private var words: [String]?
     
    var body: some View {
        VStack {
            if let words = words {
                ScrollView (.vertical, showsIndicators: false) {
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(0..<words.count) { index in
                            
                            ZStack {
                                Text("\(index + 1). \(words[index])")
                                    .font(.custom(FontUtils.MAIN_BOLD, size: 16))
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .lineLimit(1)
                                
                                
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            
                            
                        }.padding(3)
                    }
                    .padding()
                    
                }
                .padding(.top, 10)
            }
        }
    }
}

struct TitleTopView: View {
    var body: some View {
        VStack {
            Text("Confirm Secret Recovery Words")
                .font(.custom(FontUtils.MAIN_BOLD, size: 28))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Select the words in order it was presented on previous screen.")
                .font(.custom(FontUtils.MAIN_REGULAR, size: 14))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, -10)
        }
    }
}

struct BottomView: View {
    var body: some View {
        VStack {
            VStack{
                Color.gray.frame(height: 10 / UIScreen.main.scale)
                    .gradientForeground([Color(hex: "#7A17D7"), Color(hex: "#ED74CD"), Color(hex: "#EBB5A3") ])
            }
            .padding(.top, -20)
            
            Button {} label: {
                Text("Confirmation")
                    .font(.custom(FontUtils.MAIN_REGULAR, size: 18))
                    .foregroundColor(.white)
                    .padding(10)
                
            }
            .frame(maxWidth: .infinity, minHeight: 60)
            
            .background(Color.black)
            .cornerRadius(30)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
    }
}

struct WordsToConfirmView: View {
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }
    
    init(words: [String]?) {
        self.words = words
    }
    
    private var words: [String]?
     
    
    private func generateContent(in g: GeometryProxy) -> some View {
            var width = CGFloat.zero
            var height = CGFloat.zero

            return ZStack(alignment: .topLeading) {
                if words != nil {
                    ForEach(self.words!, id: \.self) { platform in
                        self.item(for: platform)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .alignmentGuide(.leading, computeValue: { d in
                                if (abs(width - d.width) > g.size.width)
                                {
                                    width = 0
                                    height -= d.height
                                }
                                let result = width
                                if platform == self.words!.last! {
                                    width = 0 //last item
                                } else {
                                    width -= d.width
                                }
                                return result
                            })
                            .alignmentGuide(.top, computeValue: {d in
                                let result = height
                                if platform == self.words!.last! {
                                    height = 0 // last item
                                }
                                return result
                            })
                    }
                }
                
            }
        }

        func item(for text: String) -> some View {
            Text(text)
                .padding(.all, 13)
                .font(.custom(FontUtils.MAIN_BOLD, size: 15))
                .background(Color.white)
                .foregroundColor(Color.black)
                .cornerRadius(30)
                .shadow(color: .gray, radius: 5, x: 2, y: 2)
        }
}

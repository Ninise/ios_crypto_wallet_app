//
//  ConfirmSecretPhraseView.swift
//  CryptoWallet
//
//  Created by Nikita on 21.12.2022.
//

import SwiftUI

struct ConfirmSecretPhraseView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var words: [SecretWord] = []
    @State var confirmedWords: [String] = []
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .leading) {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView {
                        VStack {
                            TitleTopView()
                            ConfirmedListView(words: $confirmedWords, onUnConfirmWord: { word in
                                print("UNCONFIRM \(word)")
                                words = words.map { wo in
                                    if (wo.text == word) {
                                        wo.isSelected = false
                                    }
                                    return wo
                                }
                            })
                            WordsToConfirmView(words: $words, onSelect: { word in
                               
                                confirmedWords.append(word.text)
                            })
                            
                            VStack {}
                                .frame(height: 300)
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
        ConfirmSecretPhraseView(words: [])
    }
}

struct ConfirmedListView: View {
    
    var gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @Binding var words: [String]
    
    let onUnConfirmWord: (String) -> Void
    
    var body: some View {
        VStack {
            
            ScrollView (.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(0..<12, id: \.self) { index in
                        WordView(index: index, selected: index < words.count, text: index < words.count ? words[index] : "", onWordClick: { text in
                            words = words.filter { $0 != text }
                            onUnConfirmWord(text)
                        })
                        .padding(3)
                        
                    }
                }
                .padding()
                
            }
            .padding(.top, 10)
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
    
    @Binding var words: [SecretWord]
    
    let onSelect: (SecretWord) -> ()
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }
    
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.words, id: \.id) { word in
                self.item(word)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if word.text == self.words.last?.text {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if word.text == self.words.last?.text {
                            height = 0 // last item
                        }
                        return result
                    })
            }
            
            
        }
    }
    
    private func item(_ word: SecretWord) -> some View {
        Text(word.text)
            .padding(.all, 13)
            .font(.custom(FontUtils.MAIN_BOLD, size: 15))
            .background(word.isSelected ? Color(hex: "#F1F1F2") : Color.white)
            .foregroundColor(word.isSelected ? Color(hex: "#D3D4D7") : Color.black)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 5, x: 2, y: 2)
            .onTapGesture(count: 1, perform: {
                if (!word.isSelected) {
                    words = words.map { wo in
                        if (wo.text == word.text) {
                            wo.isSelected = true
                        }
                        return wo
                    }
                    word.isSelected = true
                    onSelect(word)
                }
                
            })
    }
}

struct WordView: View {
    
    var index: Int
    var selected: Bool
    var text: String
    
    let onWordClick: (String) -> Void
    
    var body: some View {
        
        if selected {
            ZStack {
                Text("\(index + 1). \(text)")
                    .font(.custom(FontUtils.MAIN_BOLD, size: 16))
                    .padding(10)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
            )
            .onTapGesture {
                onWordClick(text)
            }
        } else {
            ZStack {
                Text("\(index + 1).                 ")
                    .font(.custom(FontUtils.MAIN_BOLD, size: 16))
                    .padding(10)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray, lineWidth: 1)
            )
        }
    }
}

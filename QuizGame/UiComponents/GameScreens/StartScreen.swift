//
//  StartScreen.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 16/12/2023.
//

import SwiftUI

struct StartScreen: View {
    @ObservedObject var gameManagerViewModel: GameManagerViewModel
    @State private var profileIndex = 1
    @State private var userNameEmpty = false
    
    var body: some View {
        VStack {
            ReusableText(text: "Test wiedzy o Swift",size: 30)
            Spacer()
            
            Image(gameManagerViewModel.profile.profileImage)
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            withAnimation{
                                if value.translation.width < 0 {
                                    if profileIndex > 1 {
                                        profileIndex -= 1
                                    }
                                } else {
                                    if profileIndex < 4 {
                                        profileIndex += 1
                                        
                                    }
                                }
                                gameManagerViewModel.updateProfileImage(profileImage: "profile\(profileIndex)")
                            }
                            
                        }
                )
            VStack {
                TextField("Wprowadź nazwę użytkownika", text: Binding(
                    get: { gameManagerViewModel.profile.userName },
                    set: { newValue in
                        gameManagerViewModel.updateUserName(name: newValue)
                        if(newValue.replacingOccurrences(of: " ", with: "").isEmpty){
                            userNameEmpty = true
                        }else{
                            userNameEmpty = false
                        }
                    }
                ))
                .frame(width: 0.8 * UIScreen.main.bounds.width)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(15)
                .padding()
                
                ReusableText(text: "Podaj nazwę użytkownika", size: 20).opacity(userNameEmpty ? 1: 0)
            }
            
            Spacer()
            
            Button {
                gameManagerViewModel.startGame()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("Rozpocznij grę")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(.purple.opacity(0.7))
                .cornerRadius(30)
                .padding()
                .disabled(userNameEmpty)
                .opacity(userNameEmpty ? 0.5 : 1.0)
        }
    }
}

#Preview {
    StartScreen(gameManagerViewModel: GameManagerViewModel())
}

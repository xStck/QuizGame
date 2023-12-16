//
//  ContentView.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var gameManagerViewModel: GameManagerViewModel
    
    var body: some View {
        VStack {
            ZStack {
                
                Utils().backgroundImage
                Utils().gradient
                
                if gameManagerViewModel.gameStatus == .start{
                    StartScreen(gameManagerViewModel: gameManagerViewModel)
                }else if gameManagerViewModel.gameStatus == .end{
                    EndScreen(gameManagerViewModel: gameManagerViewModel)
                }else{
                    GameScreen(gameManagerViewModel: gameManagerViewModel)
                }
                
            }
        }
    }
}

#Preview {
    ContentView(gameManagerViewModel: GameManagerViewModel())
}

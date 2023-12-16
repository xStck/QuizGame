//
//  GameScren.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 16/12/2023.
//

import SwiftUI

struct GameScreen: View {
    @ObservedObject var gameManagerViewModel: GameManagerViewModel
    var body: some View {
        VStack{
            ReusableText(text: "Test wiedzy o SwiftUi",size: 30)
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.size.width - 20,
                       height: 150,
                       alignment: .center)
                .overlay(
                    ReusableText(text: gameManagerViewModel.model.quizQuestion.question, size: 25)
                        .multilineTextAlignment(.center)
                )
            Spacer()
            CircleTimer(gameManagerViewModel: gameManagerViewModel)
            Spacer()
            OptionsGridView(gameManagerViewModel: gameManagerViewModel)
        }
    }
}

#Preview {
    GameScreen(gameManagerViewModel: GameManagerViewModel())
}

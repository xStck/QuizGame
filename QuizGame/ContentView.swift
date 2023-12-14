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
                if gameManagerViewModel.model.quizCompleted{
                    QuizCompletedView(gameManagerViewModel: gameManagerViewModel)
                }else{
                    VStack{
                        ReusableText(text: "Test wiedzy o SwiftUi",size: 30)
                        ReusableText(text: gameManagerViewModel.model.quizQuestion.question,size: 25)
                            .frame(width: UIScreen.main.bounds.size.width - 20,
                                   height: 150,
                                   alignment: .center)
                            .multilineTextAlignment(.center)
                        CircleTimer(gameManagerViewModel: gameManagerViewModel)
                        Spacer()
                        OptionsGridView(gameManagerViewModel: gameManagerViewModel)
                    }
                }
            }
        }
    }
    
}

#Preview {
    ContentView(gameManagerViewModel: GameManagerViewModel())
}

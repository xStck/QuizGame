//
//  QuizCompletedView.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI

struct QuizCompletedView: View {
    var gameManagerViewModel: GameManagerViewModel
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(Color.yellow)
                .font(.system(size: 60))
                .padding()
            
            ReusableText(text: gameManagerViewModel.model.quizWinningStatus ? "Zdano quiz" : "Nie zdano quizu", size: 30)
                .padding()
            
            ReusableText(text: "Uzyskany wynik: \(round((Double(gameManagerViewModel.model.score)/Double(gameManagerViewModel.model.amountOfQuestions) * 100)))%", size: 30)
            .padding()
            
            Button {
                gameManagerViewModel.restartGame()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("Zagraj ponownie")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(.purple.opacity(0.7))
                .cornerRadius(30)
                .padding()
            
        }
    }
}

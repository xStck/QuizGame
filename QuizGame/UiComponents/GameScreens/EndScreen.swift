//
//  QuizCompletedView.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI

struct EndScreen: View {
    @ObservedObject var gameManagerViewModel: GameManagerViewModel
    var body: some View {
        VStack {
            ReusableText(text: gameManagerViewModel.model.quizWinningStatus ? "Zdano quiz" : "Nie zdano quizu", size: 30)
                .padding()
            
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.size.width - 20,
                       height: 50,
                       alignment: .center)
                .overlay(
                    ReusableText(text: "Uzyskany wynik: \(round((Double(gameManagerViewModel.model.score)/Double(gameManagerViewModel.model.amountOfQuestions) * 100)))%", size: 30)
                )
            
            Divider()
            
            ScoreTableView(gameManagerViewModel: gameManagerViewModel);
            
            Divider()
            
            
            Button {
                gameManagerViewModel.restartGame()
            } label: {
                
                Text("Zagraj ponownie")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                
            }.frame(width: 300, height: 60, alignment: .center)
                .background(.purple.opacity(0.7))
                .cornerRadius(30)
                .padding()
            
        }
    }
}

#Preview {
    EndScreen(gameManagerViewModel: GameManagerViewModel())
}

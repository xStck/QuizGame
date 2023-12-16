//
//  OptionsGridView.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI


struct OptionsGridView: View {
    @ObservedObject var gameManagerViewModel: GameManagerViewModel
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(170)), count: 1)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(gameManagerViewModel.model.quizQuestion.optionsList){quizOption in
                OptionCardView(quizOption: quizOption)
                    .overlay(FlyingNumber(number: scoreChange(optionId: quizOption.id)))
                    .zIndex(scoreChange(optionId: quizOption.id) != 0 ? 100 : 0)
                    .onTapGesture
                {
                    if(!quizOption.hasBeenSeen){
                        let scoreBeforeChoosing = gameManagerViewModel.score
                        gameManagerViewModel.verifyAnswer(selectedOption: quizOption)
                        let scoreChange = gameManagerViewModel.score - scoreBeforeChoosing
                        lastScoreChange = (scoreChange, quizOption.id)
                    }
                    
                }
            }
        }
    }
    
    
    @State private var lastScoreChange = (0, 0)
    
    private func scoreChange(optionId: QuizOption.ID) -> Int{
        let (amount, id) = lastScoreChange
        return optionId == id ? amount : 0
    }
    
    
    
}

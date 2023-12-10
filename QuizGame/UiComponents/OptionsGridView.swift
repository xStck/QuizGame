//
//  OptionsGridView.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI


struct OptionsGridView: View {
    var gameManagerViewModel: GameManagerViewModel
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170)), count: 2)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(gameManagerViewModel.model.quizModel.optionsList){quizOption in
                OptionCardView(quizOption: quizOption)
                    .onTapGesture {
                        gameManagerViewModel.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }
    }

}

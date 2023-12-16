//
//  ScoreTableView.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 16/12/2023.
//

import SwiftUI

struct ScoreTableView: View {
    @ObservedObject var gameManagerViewModel: GameManagerViewModel
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(170)), count: 1)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(gameManagerViewModel.scoresArray){score in
                    ScoreView(score: score)
                }
            }.padding()
        }
    }
}

#Preview {
    ScoreTableView(gameManagerViewModel: GameManagerViewModel())
}

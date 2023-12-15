//
//  GameManagerViewModel.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI

class GameManagerViewModel: ObservableObject{
    static var currentIndex = 0
    var timer = Timer()
    var maxProgress = 5
    
    @Published var progress = 0
    @Published var model = GameManagerViewModel.createGameModel()
    
    static var quizQuestions: [QuizQuestion] = Utils.quizQuestionsDb.shuffled()
    
    static func createGameModel() -> QuizModel {
        return QuizModel()
    }
    
    init(){
        self.start()
    }
    
    func verifyAnswer(selectedOption: QuizOption){
        let result = model.verifyAnswer(selectedOption: selectedOption)
        
        switch result {
            
        case .correctAnswer:
            self.start()
            break
            
        case .badAnswer:
            break
            
        case .quizWon:
            self.resetTimer()
            break
        }
    }
    
    func restartGame(){
        model.restartGame()
        model = GameManagerViewModel.createGameModel()
        self.start()
    }
    
    func score() -> Int{
        return model.score
    }
    
    func start() {
        self.resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizLost()
                self.resetTimer()
            } else {
                self.progress += 1
            }
        })
    }
    
    func resetTimer () {
        timer.invalidate()
        self.progress = 0
    }
}

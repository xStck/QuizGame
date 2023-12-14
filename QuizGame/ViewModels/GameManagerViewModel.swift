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
    @Published var model = GameManagerViewModel.createGameModel(i: GameManagerViewModel.currentIndex)
    
    static var quizQuestions: [QuizQuestion] = Utils.quizQuestionsDb.shuffled()
    
    static func createGameModel(i: Int) -> QuizModel {
        return QuizModel(quizQuestion: quizQuestions[i])
    }
    
    init(){
        GameManagerViewModel.quizQuestions = GameManagerViewModel.quizQuestions.shuffled()
        self.start()
    }
    
    func verifyAnswer(selectedOption: QuizOption){
        let correctAnswer = model.verifyAnswer(selectedOption: selectedOption)
        if correctAnswer {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                if GameManagerViewModel.currentIndex < 4{
                    GameManagerViewModel.currentIndex = GameManagerViewModel.currentIndex+1
                    self.model = GameManagerViewModel.createGameModel(i: GameManagerViewModel.currentIndex)
                    self.start()

                }else{
                    self.model.winQuiz()
                    self.resetTimer()
                }
            }
        }
    }
    
    func restartGame(){
        GameManagerViewModel.quizQuestions = Utils.quizQuestionsDb.shuffled()
        GameManagerViewModel.currentIndex = 0
        model = GameManagerViewModel.createGameModel(i: GameManagerViewModel.currentIndex)
        self.start()
    }
    
    func start() {
        self.resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.loseQuiz()
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

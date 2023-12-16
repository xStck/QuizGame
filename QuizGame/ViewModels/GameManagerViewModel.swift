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
    @Published var timerStopped = false
    
    static var quizQuestions: [QuizQuestion] = Utils.quizQuestionsDb.shuffled()
    
    static func createGameModel() -> QuizModel {
        return QuizModel()
    }
    
    init(){
        self.startTimer()
    }
    
    func verifyAnswer(selectedOption: QuizOption){
        let result = model.verifyAnswer(selectedOption: selectedOption)
        
        switch result {
            
        case .correctAnswer:
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.model.nextQuestion()
                self.startTimer()
            }
            break
            
        case .badAnswer:
            self.disableTimer()
            break
            
        case .quizFinished:
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.model.quizFinished()
            }
            self.resetTimer()
            break
        }
    }
    
    func restartGame(){
        model.restartGame()
        model = GameManagerViewModel.createGameModel()
        self.startTimer()
    }
    
    var score: Int{
        model.score
    }
    
    var amountOfQuestions: Int {
        model.amountOfQuestions
    }
    
    func startTimer() {
        self.resetTimer()
        if(self.timerStopped){
            self.timerStopped = false
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.questionAnswered()
                self.disableTimer()
            } else {
                self.progress += 1
            }
        })
    }
    
    func resetTimer () {
        timer.invalidate()
        self.progress = 0
    }
    
    func disableTimer(){
        timer.invalidate()
        self.timerStopped = true
    }
}

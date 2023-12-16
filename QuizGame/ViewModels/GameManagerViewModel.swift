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
    
    @Published var progress: Int
    @Published var model = GameManagerViewModel.createGameModel()
    @Published var timerStopped = false
    @Published var gameStatus: GameScreen
    @Published var profile: Profile
    
    var scoresArray: [Score]
        
    static func createGameModel() -> QuizModel {
        return QuizModel()
    }
    
    init(){
        self.progress = 0
        self.gameStatus = GameScreen.start;
        self.profile = Profile(userName: "Użytkownik 1", profileImage: "profile1")
        scoresArray = []
    }
    
    func startGame(){
        self.gameStatus = GameScreen.playing
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
                self.resetTimer()
                self.gameStatus = GameScreen.end
            }
            self.saveScore()
            break
        }
    }
    
    func saveScore(){
        scoresArray.append(Score(id: UUID(), score: "\(round(Double(self.score) / Double(self.amountOfQuestions) * 100))%", profile: self.profile))
    }
    
    
    func restartGame(){
        model.restartGame()
        model = GameManagerViewModel.createGameModel()
        gameStatus = .start
        self.profile = Profile(userName: "Użytkownik 1", profileImage: "profile1")
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
                self.model.decrementScore()
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
    
    func updateUserName(name: String) {
        self.profile.userName = name
    }
    
    
    func updateProfileImage(profileImage: String){
        self.profile.profileImage = profileImage
    }
    
    enum GameScreen {
        case start
        case playing
        case end
    }
}

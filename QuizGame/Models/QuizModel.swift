//
//  Quiz.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI


struct QuizModel {
    private var currentIndex: Int
    private var quizQuestions: [QuizQuestion]
    private(set) var score: Int
    private(set) var quizQuestion: QuizQuestion
    private(set) var quizCompleted: Bool  {
        didSet {
            if((Double(self.score) / Double(self.amountOfQuestions) * 100) > 51){
                quizWinningStatus = true
            }
        }
    }
    private(set) var quizWinningStatus: Bool
    private(set) var amountOfQuestions = 5
    
    init(){
        self.score = 0
        self.currentIndex = 0
        self.quizQuestions = Array(Utils.quizQuestionsDb.shuffled().prefix(amountOfQuestions))
        self.quizQuestion = quizQuestions[currentIndex]
        self.quizCompleted = false
        self.quizWinningStatus = false
    }
    
    mutating func verifyAnswer(selectedOption: QuizOption) -> QuizResult{
        if let index = quizQuestion.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}){
            if selectedOption.optionId == quizQuestion.answer {
                self.quizQuestion.optionsList[index].isMatched = true
                self.quizQuestion.optionsList[index].isSelected = true
                if(!self.quizQuestion.answered){
                    self.incrementScore()
                    self.quizQuestion.answered = true
                }
                if self.currentIndex < amountOfQuestions - 1{
                    return .correctAnswer
                }
                return .quizFinished
                
            }
            if(!self.quizQuestion.answered){
                self.decrementScore()
                self.quizQuestion.answered = true
            }
            self.quizQuestion.optionsList[index].isMatched = false
            self.quizQuestion.optionsList[index].isSelected = true
            return .badAnswer
        }
        return .badAnswer
    }
    
    mutating func decrementScore(){
        if(self.score > 0){
            self.score -= 1
        }
    }
    
    mutating func incrementScore(){
        self.score += 1
    }
    
    mutating func nextQuestion(){
        self.currentIndex += 1
        quizQuestion = self.quizQuestions[currentIndex]
    }
    
    mutating func quizFinished(){
        self.quizCompleted = true
    }
    
    mutating func restartGame(){
        self.quizQuestions = Array(Utils.quizQuestionsDb.shuffled().prefix(amountOfQuestions))
        self.currentIndex = 0
    }
    
    mutating func questionAnswered(){
        self.quizQuestion.answered = true
    }
    
    enum QuizResult {
        case correctAnswer
        case badAnswer
        case quizFinished
    }
}




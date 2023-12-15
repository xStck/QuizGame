//
//  Quiz.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI


struct QuizModel {
    private(set) var score: Int
    private var quizQuestions: [QuizQuestion]
    private(set) var quizQuestion: QuizQuestion
    private(set) var quizCompleted: Bool = false
    private(set) var quizWinningStatus: Bool = false
    private(set) var currentIndex: Int
    private var amountOfQuestions = 5
    
    init(){
        self.score = 0
        self.currentIndex = 0
        self.quizQuestions = Array(Utils.quizQuestionsDb.shuffled().prefix(5))
        self.quizQuestion = quizQuestions[currentIndex]
        self.amountOfQuestions -= 1
    }
    
    mutating func verifyAnswer(selectedOption: QuizOption) -> QuizResult{
        for index in self.quizQuestion.optionsList.indices{
            self.quizQuestion.optionsList[index].isMatched = false
            self.quizQuestion.optionsList[index].isSelected = false
        }
        
        if let index = quizQuestion.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}){
            if selectedOption.optionId == quizQuestion.answer {
                self.quizQuestion.optionsList[index].isMatched = true
                self.quizQuestion.optionsList[index].isSelected = true
                if self.currentIndex < amountOfQuestions{
                    self.currentIndex += 1
                    quizQuestion = self.quizQuestions[currentIndex]
                    self.score += 1
                    return .correctAnswer
                    
                }else{
                    self.quizWon()
                    return .quizWon
                }
                
            }
            self.score -= 1
            self.quizQuestion.optionsList[index].isMatched = false
            self.quizQuestion.optionsList[index].isSelected = true
            return .badAnswer
        }
        return .quizWon
    }
    
    mutating func quizWon(){
        self.quizCompleted = true
        self.quizWinningStatus = true
    }
    
    mutating func quizLost(){
        self.quizCompleted = true
        self.quizWinningStatus = false
    }
    
    mutating func restartGame(){
        self.quizQuestions = Array(Utils.quizQuestionsDb.shuffled().prefix(5))
        self.currentIndex = 0
    }
    
    enum QuizResult {
        case correctAnswer
        case badAnswer
        case quizWon
    }
}




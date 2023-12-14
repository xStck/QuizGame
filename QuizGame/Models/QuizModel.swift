//
//  Quiz.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI


struct QuizModel {
    private(set) var quizQuestion: QuizQuestion
    private(set) var quizCompleted: Bool = false
    private(set) var quizWinningStatus: Bool = false

    init(quizQuestion: QuizQuestion){
        self.quizQuestion = quizQuestion
    }
    
    mutating func verifyAnswer(selectedOption: QuizOption) -> Bool{
        for index in self.quizQuestion.optionsList.indices{
            self.quizQuestion.optionsList[index].isMatched = false
            self.quizQuestion.optionsList[index].isSelected = false
        }
        
        if let index = quizQuestion.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}){
            if selectedOption.optionId == quizQuestion.answer {
                self.quizQuestion.optionsList[index].isMatched = true
                self.quizQuestion.optionsList[index].isSelected = true
                return true;
            }else{
                self.quizQuestion.optionsList[index].isMatched = false
                self.quizQuestion.optionsList[index].isSelected = true
            }
        }
        return false;
    }
    
    mutating func winQuiz(){
        self.quizCompleted = true
        self.quizWinningStatus = true
    }
    
    mutating func loseQuiz(){
        self.quizCompleted = true
        self.quizWinningStatus = false
    }
}




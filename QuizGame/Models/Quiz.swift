//
//  Quiz.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI


struct Quiz {
    var currentQuestionIndex: Int
    var quizQuestion: QuizQuestion
    var quizCompleted: Bool = false
    var quizWinningStatus: Bool = false
}




//
//  QuizModel.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 14/12/2023.
//

import Foundation
import SwiftUI

struct QuizQuestion{
    var question: String
    var answer: String
    var optionsList: [QuizOption]
    var answered: Bool = false
}

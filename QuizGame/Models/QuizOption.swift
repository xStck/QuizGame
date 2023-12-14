//
//  QuizOption.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 14/12/2023.
//

import Foundation
import SwiftUI
 
struct QuizOption : Identifiable {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected: Bool = false
    var isMatched: Bool = false
}

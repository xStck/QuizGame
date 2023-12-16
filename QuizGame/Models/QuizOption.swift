//
//  QuizOption.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 14/12/2023.
//

import Foundation
import SwiftUI

struct QuizOption : Identifiable, Equatable {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected: Bool = false {
        didSet {
            hasBeenSeen = true
        }
    }
    var isMatched: Bool = false
    var hasBeenSeen = false
}

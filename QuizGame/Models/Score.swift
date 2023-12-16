//
//  Score.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 16/12/2023.
//

import Foundation

struct Score: Identifiable{
    var id: UUID
    var score: String
    var profile: Profile
}

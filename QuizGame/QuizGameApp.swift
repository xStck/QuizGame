//
//  QuizGameApp.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import SwiftUI

@main
struct QuizGameApp: App {
    @StateObject var game = GameManagerViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(gameManagerViewModel: game)
        }
    }
}

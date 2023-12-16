//
//  ScoreView.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 16/12/2023.
//

import SwiftUI

struct ScoreView: View {
    let score: Score
    var body: some View {
        HStack{
            Image(score.profile.profileImage).resizable()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                ReusableText(text: "\(score.profile.userName)", size: 20).lineLimit(1)
            }
            
            Spacer()
            
            ReusableText(text: "\(score.score)", size: 20)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(width: 0.9 * UIScreen.main.bounds.width)
        
        Spacer()
    }
}

#Preview {
    ScoreView(score: Score(id: UUID(), score: "22%", profile: Profile(userName: "Wojtek", profileImage: "profile1")))
}


//
//  CircleTimer.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 14/12/2023.
//

import SwiftUI

struct CircleTimer: View {
    @ObservedObject var gameManagerViewModel: GameManagerViewModel
    @State private var animationID: UUID = UUID()
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 15)
                .foregroundColor(.gray)
                .opacity(0.3)
            if(!gameManagerViewModel.timerStopped){
                Circle()
                    .trim(from: 0.0, to: min((CGFloat(gameManagerViewModel.progress)/CGFloat(gameManagerViewModel.maxProgress))*100,1.0))
                    .stroke(LinearGradient(colors:[.orange, .red],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing),
                            style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270))
                    .animation(Animation.linear(duration: Double(gameManagerViewModel.maxProgress))
                        .speed(gameManagerViewModel.timerStopped ? 0 : 1), value: gameManagerViewModel.progress)
                    .id(animationID)
            }else{
                Circle()
                    .trim(from: 0.0, to: (CGFloat(gameManagerViewModel.progress)/CGFloat(gameManagerViewModel.maxProgress)))
                    .stroke(LinearGradient(colors: [.gray] ,
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing),
                            style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270))
            }
                
            VStack{
                ReusableText(text: String(gameManagerViewModel.progress), size: 40)
                ReusableText(text: "Punkty: "+String(gameManagerViewModel.score), size: 25)
            }
        }.frame(width: 170, height: 170)
            .onChange(of: gameManagerViewModel.progress) {
                if gameManagerViewModel.progress == 0 {
                    animationID = UUID()
                }
            }
    }
}


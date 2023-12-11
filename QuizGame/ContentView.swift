//
//  ContentView.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameManagerViewModel: GameManagerViewModel
    var body: some View {
        VStack {
            ZStack {
                backgroundImage
                gradient
                if gameManagerViewModel.model.quizCompleted{
                    QuizCompletedView(gameManagerViewModel: gameManagerViewModel)
                }else{
                    VStack{
                        ReusableText(text: "Test wiedzy o SwiftUi",size: 30)
                            .padding()
                        
                        ReusableText(text: gameManagerViewModel.model.quizModel.question,size: 25)
                            .lineLimit(10)
                            .frame(width: UIScreen.main.bounds.size.width - 20,
                                   height: 60,
                                   alignment: .center)
                            .multilineTextAlignment(.center)
                        Spacer()
                        circleTimer
                        Spacer()
                        OptionsGridView(gameManagerViewModel: gameManagerViewModel)
                    }
                }
            }
        }
    }
    
    private var backgroundImage: some View{
        Image("bg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    
    private var gradient: some View{
        LinearGradient(colors: [.purple.opacity(0.4),
                                .blue.opacity(0.4),
                                .red.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomLeading).ignoresSafeArea()
    }
    
    private var circleTimer: some View{
        ZStack {
            Circle()
                .stroke(lineWidth: 15)
                .foregroundColor(.gray)
                .opacity(0.3)
            
            Circle()
                .trim(from: 0.0, to: min((CGFloat(gameManagerViewModel.progress)/CGFloat(gameManagerViewModel.maxProgress))*100,1.0))
                .stroke(LinearGradient(colors: [.orange, .red],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(Animation.linear(duration: Double(gameManagerViewModel.maxProgress)), value: gameManagerViewModel.progress)
            
            ReusableText(text: String(gameManagerViewModel.progress), size: 30)
        }.frame(width: 150, height: 150)
    }
}

#Preview {
    ContentView(gameManagerViewModel: GameManagerViewModel())
}

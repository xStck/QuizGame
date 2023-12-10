//
//  OptionCardView.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI

struct OptionCardView: View{
    var quizOption: QuizOption
    var body: some View{
        VStack{
            if quizOption.isMatched && quizOption.isSelected{
                OptionStatusImageView(imageName: "checkmark")
            } else if !quizOption.isMatched && quizOption.isSelected {
                OptionStatusImageView(imageName: "xmark")
            } else {
                OptionView(quizOption: quizOption)
            }
        }
        .frame(width: 150, height: 150)
            .background(setBackgroundColor())
            .cornerRadius(40)
    }
    
    func setBackgroundColor() -> Color{
        if quizOption.isMatched && quizOption.isSelected {
            return Color.green
        }else if !quizOption.isMatched && quizOption.isSelected{
            return Color.red
        }else{
            return Color.white
        }
    }
}

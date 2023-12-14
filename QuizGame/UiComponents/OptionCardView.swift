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
            HStack{
                if quizOption.isMatched && quizOption.isSelected{
                    OptionStatusImageView(imageName: "checkmark")
                } else if !quizOption.isMatched && quizOption.isSelected {
                    OptionStatusImageView(imageName: "xmark")
                } else {
                    OptionView(quizOption: quizOption)            }
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height:80)
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

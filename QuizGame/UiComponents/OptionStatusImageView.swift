//
//  OptionStatusImageView.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import Foundation
import SwiftUI

struct OptionStatusImageView: View{
    var imageName: String
    var body: some View{
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
            .foregroundColor(.white)
    }
}

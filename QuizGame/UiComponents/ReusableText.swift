//
//  RusableText.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import SwiftUI

struct ReusableText: View {
    var text: String
    var size: CGFloat
    var body: some View {
        Text(text)
            .font(.system(size: size,
                          weight: .bold,
                          design: .rounded))
            .foregroundColor(.black)
            .shadow(color: .blue,
                    radius: 2, x: 0, y: 3)
    }
}

#Preview {
    ReusableText(text: "Test wiedzy o swiftUI", size: 30)
}

//
//  RusableText.swift
//  QuizGame
//
//  Created by Dawid Nalepa on 10/12/2023.
//

import SwiftUI

struct ReusableText: View {
    let text: String
    let size: CGFloat
    var body: some View {
        Text(text)
            .font(.system(size: size,
                          weight: .bold,
                          design: .rounded))
            .foregroundColor(.black)
            .shadow(color: .gray,
                    radius: 2, x: 0, y: 3)
    }
}

#Preview {
    ReusableText(text: "Test wiedzy o SwiftUI", size: 30)
}

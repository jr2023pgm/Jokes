//
//  FeedbackResponseView.swift
//  Jokes
//
//  Created by jr on 05/07/2023.
//

import SwiftUI

struct FeedbackResponseView: View {
    var body: some View {
        VStack {
            Image("happy")
                .resizable()
                .scaledToFit()
            Text("Thanks, here's a cookie 🍪!")
                .padding()
        }
    }
}

#Preview {
    FeedbackResponseView()
}

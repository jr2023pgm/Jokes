//
//  FeedbackResponseView.swift
//  Jokes
//
//  Created by jr on 05/07/2023.
//

import SwiftUI

struct FeedbackResponseView: View {
    
    var isPositive: Bool
    
    var body: some View {
        VStack {
            Image(isPositive ? "happy" : "sad")
                .resizable()
                .scaledToFit()
            Text(isPositive ? "Thanks, here's a cookie 🍪!" : "Very mean. I will bite you.")
                .padding()
        }
    }
}

struct FeedbackResponseView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackResponseView(isPositive: true)
        FeedbackResponseView(isPositive: false)
    }
}

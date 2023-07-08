//
//  ContentView.swift
//  Xcode
//
//  Created by jr on 03/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showPunchline = false
    @State private var currentJokeIndex = 0
    @State private var isFeedbackPresented = false
    @State private var displaySheet = false
    @State private var isPositive = false
    @State var isShown = true
    @State private var punchlineSize = 0.1
    @State private var punchlineRotation: Angle = .zero
    @Environment(\.dismiss) var dismiss
    
    
    var jokes = [Joke(setup: "Why couldn't the bicycle stand up?", punchline: "It was two tired!"),
                 Joke(setup: "Why did the chicken cross the road?",punchline: "To get to the other side!"),
                 Joke(setup: "Is this pool safe for diving?",punchline: "It deep ends"),
                 Joke(setup: "Did you hear about the cheese factory that exploded in France?",punchline: "There was nothing left but de Brie"),
                 Joke(setup: "Dad, can you put my shoes on?",punchline: "I don’t think they'll fit me")]
    
    var body: some View {
        
        LinearGradient(
            colors: [.red, .green, .blue],
            startPoint: .top,
            endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $isShown) {
                Text("Hello!")
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
        }
        
        ZStack {
            
            Color(.systemBackground)
                .onTapGesture {
                    if showPunchline {
                        currentJokeIndex += 1
                        showPunchline = false
                        isFeedbackPresented = true
                    }
                }
            
            VStack {
                Text(jokes[currentJokeIndex % jokes.count].setup)
                    .padding()
                
                Button {
                    print("Button tapped!!")
                    withAnimation{
                        showPunchline = true
                    }
                } label: {
                    Text("What?")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                    } .padding()
                
                if showPunchline {
                    Text(jokes[currentJokeIndex % jokes.count].punchline)
                        .padding()
                        .opacity(showPunchline ? 1 : 0)
                        .scaleEffect(punchlineSize)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                punchlineSize = 1
                            }
                        }
                        .onDisappear {
                            punchlineSize = 0.1
                        }
                    
                    
                    Text("Tap to continue")
                        .italic()
                        .padding()
                        .opacity(showPunchline ? 1 : 0)
                    
                }
            }
            
        }.alert("Are you sure you want to delete all files?",
                isPresented: $isFeedbackPresented) {
             Button("Delete", role: .destructive) {
                 print("good")
                 isPositive = true
                 displaySheet = true
             }
             Button("Cancel", role: .cancel) {
                 print("you're a terrible person")
                 isPositive = false
                 displaySheet = true
             }
            } message: {
             Text("Here's an alert description but I can't think of one")
            }
        
         .sheet(isPresented: $displaySheet) {
             FeedbackResponseView(isPositive: isPositive)
         }
    }
}

#Preview {
    ContentView()
}

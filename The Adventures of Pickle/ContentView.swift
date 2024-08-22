//
//  ContentView.swift
//  The Adventures of Pickle
//
//  Created by Darien Hallam on 20/8/2024.
//

import SwiftUI


struct ContentView: View {
    @State private var storyText = "Welcome to the Adventures of Pickle the Duck!"
    @State private var userInput = ""
    
    var body: some View {
        VStack {
            Text(storyText)
                .padding()
                .multilineTextAlignment(.center)
            
            TextField("What Should Pickle do?", text: $userInput, onCommit: {
                handleUserInput()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Button("Submit") {
                handleUserInput()
            }
            .padding()
        }
        .padding()
    }
    
    func handleUserInput() {
        let input = userInput.lowercased()
        
        switch input {
        case "quack":
            storyText = "Pickle quacks loudly! Quack!"
        case "swim":
            storyText = "Pickle swims happily in the pond."
        case "explore":
            storyText = "Pickle explores  the nearby forest and finds something interesing."
        default:
            storyText = "pickle doest understand that command."
        }
        
        //Clear the input after handling it
        userInput = ""
        
    }
}
#Preview {
    ContentView()
}

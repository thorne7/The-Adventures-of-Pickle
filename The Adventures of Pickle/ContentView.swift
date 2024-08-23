//
//  ContentView.swift
//  The Adventures of Pickle
//
//  Created by Darien Hallam on 20/8/2024.
//

import SwiftUI


struct ContentView: View {
    @State private var currentLocation = pond
    @State private var storyText = "Welcome to the Adventures of Pickle the Duck!"
    @State private var userInput = ""
    
    var body: some View {
        VStack {
            Text (currentLocation.name)
                .font(.title)
                .padding()
            
            Text(storyText)
                .padding()
                .background(Color.brown.opacity(0.2))
                .cornerRadius(10)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("what would you like to do?")
                .font(.headline)
                .padding(.top)
            
            TextField("What Should Pickle do?", text: $userInput, onCommit: {
                submitInput()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Button("Submit") {
                submitInput()
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
    
    func submitInput() {
        currentLocation = handleUserInput (input: userInput.lowercased(), currentLocation: currentLocation, storyText: &storyText)
        userInput = ""
        
    }
    
}

#Preview {
    ContentView()
}

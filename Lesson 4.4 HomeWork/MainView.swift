//
//  ContentView.swift
//  Lesson 4.4 HomeWork
//
//  Created by Psycho on 19.09.2022.
//

import SwiftUI

struct MainView: View {
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = 0.0
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            ScoreSliderView(
                currentValue: $currentValue,
                targetValue: targetValue,
                alpha: computeScore()
            )
            ButtonsView(
                alertPresented: $alertPresented,
                currentValue: $currentValue,
                targetValue: $targetValue,
                score: computeScore()
            )
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

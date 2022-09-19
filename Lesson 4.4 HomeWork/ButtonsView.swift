//
//  ButtonsView.swift
//  Lesson 4.4 HomeWork
//
//  Created by Psycho on 19.09.2022.
//

import SwiftUI

struct ButtonsView: View {
    @Binding var alertPresented: Bool
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    
    let score: Int
    
    var body: some View {
        VStack {
            Button("Hit me!") {
                alertPresented = true
            }
            .alert(isPresented: $alertPresented) {
                Alert(title: Text("Your score is \(score)"))
            }
            .frame(width: 100, height: 50)
            .foregroundColor(.black)
            
            Button("Try again!") {
                targetValue = Int.random(in: 1...100)
                currentValue = 0
            }
            .frame(width: 100, height: 50)
            .foregroundColor(.black)
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(
            alertPresented: .constant(false),
            currentValue: .constant(0),
            targetValue: .constant(0),
            score: 0
        )
    }
}

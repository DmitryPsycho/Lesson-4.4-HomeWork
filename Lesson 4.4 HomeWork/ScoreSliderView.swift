//
//  ScoreSliderView.swift
//  Lesson 4.4 HomeWork
//
//  Created by Psycho on 19.09.2022.
//

import SwiftUI

struct ScoreSliderView: View {
    @Binding var currentValue: Double
    
    let targetValue: Int
    let alpha: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("Pull the bullseye as close as you can to:")
                    .font(.headline.italic())
                Text("\(targetValue)")
                    .font(.title2)
                    .shadow(color: .red, radius: 3)
            }
            HStack {
                Text("1")
                SliderView(currentValue: $currentValue, alpha: alpha)
                Text("100")
            }
            .padding()
        }
    }
}

struct ScoreSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreSliderView(currentValue: .constant(0), targetValue: 0, alpha: 0)
    }
}

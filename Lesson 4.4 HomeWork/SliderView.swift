//
//  SliderView.swift
//  Lesson 4.4 HomeWork
//
//  Created by Psycho on 19.09.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var currentValue: Double
    
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.maximumValue = 100
        slider.minimumValue = 1
        slider.tintColor = .black
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChange),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(alpha)/100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChange(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(0), alpha: 0)
    }
}

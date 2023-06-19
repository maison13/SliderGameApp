//
//  UISliderRepresentation.swift
//  SliderGameApp
//
//  Created by Just Vovo on 19.06.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var currentValue: Float
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = currentValue
        slider.thumbTintColor = .red
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        let thumbAlpha = 1 - (abs(currentValue - Float(targetValue)) / uiView.maximumValue)
        uiView.thumbTintColor = uiView.thumbTintColor?.withAlphaComponent(CGFloat(thumbAlpha))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
}

// MARK: Coordinator
extension UISliderRepresentation {
    class Coordinator: NSObject {
        @Binding var currentValue: Float
        
        init(currentValue: Binding<Float>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            currentValue = sender.value
        }
    }
}
struct UISliderRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderRepresentation(currentValue: .constant(50), targetValue: .constant(60) )
    }
}

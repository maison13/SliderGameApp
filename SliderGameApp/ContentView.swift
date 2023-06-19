//
//  ContentView.swift
//  SliderGameApp
//
//  Created by Just Vovo on 18.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = 0
    @State private var currentValue: Float = 0
    
    
    var body: some View {
        VStack (spacing: 20) {
            Text("\(currentValue)")
            
            Spacer()
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            UISliderRepresentation(currentValue: $currentValue)
                .onChange(of: currentValue) { newValue in
                    updateTargetValue()
                }
            Button("Проверь меня!", action: checkMe)
            Button("Начать заново.", action: startOver)
            Spacer()
        }
        
        }
        .padding()
    }
    
    private func checkMe() {
        
    }
    
    private func startOver() {
        updateTargetValue()
    }
    private func updateTargetValue() {
        targetValue = Int.random(in: 1...99)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

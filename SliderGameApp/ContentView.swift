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
    
    @State private var isPresented = false
    
    var body: some View {
        VStack (spacing: 20) {
            Spacer()
            
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                UISliderRepresentation(currentValue: $currentValue, targetValue: $targetValue)
                Text("100")
            }
            
            Button("Проверь меня!", action: checkMe)
                .alert("Ваш результат:", isPresented: $isPresented, actions: {}) {
                    Text("\(computeScore())")
                }
            Button("Начать заново.", action: updateTargetValue)
            Spacer()
        }
        .padding()
        .onAppear {
            updateTargetValue()
        }
    }
    
    private func checkMe() {
        isPresented.toggle()
    }
    
    private func updateTargetValue() {
        targetValue = Int.random(in: 0...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - Int(currentValue))
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

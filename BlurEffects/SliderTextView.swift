//
//  SliderTextView.swift
//  BlurEffects
//
//  Created by administrator on 12/09/2024.
//

import SwiftUI

struct SliderTextView: View {
    @Binding var value: Double
    let min: Double
    let max: Double
    let text: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(text.capitalized): \(value.formatted())")
                .fontWeight(.semibold)
                .font(.headline)
            
            Slider(value: $value, in: min...max, step: 1)
        }
    }
}

#Preview {
    SliderTextView(
        value: .constant(15),
        min: 0,
        max: 50,
        text: "Red Blur Effect",
        color: .red
    )
}

//
//  ContentView.swift
//  BlurEffects
//
//  Created by administrator on 12/09/2024.
//

import SwiftUI

struct BlurEffectDemo: View {
    @State private var mainBlurRadious: Double = 10.0
    @State private var redBlurRadious: Double = 10.0
    @State private var blueBlurRadious: Double = 10.0

    let blendModes: [BlendMode] = [.plusLighter, .softLight, .normal]
    
    @State private var blendMOdeIndex = 0

    var blendMode: BlendMode {
        blendModes[blendMOdeIndex]
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue, .green, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                .blur(radius: mainBlurRadious)
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 30))
                .overlay {
                    Text("Cool Blur Effects")
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                }.padding()
            
            BlendCircleView(
                color: .red,
                circleRadius: 200,
                offsetX: -100,
                offsetY: 100,
                blurRadius: redBlurRadious,
                blendMode: blendMode
            )
            
            BlendCircleView(
                color: .blue,
                circleRadius: 200,
                offsetX: -100,
                offsetY: 100,
                blurRadius: blueBlurRadious,
                blendMode: blendMode
            )
            

            
        }
        //Sliders
        VStack {
            SliderTextView(
                value: $mainBlurRadious,
                min: 0,
                max: 30,
                text: "Main Blur raduis",
                color: .purple
            )
            
            SliderTextView(
                value: $redBlurRadious,
                min: 0,
                max: 50,
                text: "Red Blur raduis",
                color: .red
            )
            
            SliderTextView(
                value: $blueBlurRadious,
                min: 0,
                max: 50,
                text: "Blue Blur raduis",
                color: .blue
            )
        }
            .padding()
            .onTapGesture {
                blendMOdeIndex = (blendMOdeIndex + 1) % blendMode.hashValue.nonzeroBitCount
        }
        
    }
}

#Preview {
    BlurEffectDemo()
}

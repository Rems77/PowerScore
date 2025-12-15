//
//  FlameBorderView.swift
//  Power_score
//
//  Created by Lamée Rémy on 13/12/2025.
//

import Foundation
import SwiftUI

struct FlameBorderView: View {
    @State private var animate = false

    var body: some View {
        RoundedRectangle(cornerRadius: 18)
            .stroke(
                LinearGradient(
                    colors: [.red, .orange, .yellow],
                    startPoint: animate ? .top : .bottom,
                    endPoint: animate ? .bottom : .top
                ),
                lineWidth: 5
            )
            .blur(radius: 1.5)
            .opacity(0.9)
            .onAppear {
                withAnimation(
                    .linear(duration: 1.2)
                    .repeatForever(autoreverses: true)
                ) {
                    animate.toggle()
                }
            }
    }
}

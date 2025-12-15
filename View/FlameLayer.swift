//
//  File.swift
//  Power_score
//
//  Created by Lamée Rémy on 13/12/2025.
//

import Foundation
import SwiftUI

struct FlameLayer: View {
    @State private var offset1: CGFloat = -10
    @State private var offset2: CGFloat = 10
    @State private var scale: CGFloat = 1.0

    var body: some View {
        ZStack {
            // Flamme principale
            Capsule()
                .fill(
                    LinearGradient(
                        colors: [.red, .orange, .yellow],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
                .frame(width: 14, height: 40)
                .offset(y: offset1)
                .blur(radius: 6)

            // Flamme secondaire
            Capsule()
                .fill(
                    LinearGradient(
                        colors: [.orange, .yellow],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
                .frame(width: 10, height: 30)
                .offset(y: offset2)
                .blur(radius: 5)
        }
        .scaleEffect(scale)
        .onAppear {
            withAnimation(
                .easeInOut(duration: 0.6)
                .repeatForever(autoreverses: true)
            ) {
                offset1 = -20
                offset2 = -5
                scale = 1.1
            }
        }
    }
}

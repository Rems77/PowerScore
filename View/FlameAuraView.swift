//
//  FlameAuraView.swift
//  Power_score
//
//  Created by Lamée Rémy on 13/12/2025.
//

import Foundation
import SwiftUI

struct FlameAuraView: View {
    let count = 12

    var body: some View {
        ZStack {
            ForEach(0..<count, id: \.self) { i in
                FlameLayer()
                    .offset(y: -45)
                    .rotationEffect(.degrees(Double(i) / Double(count) * 360))
            }
        }
    }
}

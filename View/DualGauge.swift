//
//  DualGauge.swift
//  Power_score
//
//  Created by Lamée Rémy on 11/12/2025.
//

import Foundation
import SwiftUI

struct DualGauge: View {
    var value1: Double
    var value2: Double
    var maxValue: Double
    
    var body: some View {
        let safeMax = max(0.0001, maxValue)
        let ratio1 = min(max(value1 / safeMax, 0), 1)
        let ratio2 = min(max(value2 / safeMax, 0), 1)
        
        HStack(alignment: .bottom) {
            
            Spacer()
            
            // Jauge 1
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 40, height: 250)
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.red, .orange, .green]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .mask(
                        GeometryReader { proxy in
                                    Rectangle()
                                        .frame(height: proxy.size.height * ratio1)
                                        .frame(maxHeight: .infinity, alignment: .bottom)
                                }
                        )
                    .frame(width: 40, height: 250 * ratio1)
                    .animation(.easeOut(duration: 0.4), value: value1)
            }
            
            Spacer()
            
            // Jauge 2
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 40, height: 250)
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.red, .orange, .green]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .mask(
                        GeometryReader { proxy in
                                    Rectangle()
                                        .frame(height: proxy.size.height * ratio2)
                                        .frame(maxHeight: .infinity, alignment: .bottom)
                                }
                        )
                    .frame(width: 40, height: 250 * ratio2)
                    .animation(.easeOut(duration: 0.4), value: value2)
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

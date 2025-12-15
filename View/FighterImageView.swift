//
//  FighterImageView.swift
//  Power_score
//
//  Created by Lamée Rémy on 13/12/2025.
//

import Foundation
import SwiftUI
struct FighterImageView: View {
    let perso: Perso
    let isWinner: Bool

    var body: some View {
        ZStack {
            if isWinner {
                FlameBorderView()
                    .frame(width: 90, height: 90)
            }

            Image(perso.photo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

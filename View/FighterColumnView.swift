//
//  FighterColumnView.swift
//  Power_score
//
//  Created by Lamée Rémy on 13/12/2025.
//

import Foundation
import SwiftUI

struct FighterColumnView: View {
    let perso: Perso
    let value: Int
    let isWinner: Bool

    var body: some View {
        VStack(spacing: 8) {

            ZStack {
                // Espace réservé IDENTIQUE pour tous
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.clear)
                    .frame(width: 90, height: 90)

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

            // NOM
            Text(perso.nom)
                .font(.headline)
                .multilineTextAlignment(.center)

            // SCORE (restauré ✅)
            Text("\(value)")
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(width: 120) // 👉 largeur FIXE = alignement parfait
    }
}

//
//  ContentView.swift
//  Pokedex
//
//  Created by Lamée Rémy   on 21/02/2025.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    let perso: Perso
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // --- IMAGE ---
                GeometryReader { geo in
                    Image(perso.photo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                        .clipped()
                }
                .frame(height: 250)
                .padding(.horizontal)
                
                // --- NOM ---
                Text(perso.nom)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                // --- TABLEAU DE STATS ---
                VStack(spacing: 12) {
                        StatRow(label: "force", value: perso.force)
                        StatRow(label: "vitesse", value: perso.vitesse)
                        StatRow(label: "durabilite", value: perso.durabilite)
                        StatRow(label: "intelligence", value: perso.intelligence)
                        StatRow(label: "pouvoir", value: perso.pouvoir)
                        StatRow(label: "agilite", value: perso.agilite)
                        StatRow(label: "endurance", value: perso.endurance)
                        StatRow(label: "regeneration", value: perso.regeneration)
                        StatRow(label: "polyvalence", value: perso.polyvalence)
                        StatRow(label: "experience", value: perso.experience)
                        StatRow(label: "powerscore", value: perso.powerScore)
                    }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        }
    }


struct StatRow: View {
    let label: String
    let value: Int
    
    var body: some View {
        HStack {
            Image(systemName: icon(for: label))
                .foregroundColor(.orange)
                .frame(width: 24)
            Text(label)
                .font(.headline)
            Spacer()
            Text("\(value)")
                .font(.headline)
                .fontWeight(.bold)
        }
        .padding(.vertical, 6)
        .padding(.horizontal)
        .background(Color.white.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    private func icon(for stat: String) -> String {
            switch stat.lowercased() {
            case "force": return "bolt.fill"
            case "vitesse": return "hare.fill"
            case "durabilite": return "shield.fill"
            case "intelligence": return "brain.head.profile"
            case "pouvoir": return "sparkles"
            case "agilite": return "figure.run"
            case "endurance": return "heart.fill"
            case "regeneration": return "arrow.triangle.2.circlepath"
            case "polyvalence": return "square.grid.2x2.fill"
            case "experience": return "medal.fill"
            case "powerscore": return "crown.fill"
            default: return "questionmark"
            }
        }
}

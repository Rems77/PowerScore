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
                    StatRow(label: "Force", value: perso.force)
                    StatRow(label: "Vitesse", value: perso.vitesse)
                    StatRow(label: "Durabilité", value: perso.durabilite)
                    StatRow(label: "Intelligence", value: perso.intelligence)
                    StatRow(label: "Pouvoir", value: perso.pouvoir)
                    StatRow(label: "Agilité", value: perso.agilite)
                    StatRow(label: "Endurance", value: perso.endurance)
                    StatRow(label: "Régénération", value: perso.regeneration)
                    StatRow(label: "Polyvalence", value: perso.polyvalence)
                    StatRow(label: "Expérience", value: perso.experience)
                    StatRow(label: "PowerScore", value: perso.powerScore)
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
}

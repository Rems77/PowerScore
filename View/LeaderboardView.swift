//
//  LeaderboardView.swift
//  Power_score
//
//  Created by Lamée Rémy on 11/12/2025.
//

import Foundation
import SwiftUICore
import SwiftUI

struct LeaderboardView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var selectedStat = "force"

    let stats = ["force","vitesse","durabilite","intelligence","pouvoir","agilite","endurance","regeneration","polyvalence","experience","powerScore"]

    var sortedPersos: [Perso] {
        viewModel.listePerso.sorted { value(of: $0, stat: selectedStat) > value(of: $1, stat: selectedStat) }
    }

    var body: some View {
        VStack {
            Text("Leaderboard")
                .font(.largeTitle)
                .bold()
                .padding()

            Picker("Stat", selection: $selectedStat) {
                ForEach(stats, id: \.self) { stat in
                    Text(stat.capitalized).tag(stat)
                }
            }
            .pickerStyle(.menu)
            .padding()

            List(sortedPersos.prefix(10).enumerated().map({ $0 }), id: \.element.nom) { index, perso in
                HStack {
                    Text(podiumEmoji(for: index))
                        .font(.title2)
                    Image(perso.photo)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(perso.nom)
                            .font(.headline)
                        
                            Text("\(Int(value(of: perso, stat: selectedStat)))")
                                .font(.subheadline)
                    }
                    Spacer()
                }
            }
        }
    }
    
    func podiumEmoji(for index: Int) -> String {
            switch index {
            case 0: return "🥇" // Or
            case 1: return "🥈" // Argent
            case 2: return "🥉" // Bronze
            default: return ""   // Pas de médaille pour les autres
            }
        }
    
    func value(of perso: Perso, stat: String) -> Double {
        switch stat {
        case "force": return Double(perso.force)
        case "vitesse": return Double(perso.vitesse)
        case "durabilite": return Double(perso.durabilite)
        case "intelligence": return Double(perso.intelligence)
        case "pouvoir": return Double(perso.pouvoir)
        case "agilite": return Double(perso.agilite)
        case "endurance": return Double(perso.endurance)
        case "regeneration": return Double(perso.regeneration)
        case "polyvalence": return Double(perso.polyvalence)
        case "experience": return Double(perso.experience)
        case "powerScore": return Double(perso.powerScore)
        default: return 0
        }
    }
}

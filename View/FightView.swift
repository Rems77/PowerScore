//
//  FightView.swift
//  Power_score
//
//  Created by Lamée Rémy on 09/12/2025.
//

import SwiftUI

struct FightView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var selectedStat: String = "force"
    @State private var selectedPerso1: Perso?
    @State private var selectedPerso2: Perso?
    
    var body: some View {
        VStack(spacing: 5) {
            
            // --- 1. Choix de la stat ---
            Section("Statistique à comparer") {
                Picker("Stat", selection: $selectedStat) {
                    ForEach(viewModel.stats) { stat in
                        Text(stat.name.capitalized)
                            .tag(stat.name)
                    }
                }
                .pickerStyle(.menu)
            }
            
            // --- 2. Choix du premier personnage ---
            Section("Personnage 1") {
                Picker("Choisir", selection: $selectedPerso1) {
                    Text("Aucun").tag(Perso?.none)
                    ForEach(viewModel.listePerso) { perso in
                        Text(perso.nom).tag(Perso?.some(perso))
                    }
                }
                .pickerStyle(.menu)
            }
            
            // --- 3. Choix du second personnage ---
            Section("Personnage 2") {
                Picker("Choisir", selection: $selectedPerso2) {
                    Text("Aucun").tag(Perso?.none)
                    ForEach(viewModel.listePerso) { perso in
                        Text(perso.nom).tag(Perso?.some(perso))
                    }
                }
                .pickerStyle(.menu)
            }
            
            // --- 4. Résultat ---
            if let p1 = selectedPerso1, let p2 = selectedPerso2 {
                let v1 = value(of: p1, stat: selectedStat)
                let v2 = value(of: p2, stat: selectedStat)
                let maxVal = viewModel.maxValue(for: selectedStat)
                let gagnant = winner(p1: p1, p2: p2)
                
                VStack(spacing: 15) {
                    Text("Comparaison visuelle")
                        .font(.headline)
                    
                    DualGauge(value1: Double(v1),
                              value2: Double(v2),
                              maxValue: maxVal)
                    
                    HStack(spacing: 30) {
                        FighterColumnView(
                            perso: p1,
                            value: v1,
                            isWinner: gagnant?.id == p1.id
                        )

                        FighterColumnView(
                            perso: p2,
                            value: v2,
                            isWinner: gagnant?.id == p2.id
                        )
                    }
                    Section("Résultat") {
                        if let p1 = selectedPerso1, let p2 = selectedPerso2 {
                            Text(compare(p1: p1, p2: p2))
                                .font(.headline)
                        } else {
                            Text("Sélectionnez deux personnages")
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
        // --- Fonction de comparaison ---
        func compare(p1: Perso, p2: Perso) -> String {
            let v1 = value(of: p1, stat: selectedStat)
            let v2 = value(of: p2, stat: selectedStat)
            
            if v1 > v2 {
                return "\(p1.nom) gagne!"
            } else if v2 > v1 {
                return "\(p2.nom) gagne!"
            } else {
                return "Égalité parfaite !"
            }
        }
    // --- Récupérer la valeur d'une stat pour un personnage ---
        func value(of perso: Perso, stat: String) -> Int {
            switch stat.lowercased() {
            case "force": return perso.force
            case "vitesse": return perso.vitesse
            case "durabilite": return perso.durabilite
            case "intelligence": return perso.intelligence
            case "pouvoir": return perso.pouvoir
            case "agilite": return perso.agilite
            case "endurance": return perso.endurance
            case "regeneration": return perso.regeneration
            case "polyvalence": return perso.polyvalence
            case "experience": return perso.experience
            case "powerscore": return perso.powerScore
            default: return 0
            }
        }
    func winner(p1: Perso, p2: Perso) -> Perso? {
        let v1 = value(of: p1, stat: selectedStat)
        let v2 = value(of: p2, stat: selectedStat)

        if v1 > v2 { return p1 }
        if v2 > v1 { return p2 }
        return nil // égalité
    }

    }
    
    
    


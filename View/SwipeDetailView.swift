//
//  SwipeDetailView.swift
//  Power_score
//
//  Created by Lamée Rémy on 12/12/2025.
//

import SwiftUI

struct SwipeDetailView: View {
    let personnages: [Perso]
    @State var indexActuel: Int
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        TabView(selection: $indexActuel) {
            ForEach(personnages.indices, id: \.self) { idx in
                ContentView(perso: personnages[idx], viewModel: viewModel)
                    .tag(idx)
            }
        }
        .tabViewStyle(.page)
    }
}

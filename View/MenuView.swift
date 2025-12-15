//
//  MenuView.swift
//  Power_score
//
//  Created by Lamée Rémy on 09/12/2025.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Power Score")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                NavigationLink{
                    Power_score.ListingView()
                } label: {
                    Text("Liste des personnages")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                NavigationLink{
                    Power_score.FightView(viewModel: ViewModel())
                } label: {
                    Text("Duel")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                NavigationLink{
                    Power_score.LeaderboardView(viewModel: ViewModel())
                } label: {
                    Text("Leaderboard")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                Spacer()
            }
            .padding()

        }

    }
    
}

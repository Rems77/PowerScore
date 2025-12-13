import SwiftUI

struct ListingView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.listePerso, id: \.id) { perso in
                // On récupère l'index du perso de manière sûre
                let index = viewModel.listePerso.firstIndex(of: perso) ?? 0
                
                NavigationLink {
                    SwipeDetailView(
                        personnages: viewModel.listePerso,
                        indexActuel: index,
                        viewModel: viewModel
                    )
                } label: {
                    CellView(perso: perso)
                }
            }
            .navigationTitle("Power Score")
        }
    }
}

struct CellView: View {
    let perso: Perso
    
    var body: some View {
        HStack {
            Image(perso.photo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            Text(perso.nom)
        }
    }
}
#Preview {
    ListingView()
}

import SwiftUI

struct FilmsView: View {
    @EnvironmentObject private var store: AppStore

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(store.state.films.films, id: \.self) { film in
                    FilmsDetailView(
                        id: film.id,
                        title: film.title
                    )
                }
            }
        }
        .onFirstAppear {
            store.dispatch(.films(.fetchFilms))
        }
    }
}

#Preview {
    FilmsView()
        .environmentObject(AppStore.Stubs.loaded)
}

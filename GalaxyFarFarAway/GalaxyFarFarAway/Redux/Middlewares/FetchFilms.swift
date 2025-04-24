import Redux

func fetchFilms(repository: FilmsRepositoring) -> Middleware<AppState, AppAction> {
    { state, action in
        switch action {
        case .films(.fetchFilms):
            do {
                let films = try await repository.fetchFilms()
                return .films(.setFilms(films))
            } catch {
                return nil
            }
        default:
            break
        }
        return nil
    }
}

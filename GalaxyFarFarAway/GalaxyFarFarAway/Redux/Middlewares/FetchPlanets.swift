import Redux

func fetchPlanets(repository: PlanetsRepositoring) -> Middleware<AppState, AppAction> {
    { state, action in
        switch action {
        case .fetchPlanets:
            if state.isNextAvailable {
                do {
                    let planetList = try await repository.fetchPlanetList(page: state.page)
                    return .setPlanetList(planetList)
                } catch {
                    return .fetchPlanetsError
                }
            }
        default:
            break
        }
        return nil
    }
}

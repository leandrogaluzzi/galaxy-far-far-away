import Redux

func fetchPlanets(repository: PlanetsRepositoring) -> Middleware<AppState, AppAction> {
    { state, action in
        switch action {
        case .planets(.fetchPlanets):
            if state.planets.isNextAvailable {
                do {
                    let planetList = try await repository.fetchPlanetList(page: state.planets.page)
                    return .planets(.setPlanetList(planetList))
                } catch {
                    return .planets(.fetchPlanetsError)
                }
            }
        default:
            break
        }
        return nil
    }
}

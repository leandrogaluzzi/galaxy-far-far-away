import Redux

func fetchPlanets(repository: PlanetsRepositoring) -> Middleware<AppState> {
    { state, action, dispatch in
        switch action {
        case _ as FetchPlanets:
            if state.isNextAvailable {
                do {
                    let planetList = try await repository.fetchPlanetList(page: state.page)
                    await dispatch(SetPlanetList(planetList: planetList))
                } catch {
                    await dispatch(FetchPlanetsError())
                }
            }
        default:
            break
        }
    }
}

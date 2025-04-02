import Redux

func fetchPlanets(repository: PlanetsRepositoring) -> Middleware<State> {
    { state, action, dispatch in
        switch action {
        case _ as FetchPlanets:
            do {
                let planets = try await repository.fetchPlanets()
                await dispatch(SetPlanets(planets: planets))
            } catch {
                await dispatch(FetchPlanetsError())
            }
        default:
            break
        }
    }
}

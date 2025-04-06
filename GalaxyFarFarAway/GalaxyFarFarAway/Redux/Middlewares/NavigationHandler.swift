import Navigation
import Redux

func navigationHandler(
    router: NavigationRouter
) -> Middleware<AppState, AppAction> {
    { state, action in
        switch action {
        case let .selectPlanet(planet):
            await router.navigate(to: NavigationDestination.details(planet: planet))
        default:
            break
        }
        return nil
    }
}

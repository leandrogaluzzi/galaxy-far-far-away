import Redux

func navigationHandler(
    router: Router
) -> Middleware<AppState> {
    { state, action, dispatch in
        switch action {
        case let action as SelectPlanet:
            await router.navigate(to: NavigationDestination.details(planet: action.planet))
        default:
            break
        }
    }
}

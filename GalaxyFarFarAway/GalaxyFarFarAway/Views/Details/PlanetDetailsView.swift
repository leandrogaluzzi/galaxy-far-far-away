import SwiftUI

struct PlanetDetailsView: View {
    let planet: Planet

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Population: \(planet.population)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Climates: \(planet.climates.emoji)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
        }
        .navigationTitle(planet.name)
        .padding()
    }
}

#Preview {
    PlanetDetailsView(
        planet: .Stubs.alderaan
    )
}

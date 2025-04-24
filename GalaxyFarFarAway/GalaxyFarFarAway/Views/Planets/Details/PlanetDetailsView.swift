import SwiftUI

struct PlanetDetailsView: View {
    let planet: Planet

    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Text(planet.name)
                .bold()
                .font(.title)
            VStack(alignment: .leading, spacing: 10) {
                Text("Population: \(planet.population)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Diameter: \(planet.diameter)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Gravity: \(planet.gravity)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            HStack(alignment: .center) {
                ListView(
                    title: "Climates:",
                    strings: planet.climates.map { $0.rawValue }
                )
                Spacer()
                    .frame(width: 40)
                ListView(
                    title: "Terrains:",
                    strings: planet.terrains.map { $0.rawValue }
                )
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PlanetDetailsView(
        planet: .Stubs.alderaan
    )
}

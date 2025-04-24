import SwiftUI

struct PlanetCardView: View {
    let planet: Planet

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(planet.name)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .center)
            VStack(alignment: .leading, spacing: 10) {
                Text("Population: \(planet.population)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                if !planet.climates.isEmpty {
                    Text("Climates: \(planet.allClimatesString)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}

#Preview {
    PlanetCardView(
        planet: Planet.Stubs.tatooine
    )
    .padding()
}

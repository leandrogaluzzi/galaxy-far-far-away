import SwiftUI

struct ListView: View {
    let title: String
    let strings: [String]

    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .bold()
                .font(.title2)
            VStack {
                ForEach(strings, id: \.self) { string in
                    Text(string.capitalized)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ListView(
        title: "Football Players",
        strings: [
            "Lionel Messi",
            "Cristiano Ronaldo",
            "Neymar Junior"
        ]
    )
}

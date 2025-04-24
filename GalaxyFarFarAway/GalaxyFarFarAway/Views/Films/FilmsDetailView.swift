import SwiftUI

struct FilmsDetailView: View {
    let id: String
    let title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("ID: \(id)")
                .font(.caption)
                .foregroundColor(.secondary)
            Text(title)
                .font(.body)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(4)
    }
}

#Preview {
    FilmsDetailView(id: "001", title: "Preview Item Title")
}

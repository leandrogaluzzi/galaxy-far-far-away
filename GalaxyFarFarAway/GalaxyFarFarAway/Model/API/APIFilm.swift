import Foundation

struct APIFilm: Decodable {
    let _id: String
    let properties: APIFilmProperties
}

struct APIFilmProperties: Decodable {
    let title: String
    let release_date: String
}

extension APIFilm {
    func toModel() -> Film {
        Film(
            id: _id,
            title: properties.title,
            releaseDate: properties.release_date
        )
    }
}

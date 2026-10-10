public enum Continent: String, Codable, CaseIterable, Sendable {
    case africa
    case asia
    case europe
    case northAmerica
    case southAmerica
    case oceania

    public var displayName: String {
        switch self {
        case .africa: "Africa"
        case .asia: "Asia"
        case .europe: "Europe"
        case .northAmerica: "North America"
        case .southAmerica: "South America"
        case .oceania: "Oceania"
        }
    }
}

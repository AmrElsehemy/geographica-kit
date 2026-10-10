/// A sovereign state or widely recognised territory, identified by its ISO 3166-1 alpha-2 code.
///
/// `GeographicaCore` is deliberately independent of any game or UI framework so the same data can
/// power apps, websites and content tooling.
public struct Country: Codable, Hashable, Identifiable, Sendable {
    /// Upper-case ISO 3166-1 alpha-2 code (Kosovo uses the user-assigned `XK`).
    public let iso2: String
    public let name: String
    /// `nil` where the capital is disputed or there is no settled answer.
    public let capital: String?
    public let continent: Continent

    public var id: String { iso2 }

    public init(iso2: String, name: String, capital: String?, continent: Continent) {
        self.iso2 = iso2
        self.name = name
        self.capital = capital
        self.continent = continent
    }
}

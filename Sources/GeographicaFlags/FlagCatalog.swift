import GeographicaCore

/// Flag-specific knowledge layered on `GeographicaCore`: the flag glyph, how recognisable it is,
/// and which flags are easily confused with it.
public enum FlagCatalog {
    /// The flag as an emoji built from the country's ISO code (regional indicator symbols).
    public static func emoji(for country: Country) -> String {
        emoji(iso2: country.iso2)
    }

    public static func emoji(iso2: String) -> String {
        var scalars = String.UnicodeScalarView()
        for scalar in iso2.uppercased().unicodeScalars {
            guard let base = Unicode.Scalar(0x1F1E6 + scalar.value - 0x41) else { continue }
            scalars.append(base)
        }
        return String(scalars)
    }

    public static func difficulty(of country: Country) -> FlagDifficulty {
        if easy.contains(country.iso2) { return .easy }
        if obscure.contains(country.iso2) || lookalikeCodes.contains(country.iso2) { return .hard }
        return .medium
    }

    /// Countries whose flags are commonly confused with `country`'s, nearest first.
    public static func lookalikes(of country: Country) -> [Country] {
        var seen: Set<String> = [country.iso2]
        var result: [Country] = []
        for group in lookalikeGroups where group.contains(country.iso2) {
            for code in group where seen.insert(code).inserted {
                if let match = CountryCatalog.country(iso2: code) { result.append(match) }
            }
        }
        return result
    }

    static let lookalikeGroups: [[String]] = [
        ["RO", "TD", "AD", "MD"],
        ["ID", "MC", "PL"],
        ["IE", "CI", "IT", "MX", "HU"],
        ["AU", "NZ", "FJ", "TV"],
        ["NO", "IS", "DK", "SE", "FI"],
        ["NL", "LU", "FR", "RU", "SK", "SI", "HR", "RS"],
        ["SN", "ML", "GN", "GH", "CM", "BF", "ET"],
        ["CO", "EC", "VE"],
        ["AT", "LV", "PE", "CA"],
        ["BD", "JP", "PW"],
        ["SA", "PK", "TR", "TN", "DZ"],
        ["AE", "KW", "JO", "SD", "EG", "YE", "SY", "IQ"],
        ["TH", "CR", "CU", "CL"],
        ["BO", "LT", "GH", "ET"],
        ["HN", "SV", "NI", "GT", "AR", "UY"],
        ["BA", "XK", "AL"],
        ["MR", "KM", "AZ", "TM"],
        ["GA", "ST", "SL", "NE", "IN", "BG"],
        ["DE", "BE", "UG", "BI"],
        ["ZA", "ZM", "ZW", "MZ"]
    ]

    private static let lookalikeCodes: Set<String> = Set(lookalikeGroups.joined())

    private static let easy: Set<String> = [
        "US", "GB", "FR", "DE", "IT", "ES", "JP", "CN", "IN", "BR", "CA", "AU", "MX", "RU", "EG",
        "SA", "TR", "KR", "ZA", "AR", "GR", "CH", "PT", "NL", "SE", "NP", "CU", "JM", "IL", "BE",
        "AT", "PL", "UA", "IE", "NZ", "CL", "CO", "PE", "KE", "NG", "MA", "TH", "VN", "PH", "ID", "PK"
    ]

    private static let obscure: Set<String> = [
        "NR", "TV", "KI", "MH", "FM", "PW", "SB", "VU", "TO", "WS", "KM", "ST", "SC", "LS", "SZ",
        "DJ", "ER", "GW", "BI", "CF", "SS", "TL", "BT", "BN", "KG", "TJ", "TM", "UZ", "LI", "SM",
        "AD", "MC", "VA", "KN", "LC", "VC", "AG", "GD", "DM", "BZ", "SR", "GY", "XK", "PS"
    ]
}

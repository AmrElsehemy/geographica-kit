import Foundation
import GeographicaCore

/// Bundled flag artwork: one PNG per catalog country (720 px wide, native aspect ratio, transparent
/// background), rendered from public-domain SVGs by `Scripts/render-flags.mjs`.
extension FlagCatalog {
    /// The bundled PNG for a two-letter ISO code (case-insensitive), or `nil` for malformed or
    /// unknown codes.
    public static func imageURL(iso2: String) -> URL? {
        guard isWellFormed(iso2: iso2) else { return nil }
        return Bundle.module.url(forResource: iso2.lowercased(), withExtension: "png", subdirectory: "Flags")
    }

    public static func imageURL(for country: Country) -> URL? {
        imageURL(iso2: country.iso2)
    }

    /// Raw PNG bytes, for callers that don't want a file URL.
    public static func imageData(iso2: String) -> Data? {
        imageURL(iso2: iso2).flatMap { try? Data(contentsOf: $0) }
    }

    static func isWellFormed(iso2: String) -> Bool {
        let scalars = iso2.unicodeScalars
        return scalars.count == 2 && scalars.allSatisfy { ("A"..."Z").contains($0) || ("a"..."z").contains($0) }
    }
}

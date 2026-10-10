import Foundation
import GeographicaCore
import Testing
@testable import GeographicaFlags

@Suite struct FlagArtworkTests {
    private let pngSignature: [UInt8] = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]

    /// Width and height from the PNG IHDR chunk.
    private func dimensions(_ data: Data) -> (width: Int, height: Int)? {
        guard data.count > 24 else { return nil }
        func int(_ offset: Int) -> Int {
            data[offset..<offset + 4].reduce(0) { ($0 << 8) | Int($1) }
        }
        return (int(16), int(20))
    }

    @Test func everyCatalogCountryHasValidArtwork() throws {
        for country in CountryCatalog.all {
            let data = try #require(FlagCatalog.imageData(iso2: country.iso2), "missing artwork for \(country.iso2)")
            #expect(Array(data.prefix(8)) == pngSignature, "\(country.iso2) is not a PNG")
            let size = try #require(dimensions(data))
            #expect(size.width == 720, "\(country.iso2) width")
            // Aspect ratios run from Qatar (28:11, the widest) to Nepal (taller than wide).
            #expect((250...950).contains(size.height), "\(country.iso2) height \(size.height)")
        }
    }

    @Test func lookupIsCaseInsensitiveAndRejectsMalformedCodes() {
        #expect(FlagCatalog.imageURL(iso2: "eg") != nil)
        #expect(FlagCatalog.imageURL(iso2: "EG") == FlagCatalog.imageURL(iso2: "eg"))
        for bad in ["", "E", "EGY", "1A", "é", "../", "ZZ"] {
            #expect(FlagCatalog.imageURL(iso2: bad) == nil, "input: \(bad.debugDescription)")
        }
    }

    private func size(of iso2: String) throws -> (width: Int, height: Int) {
        let data = try #require(FlagCatalog.imageData(iso2: iso2))
        return try #require(dimensions(data))
    }

    @Test func artworkKeepsEachFlagsOwnAspectRatio() throws {
        let nepal = try size(of: "NP")
        let switzerland = try size(of: "CH")
        let egypt = try size(of: "EG")
        #expect(nepal.height > nepal.width)
        #expect(switzerland.height == switzerland.width)
        #expect(egypt.height < egypt.width)
    }
}

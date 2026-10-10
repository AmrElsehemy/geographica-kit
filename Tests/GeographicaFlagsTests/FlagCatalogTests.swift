import GeographicaCore
import Testing
@testable import GeographicaFlags

@Suite struct FlagCatalogTests {
    @Test func emojiIsBuiltFromRegionalIndicators() {
        #expect(FlagCatalog.emoji(iso2: "EG") == "🇪🇬")
        #expect(FlagCatalog.emoji(iso2: "jp") == "🇯🇵")
        #expect(FlagCatalog.emoji(iso2: "XK") == "🇽🇰")
    }

    @Test func malformedCodesYieldTheNeutralFlagInsteadOfGarbage() {
        let neutral = FlagCatalog.neutralFlag
        for bad in ["", "E", "EGY", "1A", "A-", "é", "ÉG", "  ", "ß", "😀😀", "e g", "\u{0}\u{0}"] {
            #expect(FlagCatalog.emoji(iso2: bad) == neutral, "input: \(bad.debugDescription)")
        }
        #expect(FlagCatalog.emoji(iso2: "eg") == "🇪🇬")
    }

    @Test func everyCountryProducesTwoScalars() {
        for country in CountryCatalog.all {
            #expect(FlagCatalog.emoji(for: country).unicodeScalars.count == 2)
        }
    }

    @Test func lookalikeGroupsOnlyReferenceKnownCountries() {
        for group in FlagCatalog.lookalikeGroups {
            for code in group {
                #expect(CountryCatalog.country(iso2: code) != nil, "unknown code \(code)")
            }
        }
    }

    @Test func lookalikesExcludeSelfAndAreSymmetricEnough() throws {
        let romania = try #require(CountryCatalog.country(iso2: "RO"))
        let codes = FlagCatalog.lookalikes(of: romania).map(\.iso2)
        #expect(codes.contains("TD"))
        #expect(!codes.contains("RO"))
    }

    @Test func difficultyTiers() throws {
        let japan = try #require(CountryCatalog.country(iso2: "JP"))
        let nauru = try #require(CountryCatalog.country(iso2: "NR"))
        let romania = try #require(CountryCatalog.country(iso2: "RO"))
        #expect(FlagCatalog.difficulty(of: japan) == .easy)
        #expect(FlagCatalog.difficulty(of: nauru) == .hard)
        #expect(FlagCatalog.difficulty(of: romania) == .hard)
    }
}

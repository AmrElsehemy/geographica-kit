import Testing
@testable import GeographicaCore

@Suite struct CountryCatalogTests {
    @Test func codesAreUniqueTwoLetterUppercase() {
        let codes = CountryCatalog.all.map(\.iso2)
        #expect(Set(codes).count == codes.count)
        for code in codes {
            #expect(code.count == 2)
            #expect(code == code.uppercased())
        }
    }

    @Test func coversTheWorld() {
        // 193 UN members + Vatican City, Palestine, Kosovo, Taiwan.
        #expect(CountryCatalog.all.count == 197)
        for continent in Continent.allCases {
            #expect(!CountryCatalog.countries(in: continent).isEmpty)
        }
    }

    @Test func lookupIsCaseInsensitive() {
        #expect(CountryCatalog.country(iso2: "eg")?.name == "Egypt")
        #expect(CountryCatalog.country(iso2: "EG")?.capital == "Cairo")
        #expect(CountryCatalog.country(iso2: "ZZ") == nil)
    }

    @Test func everyCountryHasANameAndCapitalExceptDisputed() {
        for country in CountryCatalog.all {
            #expect(!country.name.isEmpty)
            if country.capital == nil { #expect(country.iso2 == "PS") }
        }
    }
}

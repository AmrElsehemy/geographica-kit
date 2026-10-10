/// The built-in, offline country dataset.
public enum CountryCatalog {
    public static let all: [Country] = rows.map {
        Country(iso2: $0.0, name: $0.1, capital: $0.2, continent: $0.3)
    }

    private static let byCode: [String: Country] = Dictionary(uniqueKeysWithValues: all.map { ($0.iso2, $0) })

    public static func country(iso2: String) -> Country? {
        byCode[iso2.uppercased()]
    }

    public static func countries(in continent: Continent) -> [Country] {
        all.filter { $0.continent == continent }
    }

    // swiftlint:disable line_length
    private static let rows: [(String, String, String?, Continent)] = [
        // Africa
        ("DZ", "Algeria", "Algiers", .africa), ("AO", "Angola", "Luanda", .africa),
        ("BJ", "Benin", "Porto-Novo", .africa), ("BW", "Botswana", "Gaborone", .africa),
        ("BF", "Burkina Faso", "Ouagadougou", .africa), ("BI", "Burundi", "Gitega", .africa),
        ("CV", "Cape Verde", "Praia", .africa), ("CM", "Cameroon", "Yaoundé", .africa),
        ("CF", "Central African Republic", "Bangui", .africa), ("TD", "Chad", "N'Djamena", .africa),
        ("KM", "Comoros", "Moroni", .africa), ("CG", "Republic of the Congo", "Brazzaville", .africa),
        ("CD", "DR Congo", "Kinshasa", .africa), ("CI", "Côte d'Ivoire", "Yamoussoukro", .africa),
        ("DJ", "Djibouti", "Djibouti", .africa), ("EG", "Egypt", "Cairo", .africa),
        ("GQ", "Equatorial Guinea", "Malabo", .africa), ("ER", "Eritrea", "Asmara", .africa),
        ("SZ", "Eswatini", "Mbabane", .africa), ("ET", "Ethiopia", "Addis Ababa", .africa),
        ("GA", "Gabon", "Libreville", .africa), ("GM", "Gambia", "Banjul", .africa),
        ("GH", "Ghana", "Accra", .africa), ("GN", "Guinea", "Conakry", .africa),
        ("GW", "Guinea-Bissau", "Bissau", .africa), ("KE", "Kenya", "Nairobi", .africa),
        ("LS", "Lesotho", "Maseru", .africa), ("LR", "Liberia", "Monrovia", .africa),
        ("LY", "Libya", "Tripoli", .africa), ("MG", "Madagascar", "Antananarivo", .africa),
        ("MW", "Malawi", "Lilongwe", .africa), ("ML", "Mali", "Bamako", .africa),
        ("MR", "Mauritania", "Nouakchott", .africa), ("MU", "Mauritius", "Port Louis", .africa),
        ("MA", "Morocco", "Rabat", .africa), ("MZ", "Mozambique", "Maputo", .africa),
        ("NA", "Namibia", "Windhoek", .africa), ("NE", "Niger", "Niamey", .africa),
        ("NG", "Nigeria", "Abuja", .africa), ("RW", "Rwanda", "Kigali", .africa),
        ("ST", "São Tomé and Príncipe", "São Tomé", .africa), ("SN", "Senegal", "Dakar", .africa),
        ("SC", "Seychelles", "Victoria", .africa), ("SL", "Sierra Leone", "Freetown", .africa),
        ("SO", "Somalia", "Mogadishu", .africa), ("ZA", "South Africa", "Pretoria", .africa),
        ("SS", "South Sudan", "Juba", .africa), ("SD", "Sudan", "Khartoum", .africa),
        ("TZ", "Tanzania", "Dodoma", .africa), ("TG", "Togo", "Lomé", .africa),
        ("TN", "Tunisia", "Tunis", .africa), ("UG", "Uganda", "Kampala", .africa),
        ("ZM", "Zambia", "Lusaka", .africa), ("ZW", "Zimbabwe", "Harare", .africa),
        // Europe
        ("AL", "Albania", "Tirana", .europe), ("AD", "Andorra", "Andorra la Vella", .europe),
        ("AT", "Austria", "Vienna", .europe), ("BY", "Belarus", "Minsk", .europe),
        ("BE", "Belgium", "Brussels", .europe), ("BA", "Bosnia and Herzegovina", "Sarajevo", .europe),
        ("BG", "Bulgaria", "Sofia", .europe), ("HR", "Croatia", "Zagreb", .europe),
        ("CY", "Cyprus", "Nicosia", .europe), ("CZ", "Czechia", "Prague", .europe),
        ("DK", "Denmark", "Copenhagen", .europe), ("EE", "Estonia", "Tallinn", .europe),
        ("FI", "Finland", "Helsinki", .europe), ("FR", "France", "Paris", .europe),
        ("DE", "Germany", "Berlin", .europe), ("GR", "Greece", "Athens", .europe),
        ("HU", "Hungary", "Budapest", .europe), ("IS", "Iceland", "Reykjavik", .europe),
        ("IE", "Ireland", "Dublin", .europe), ("IT", "Italy", "Rome", .europe),
        ("XK", "Kosovo", "Pristina", .europe), ("LV", "Latvia", "Riga", .europe),
        ("LI", "Liechtenstein", "Vaduz", .europe), ("LT", "Lithuania", "Vilnius", .europe),
        ("LU", "Luxembourg", "Luxembourg", .europe), ("MT", "Malta", "Valletta", .europe),
        ("MD", "Moldova", "Chișinău", .europe), ("MC", "Monaco", "Monaco", .europe),
        ("ME", "Montenegro", "Podgorica", .europe), ("NL", "Netherlands", "Amsterdam", .europe),
        ("MK", "North Macedonia", "Skopje", .europe), ("NO", "Norway", "Oslo", .europe),
        ("PL", "Poland", "Warsaw", .europe), ("PT", "Portugal", "Lisbon", .europe),
        ("RO", "Romania", "Bucharest", .europe), ("RU", "Russia", "Moscow", .europe),
        ("SM", "San Marino", "San Marino", .europe), ("RS", "Serbia", "Belgrade", .europe),
        ("SK", "Slovakia", "Bratislava", .europe), ("SI", "Slovenia", "Ljubljana", .europe),
        ("ES", "Spain", "Madrid", .europe), ("SE", "Sweden", "Stockholm", .europe),
        ("CH", "Switzerland", "Bern", .europe), ("UA", "Ukraine", "Kyiv", .europe),
        ("GB", "United Kingdom", "London", .europe), ("VA", "Vatican City", "Vatican City", .europe),
        // Asia
        ("AF", "Afghanistan", "Kabul", .asia), ("AM", "Armenia", "Yerevan", .asia),
        ("AZ", "Azerbaijan", "Baku", .asia), ("BH", "Bahrain", "Manama", .asia),
        ("BD", "Bangladesh", "Dhaka", .asia), ("BT", "Bhutan", "Thimphu", .asia),
        ("BN", "Brunei", "Bandar Seri Begawan", .asia), ("KH", "Cambodia", "Phnom Penh", .asia),
        ("CN", "China", "Beijing", .asia), ("GE", "Georgia", "Tbilisi", .asia),
        ("IN", "India", "New Delhi", .asia), ("ID", "Indonesia", "Jakarta", .asia),
        ("IR", "Iran", "Tehran", .asia), ("IQ", "Iraq", "Baghdad", .asia),
        ("IL", "Israel", "Jerusalem", .asia), ("JP", "Japan", "Tokyo", .asia),
        ("JO", "Jordan", "Amman", .asia), ("KZ", "Kazakhstan", "Astana", .asia),
        ("KW", "Kuwait", "Kuwait City", .asia), ("KG", "Kyrgyzstan", "Bishkek", .asia),
        ("LA", "Laos", "Vientiane", .asia), ("LB", "Lebanon", "Beirut", .asia),
        ("MY", "Malaysia", "Kuala Lumpur", .asia), ("MV", "Maldives", "Malé", .asia),
        ("MN", "Mongolia", "Ulaanbaatar", .asia), ("MM", "Myanmar", "Naypyidaw", .asia),
        ("NP", "Nepal", "Kathmandu", .asia), ("KP", "North Korea", "Pyongyang", .asia),
        ("OM", "Oman", "Muscat", .asia), ("PK", "Pakistan", "Islamabad", .asia),
        ("PS", "Palestine", nil, .asia), ("PH", "Philippines", "Manila", .asia),
        ("QA", "Qatar", "Doha", .asia), ("SA", "Saudi Arabia", "Riyadh", .asia),
        ("SG", "Singapore", "Singapore", .asia), ("KR", "South Korea", "Seoul", .asia),
        ("LK", "Sri Lanka", "Sri Jayawardenepura Kotte", .asia), ("SY", "Syria", "Damascus", .asia),
        ("TW", "Taiwan", "Taipei", .asia), ("TJ", "Tajikistan", "Dushanbe", .asia),
        ("TH", "Thailand", "Bangkok", .asia), ("TL", "Timor-Leste", "Dili", .asia),
        ("TR", "Türkiye", "Ankara", .asia), ("TM", "Turkmenistan", "Ashgabat", .asia),
        ("AE", "United Arab Emirates", "Abu Dhabi", .asia), ("UZ", "Uzbekistan", "Tashkent", .asia),
        ("VN", "Vietnam", "Hanoi", .asia), ("YE", "Yemen", "Sana'a", .asia),
        // North America
        ("AG", "Antigua and Barbuda", "St. John's", .northAmerica), ("BS", "Bahamas", "Nassau", .northAmerica),
        ("BB", "Barbados", "Bridgetown", .northAmerica), ("BZ", "Belize", "Belmopan", .northAmerica),
        ("CA", "Canada", "Ottawa", .northAmerica), ("CR", "Costa Rica", "San José", .northAmerica),
        ("CU", "Cuba", "Havana", .northAmerica), ("DM", "Dominica", "Roseau", .northAmerica),
        ("DO", "Dominican Republic", "Santo Domingo", .northAmerica), ("SV", "El Salvador", "San Salvador", .northAmerica),
        ("GD", "Grenada", "St. George's", .northAmerica), ("GT", "Guatemala", "Guatemala City", .northAmerica),
        ("HT", "Haiti", "Port-au-Prince", .northAmerica), ("HN", "Honduras", "Tegucigalpa", .northAmerica),
        ("JM", "Jamaica", "Kingston", .northAmerica), ("MX", "Mexico", "Mexico City", .northAmerica),
        ("NI", "Nicaragua", "Managua", .northAmerica), ("PA", "Panama", "Panama City", .northAmerica),
        ("KN", "Saint Kitts and Nevis", "Basseterre", .northAmerica), ("LC", "Saint Lucia", "Castries", .northAmerica),
        ("VC", "Saint Vincent and the Grenadines", "Kingstown", .northAmerica),
        ("TT", "Trinidad and Tobago", "Port of Spain", .northAmerica), ("US", "United States", "Washington, D.C.", .northAmerica),
        // South America
        ("AR", "Argentina", "Buenos Aires", .southAmerica), ("BO", "Bolivia", "Sucre", .southAmerica),
        ("BR", "Brazil", "Brasília", .southAmerica), ("CL", "Chile", "Santiago", .southAmerica),
        ("CO", "Colombia", "Bogotá", .southAmerica), ("EC", "Ecuador", "Quito", .southAmerica),
        ("GY", "Guyana", "Georgetown", .southAmerica), ("PY", "Paraguay", "Asunción", .southAmerica),
        ("PE", "Peru", "Lima", .southAmerica), ("SR", "Suriname", "Paramaribo", .southAmerica),
        ("UY", "Uruguay", "Montevideo", .southAmerica), ("VE", "Venezuela", "Caracas", .southAmerica),
        // Oceania
        ("AU", "Australia", "Canberra", .oceania), ("FJ", "Fiji", "Suva", .oceania),
        ("KI", "Kiribati", "Tarawa", .oceania), ("MH", "Marshall Islands", "Majuro", .oceania),
        ("FM", "Micronesia", "Palikir", .oceania), ("NR", "Nauru", "Yaren", .oceania),
        ("NZ", "New Zealand", "Wellington", .oceania), ("PW", "Palau", "Ngerulmud", .oceania),
        ("PG", "Papua New Guinea", "Port Moresby", .oceania), ("WS", "Samoa", "Apia", .oceania),
        ("SB", "Solomon Islands", "Honiara", .oceania), ("TO", "Tonga", "Nukuʻalofa", .oceania),
        ("TV", "Tuvalu", "Funafuti", .oceania), ("VU", "Vanuatu", "Port Vila", .oceania)
    ]
    // swiftlint:enable line_length
}

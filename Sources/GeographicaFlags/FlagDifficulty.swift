public enum FlagDifficulty: Int, Codable, CaseIterable, Comparable, Sendable {
    case easy = 1
    case medium = 2
    case hard = 3

    public static func < (lhs: FlagDifficulty, rhs: FlagDifficulty) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

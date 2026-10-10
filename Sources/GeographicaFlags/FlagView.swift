#if canImport(SwiftUI) && canImport(ImageIO)
import ImageIO
import SwiftUI

/// Shows a country's flag artwork at its native aspect ratio, falling back to the flag emoji if the
/// artwork can't be loaded. Size it with `.frame`; it never stretches the flag.
public struct FlagView: View {
    private let iso2: String
    private let label: String

    public init(iso2: String, accessibilityLabel: String = "Flag") {
        self.iso2 = iso2
        self.label = accessibilityLabel
    }

    public var body: some View {
        if let image = FlagImageCache.shared.image(for: iso2) {
            Image(decorative: image, scale: 1)
                .resizable()
                .scaledToFit()
                .accessibilityLabel(label)
        } else {
            Text(FlagCatalog.emoji(iso2: iso2))
                .font(.system(size: 120))
                .minimumScaleFactor(0.1)
                .accessibilityLabel(label)
        }
    }
}

/// Decoded flags are ~1.4 MB each, so only a handful are kept.
final class FlagImageCache: @unchecked Sendable {
    static let shared = FlagImageCache()

    private let lock = NSLock()
    private var images: [String: CGImage] = [:]
    private var order: [String] = []
    private let capacity = 12

    func image(for iso2: String) -> CGImage? {
        let key = iso2.uppercased()
        if let hit = lock.withLock({ images[key] }) { return hit }
        guard
            let url = FlagCatalog.imageURL(iso2: iso2),
            let source = CGImageSourceCreateWithURL(url as CFURL, nil),
            let image = CGImageSourceCreateImageAtIndex(source, 0, nil)
        else { return nil }
        lock.withLock {
            images[key] = image
            order.append(key)
            if order.count > capacity { images[order.removeFirst()] = nil }
        }
        return image
    }
}
#endif

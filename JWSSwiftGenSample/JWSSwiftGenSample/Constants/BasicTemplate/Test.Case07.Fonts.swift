// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
  typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
  typealias Font = UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

struct FontConvertible {
  let name: String
  let family: String
  let path: String

  func font(size: CGFloat) -> Font! {
    return Font(font: self, size: size)
  }

  func register() {
    guard let url = url else { return }
    var errorRef: Unmanaged<CFError>?
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
  }

  fileprivate var url: URL? {
    let bundle = Bundle(for: BundleToken.self)
    return bundle.url(forResource: path, withExtension: nil)
  }
}

extension Font {
  convenience init!(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable identifier_name line_length type_body_length
enum FontFamily {
  enum SFCompactDisplay {
    static let ultralight = FontConvertible(name: "SFCompactDisplay-Ultralight", family: "SF Compact Display", path: "SFCompactDisplay-Ultralight.otf")
  }
  enum SFCompactText {
    static let italic = FontConvertible(name: "SFCompactText-Italic", family: "SF Compact Text", path: "SFCompactText-RegularItalic.otf")
    static let semibold = FontConvertible(name: "SFCompactText-Semibold", family: "SF Compact Text", path: "SFCompactText-Semibold.otf")
    static let semiboldItalic = FontConvertible(name: "SFCompactText-SemiboldItalic", family: "SF Compact Text", path: "SFCompactText-SemiboldItalic.otf")
  }
  enum SFProDisplay {
    static let blackItalic = FontConvertible(name: "SFProDisplay-BlackItalic", family: "SF Pro Display", path: "SF-Pro-Display-BlackItalic.otf")
    static let heavyItalic = FontConvertible(name: "SFProDisplay-HeavyItalic", family: "SF Pro Display", path: "SF-Pro-Display-HeavyItalic.otf")
    static let light = FontConvertible(name: "SFProDisplay-Light", family: "SF Pro Display", path: "SF-Pro-Display-Light.otf")
    static let lightItalic = FontConvertible(name: "SFProDisplay-LightItalic", family: "SF Pro Display", path: "SF-Pro-Display-LightItalic.otf")
  }
}
// swiftlint:enable identifier_name line_length type_body_length

private final class BundleToken {}

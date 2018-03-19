// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {
  /// test(case01) string 1
  static let testCase01SubIndex01 = L10n.tr("TestCase01Localizable", "test_case01_sub_index01")
  /// test(case01) string 2
  static let testCase01SubIndex02 = L10n.tr("TestCase01Localizable", "test_case01_sub_index02")
  /// test(case01) sample 2
  static let testCase01TitleBottom01 = L10n.tr("TestCase01Localizable", "test_case01_title_bottom01")
  /// test(case01) sample 1
  static let testCase01TitleTop01 = L10n.tr("TestCase01Localizable", "test_case01_title_top01")
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}

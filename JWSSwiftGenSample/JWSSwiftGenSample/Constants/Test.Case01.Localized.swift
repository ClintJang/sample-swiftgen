// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum TestCase01Strings {
  /// test string 1
  static let testCase01SubIndex01 = TestCase01Strings.tr("TestCase01Localizable", "test_case01_sub_index01")
  /// test string 2
  static let testCase01SubIndex02 = TestCase01Strings.tr("TestCase01Localizable", "test_case01_sub_index02")
  /// title sample 2
  static let testCase01TitleBottom01 = TestCase01Strings.tr("TestCase01Localizable", "test_case01_title_bottom01")
  /// title sample 1
  static let testCase01TitleTop01 = TestCase01Strings.tr("TestCase01Localizable", "test_case01_title_top01")
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension TestCase01Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}

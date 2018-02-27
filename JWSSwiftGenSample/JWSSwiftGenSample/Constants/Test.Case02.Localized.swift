// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum TestCase02Strings {
  /// test(case02) string 1
  static let testCase02SubIndex01 = TestCase02Strings.tr("TestCase02Localizable", "test_case02_sub_index01")
  /// test(case02) string 2
  static let testCase02SubIndex02 = TestCase02Strings.tr("TestCase02Localizable", "test_case02_sub_index02")
  /// test(case02) sample 2
  static let testCase02TitleBottom01 = TestCase02Strings.tr("TestCase02Localizable", "test_case02_title_bottom01")
  /// test(case02) sample 1
  static let testCase02TitleTop01 = TestCase02Strings.tr("TestCase02Localizable", "test_case02_title_top01")
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension TestCase02Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}

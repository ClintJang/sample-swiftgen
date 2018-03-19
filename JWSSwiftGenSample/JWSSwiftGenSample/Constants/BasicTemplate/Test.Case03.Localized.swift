// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum TestCase03Strings {
  /// test(case03) string 1
  static let testCase03SubIndex01 = TestCase03Strings.tr("TestCase03Localizable", "test_case03_sub_index01")
  /// test(case03) string 2
  static let testCase03SubIndex02 = TestCase03Strings.tr("TestCase03Localizable", "test_case03_sub_index02")
  /// test(case03) sample 2
  static let testCase03TitleBottom01 = TestCase03Strings.tr("TestCase03Localizable", "test_case03_title_bottom01")
  /// test(case03) sample 1
  static let testCase03TitleTop01 = TestCase03Strings.tr("TestCase03Localizable", "test_case03_title_top01")
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension TestCase03Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}

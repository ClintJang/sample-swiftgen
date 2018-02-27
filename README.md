# sample-swiftgen
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/clintjang/JWSBoltsSwiftSample/blob/master/LICENSE) [![Swift 4](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://swift.org) 
- [SwiftGen](https://github.com/SwiftGen/SwiftGen) : How to use it!!!!

# Development Information
| check version information?!!
<pre>
swiftgen --version
  SwiftGen v5.2.1 (Stencil v0.9.0, StencilSwiftKit v2.3.0, SwiftGenKit v2.1.1)
</pre>
- [Stencil](https://stenciljs.com/) : The magical, reusable web component compiler
- [StencilSwiftKit](https://github.com/SwiftGen/StencilSwiftKit) : StencilSwiftKit is a framework bringing additional Stencil nodes & filters dedicated to Swift code generation.
- [SwiftGenKit](https://github.com/SwiftGen/SwiftGenKit) : This is the framework behind SwiftGen, responsible for parsing various resources and turning them into Stencil contexts.
	- This repository has been merged into the main SwiftGen repository.

# Sample Case 01
The file "Test.Case01.Localized.swift" is a file created by the code generator.
> Download the sample source and modify the "/Resources/TestCase01Localizable.strings" file. Then run the build. This will change the file "/Constants/Test.Case01.Localized.swift".
<pre>
# testing script case 01
swiftgen strings --param enumName=TestStrings "${SRCROOT}/${TARGETNAME}/Resources/TestCase01Localizable.strings" -t structured-swift3 -o "${SRCROOT}/${TARGETNAME}/Constants/Test.Case01.Localized.swift"
</pre>

# Sample Case 02
> testing~ 

# memo
doing..

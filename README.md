# Sample SwiftGen
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

# Install
Before you test, be sure to follow the [link](https://github.com/SwiftGen/SwiftGen) and follow the installation process.
<pre>
ex) 
install

$ brew update
$ brew install swiftgen

confirm
$ swiftgen ...
</pre>

# Sample Case 01
> Download the sample source and modify the "/Resources/TestCase01Localizable.strings" file. Then run the build. This will change the file "/Constants/Test.Case01.Localized.swift".
<pre>
# testing script case 01
swiftgen strings --param enumName=TestCase01Strings "${SRCROOT}/${TARGETNAME}/Resources/TestCase01Localizable.strings" -t structured-swift4 -o "${SRCROOT}/${TARGETNAME}/Constants/Test.Case01.Localized.swift"
</pre>

> Read the [Link(SwiftGen)](https://github.com/SwiftGen/SwiftGen) "Templates bundled with SwiftGen:".
<pre>
A swift2 template, compatible with Swift 2
A swift3 template, compatible with Swift 3
A swift4 template, compatible with Swift 4
Other variants, like flat-swift2/3/4 and structured-swift2/3/4 templates for Strings, etc.
</pre>

# Sample Case 02
> test progressing~ 

# memo
doing..

# Sample SwiftGen
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/clintjang/JWSBoltsSwiftSample/blob/master/LICENSE) [![Swift 4](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://swift.org) 
- [SwiftGen](https://github.com/SwiftGen/SwiftGen) : How to use it!!!!
- SwiftGen is a tool to auto-generate Swift code for resources of your projects, to make them type-safe to use.

# Development Information
| check version information?!!
<pre>
$ swiftgen --version
  SwiftGen v5.2.1 (Stencil v0.9.0, StencilSwiftKit v2.3.0, SwiftGenKit v2.1.1)
</pre>
- [Stencil](https://stenciljs.com/) : The magical, reusable web component compiler
- [StencilSwiftKit](https://github.com/SwiftGen/StencilSwiftKit) : StencilSwiftKit is a framework bringing additional Stencil nodes & filters dedicated to Swift code generation.
- [SwiftGenKit](https://github.com/SwiftGen/SwiftGenKit) : This is the framework behind SwiftGen, responsible for parsing various resources and turning them into Stencil contexts.
	- This repository has been merged into the main SwiftGen repository.

# Installation
Before you test, be sure to follow the [link](https://github.com/SwiftGen/SwiftGen) and follow the installation process.
<pre>
ex) 
install

$ brew update
$ brew install swiftgen

confirm
$ swiftgen ...
</pre>

# Samples 
> Download the sample source and modify the "/Resources/TestCase0?Localizable.strings" file. Then run the build. This will change the file "/Constants/Test.Case0?.Localized.swift".
> - The sample source has been built to be build at build time, but you can run the script separately in a real project.

<table style="width:100%">
  <tr>
	<th>Script Setting<br>(Target >> Bulid Phases Tap >> + Button Click >> New Run Script Phase)</th> 
  </tr>
  <tr>
  	<td><img width="563" height="274" src="/Image/script_setting.png"></img></td>
  </tr>
</table>
- You can create a **** .sh file later and run it.

## Case 01
Let's build it!
<pre>
Script..

# testing script case 01
swiftgen strings "${SRCROOT}/${TARGETNAME}/Resources/TestCase01Localizable.strings" --template structured-swift4 --output "${SRCROOT}/${TARGETNAME}/Constants/Test.Case01.Localized.swift"
</pre>

> Read the [Link(SwiftGen)](https://github.com/SwiftGen/SwiftGen) "Templates bundled with SwiftGen:".
<pre>
A swift2 template, compatible with Swift 2
A swift3 template, compatible with Swift 3
A swift4 template, compatible with Swift 4
Other variants, like flat-swift2/3/4 and structured-swift2/3/4 templates for Strings, etc.
</pre>
### result
- file link : .. /Constants/[Test.Case01.Localized.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/Test.Case01.Localized.swift)

## Case 02
Define the naming of the enum yourself, and abbreviate the command.
- add : --param enumName=TestCase02Strings
- modify : --output => -o
- modify : --template => -t

<pre>
Script..

# testing script case 02
swiftgen strings --param enumName=TestCase02Strings "${SRCROOT}/${TARGETNAME}/Resources/TestCase02Localizable.strings" -t structured-swift4 -o "${SRCROOT}/${TARGETNAME}/Constants/Test.Case02.Localized.swift"
</pre>
### result
- file link : .. /Constants/[Test.Case02.Localized.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/Test.Case02.Localized.swift)

## Case 03
Add localization
- modify : ../Resources/.. => ../Resources/Base.lproj/..
<table style="width:100%">
  <tr>
	<th>difference point</th> 
  </tr>
  <tr>
  	<td><img width="282" height="137" src="/Image/Localizable.png"></img></td>
  </tr>
</table>

<pre>
Script.. 

# testing script case 03
swiftgen strings --param enumName=TestCase03Strings "${SRCROOT}/${TARGETNAME}/Resources/Base.lproj/TestCase03Localizable.strings" -t structured-swift4 -o "${SRCROOT}/${TARGETNAME}/Constants/Test.Case03.Localized.swift"
</pre>

### result
- file link : .. /Constants/[Test.Case03.Localized.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/Test.Case03.Localized.swift)

## Case 04
> doing it.

# memo
It's a bit difficult ... but ..

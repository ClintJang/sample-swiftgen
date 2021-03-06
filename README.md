# Sample SwiftGen
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/clintjang/JWSBoltsSwiftSample/blob/master/LICENSE) [![Swift 4](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://swift.org) 
- [SwiftGen](https://github.com/SwiftGen/SwiftGen) : How to use it!!!!
- SwiftGen is **a tool to auto-generate Swift code for resources** of your projects, to make them type-safe to use.
- [한국어 설명 링크](https://github.com/ClintJang/sample-swiftgen/blob/master/READMEKO.md) : Sample description in Korean

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
```
ex) 
install

$ brew update
$ brew install swiftgen

confirm
$ swiftgen ...
```

# Samples (Base Template)
> Download the sample source and modify the "/Resources/TestCase0?Localizable.strings" file. Then run the build. This will change the file "/Constants/Test.Case0?.Localized.swift".

<table style="width:100%">
  <tr>
	<th>Script Setting<br>(Target >> Bulid Phases Tap >> + Button Click >> New Run Script Phase)</th> 
    <th>Base Template Detail</th> 
  </tr>
  <tr>
  	<td><img width="382" height="196" src="/Image/script_setting00.png"></img></td>
    <td><img width="424" height="353" src="/Image/script_setting01.png"></img></td>
  </tr>
</table>

- You can create a **** .sh file later and run it.
- Now let 's test the basics of 5 things!
	- swiftgen strings [OPTIONS] FILE1 …
	- swiftgen storyboards [OPTIONS] DIR1 …
	- swiftgen xcassets [OPTIONS] CATALOG1 …
	- swiftgen colors [OPTIONS] FILE1 …
	- swiftgen fonts [OPTIONS] DIR1 …
	
## Case 01 ~ 07 : Test results
<table style="width:100%">
  <tr>
  	<td><img width="251" height="494" src="/Image/use_case_00.png"></img></td>
  </tr>
</table>

- ViewController.swift
```swift
override func viewDidLoad() {
        super.viewDidLoad()
        
        testSamplesBaseTemplates()
    }

    func testSamplesBaseTemplates() {
        // Case 01 : String
        case01Label.text = L10n.testCase01TitleTop01
        
        // Case 02 : String
        case02Label.text = TestCase02Strings.testCase02TitleTop01
        
        // Case 03 : String
        case03Label.text = TestCase03Strings.testCase03TitleBottom01
        
        // Case 04 : Storyboard
        // Pass
        
        // Case 05-1 : Assets
        //        let swiftGenSample01Image = UIImage(asset: Asset.imageSwiftGenSample01)
        let swiftGenSample01Image = Asset.imageSwiftGenSample01.image
        case0501ImageView.image = swiftGenSample01Image
        debugPrint(Asset.allImages)
        
        //        case0502Label.textColor = UIColor(asset: Asset.test01Color)
        case0502Label.textColor = Asset.test01Color.color
        debugPrint(Asset.allColors)
        
        // Case 06 : Colors
        //        case06Label.textColor = Color(named:ColorName.articleBody)
        case06Label.textColor = ColorName.articleBody.color
        
        // Case 07 : Fonts
        //        case06Label.font = UIFont(font: FontFamily.SFCompactDisplay.ultralight, size: 30.0)
        case07Label.font = UIFont(font: FontFamily.SFProDisplay.blackItalic, size: 30.0)
    }
```

> Let's look at the details.

## Case 01 : String
Let's build it!
- resource file : [TestCase01Localizable.strings](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Resources/TestCase01Localizable.strings)

<pre>
Script..

# testing script case 01
swiftgen strings "${SRCROOT}/${TARGETNAME}/Resources/TestCase01Localizable.strings" --template structured-swift4 --output "${SRCROOT}/${TARGETNAME}/Constants/BasicTemplate/Test.Case01.Localized.swift"
</pre>

> Read the [Link(SwiftGen)](https://github.com/SwiftGen/SwiftGen) "Templates bundled with SwiftGen:".
<pre>
A swift2 template, compatible with Swift 2
A swift3 template, compatible with Swift 3
A swift4 template, compatible with Swift 4
Other variants, like flat-swift2/3/4 and structured-swift2/3/4 templates for Strings, etc.
</pre>
### result
- file link : .. /Constants/BasicTemplate/[Test.Case01.Localized.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case01.Localized.swift)

## Case 02 : String
Define the naming of the enum yourself, and abbreviate the command.
- add : --param enumName=TestCase02Strings
- modify : --output => -o
- modify : --template => -t

<pre>
Script..

# testing script case 02
swiftgen strings --param enumName=TestCase02Strings "${SRCROOT}/${TARGETNAME}/Resources/TestCase02Localizable.strings" -t structured-swift4 -o "${SRCROOT}/${TARGETNAME}/Constants/BasicTemplate/Test.Case02.Localized.swift"
</pre>
### result
- file link : .. /Constants/BasicTemplate/[Test.Case02.Localized.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case02.Localized.swift)

## Case 03 : String
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
swiftgen strings --param enumName=TestCase03Strings "${SRCROOT}/${TARGETNAME}/Resources/Base.lproj/TestCase03Localizable.strings" -t structured-swift4 -o "${SRCROOT}/${TARGETNAME}/Constants/BasicTemplate/Test.Case03.Localized.swift"
</pre>

### result
- file link : .. /Constants/BasicTemplate/[Test.Case03.Localized.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case03.Localized.swift)

## Case 04 : StoryBoard
> Storyboards are a little different but similar.
<pre>
Script.. 

# testing script case 04
swiftgen storyboards -t swift4 "${SRCROOT}/${TARGETNAME}/Base.lproj/Main.storyboard" -o "${SRCROOT}/${TARGETNAME}/Constants/BasicTemplate/Test.Case04.Storyboards.swift"
</pre>

### result
- file link : .. /Constants/BasicTemplate/[Test.Case04.Storyboards.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case04.Storyboards.swift)

## Case 05 : Xcassets
> Let's try Xcassets!

<pre>
Script.. 

# testing script case 05
swiftgen xcassets "${SRCROOT}/${TARGETNAME}/Assets.xcassets" -t swift4 -o "${SRCROOT}/${TARGETNAME}/Constants/BasicTemplate/Test.Case05.Xcassets.swift"
</pre>

### result
- file link : .. /Constants/BasicTemplate/[Test.Case05.Xcassets.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case05.Xcassets.swift)

## Case 06 : Colors
> I added color samples. However, you can add color in xcassets. It will then be added to the output of case 5.
>> https://github.com/SwiftGen/SwiftGen/issues/315

- add file (colors.txt)
<table style="width:100%">
  <tr>
	<th>add colors.txt</th> 
  </tr>
  <tr>
  	<td><img width="615" height="337" src="/Image/case6_color.png"></img></td>
  </tr>
</table>

<pre>
Script.. 

# testing script case 06
swiftgen colors -t swift4 "${SRCROOT}/${TARGETNAME}/Resources/colors.txt"  -o "${SRCROOT}/${TARGETNAME}/Constants/BasicTemplate/Test.Case06.Colors.swift"
</pre>

### result
- file link : .. /Constants/BasicTemplate/[Test.Case06.Colors.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case06.Colors.swift)

## Case 07 : Fonts
> I added some of the font files from Apple, and tried to code-generate the fonts in that path into files.

- add fonts file (in "Font" folder)
<table style="width:100%">
  <tr>
	<th>add fonts file</th> 
  </tr>
  <tr>
  	<td><img width="275" height="329" src="/Image/case7_fonts.png"></img></td>
  </tr>
</table>

<pre>
Script.. 

# testing script case 07
# https://developer.apple.com/fonts/
swiftgen fonts -t swift4 "${SRCROOT}/${TARGETNAME}/Resources/Font"  -o "${SRCROOT}/${TARGETNAME}/Constants/BasicTemplate/Test.Case07.Fonts.swift"
</pre>

### result
- file link : .. /Constants/BasicTemplate/[Test.Case07.Fonts.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case07.Fonts.swift)


# Samples (User Custom, Use of Stencil)
> Let's create a file that you want to make.


- What is Stencil? : https://stencil.fuller.li/en/latest/
<pre>
The Stencil template language

Stencil is a simple and powerful template language for Swift. 
It provides a syntax similar to Django and Mustache. 
If you’re familiar with these, 
you will feel right at home with Stencil.
</pre>

- You only need to know how to use it, and you can use Stencil by default.
- Take a look at the use cases below.

## How do I customize it?
- If you know the grammar, how can you customize it? That way, you can click the link below to get the template source. This can be analyzed and corrected.
> https://github.com/SwiftGen/SwiftGen/tree/master/templates

## Case 01 : String, Objective-C?
> What if you want to make it an Objective-C source? Let's try it.

- I tried to make it #define simply. :)

<pre>
Script.. 

# testing script case 01
swiftgen strings "${SRCROOT}/${TARGETNAME}/Resources/TestCase01Localizable.strings" --templatePath ${SRCROOT}/swiftgen/StencilTemplates/Localization/objLocalization.stencil --output "${SRCROOT}/${TARGETNAME}/Constants/CustomTemplate/Test.Custom.Case01.Localized.h"
</pre>

- objLocalization.stencil
<pre>
{% if tables.count > 0 %}

{# You can modify the value below with the actual value. #}
{% macro recursiveBlock table item sp %}
{{sp}}  {% for string in item.strings %}
{{sp}}  {% if not param.noComments %}
{{sp}}  /// {{string.translation}}
{{sp}}  #define {{string.name}} "{{string.key}}"
{{sp}}  {% endif %}
{{sp}}  {% if not param.noComments %}
{{sp}}  /// LOG : {{string}}
{{sp}}  {% endif %}
{{sp}}  {% endfor %}
{% endmacro %}

{# print #}
{% call recursiveBlock tables.first.name tables.first.levels "" %}

{% else %}
// No string found
{% endif %}
</pre>

### result
- file link : .. /Constants/CustomTemplate/[Test.Custom.Case01.Localized.h](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/CustomTemplate/Test.Custom.Case01.Localized.h)

<pre>
  /// test(case01) string 1
  #define test_case01_sub_index01 "test_case01_sub_index01"
  /// LOG : ["translation": "test(case01) string 1", "name": "test_case01_sub_index01", "key": "test_case01_sub_index01"]
  /// test(case01) string 2
  #define test_case01_sub_index02 "test_case01_sub_index02"
  /// LOG : ["translation": "test(case01) string 2", "name": "test_case01_sub_index02", "key": "test_case01_sub_index02"]
  /// test(case01) sample 2
  #define test_case01_title_bottom01 "test_case01_title_bottom01"
  /// LOG : ["translation": "test(case01) sample 2", "name": "test_case01_title_bottom01", "key": "test_case01_title_bottom01"]
  /// test(case01) sample 1
  #define test_case01_title_top01 "test_case01_title_top01"
  /// LOG : ["translation": "test(case01) sample 1", "name": "test_case01_title_top01", "key": "test_case01_title_top01"]
</pre>


## Case 02 : String
> Want to make your default template look different?

.. doing it.


# Conclusion
> Why not try it?

> You can also manage it by running it as a script command from the shell separately.

- [iOSSampleApp] (https://github.com/igorkulman/iOSSampleApp) In this way, a single project can be packaged.
- Thank you.
	- I will try to make some more samples

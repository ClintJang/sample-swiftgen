# Sample SwiftGen
[![License](http://img.shields.io/badge/License-MIT-green.svg?style=flat)](https://github.com/clintjang/JWSBoltsSwiftSample/blob/master/LICENSE) [![Swift 4](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://swift.org) 
> SwiftGen은 코드를 자동으로 만들어줍니다.!! 한번 익히면 편리해요~
- [SwiftGen](https://github.com/SwiftGen/SwiftGen) : 어떻게 사용하는 것일까요? 라이브러리 링크는 클릭하시면 됩니다.
- SwiftGen은 auto-generate 됩니다. 우리의 소스를 안전한 유형으로 자동으로 변경해 주어서 작업 노가다?를 줄이면서 타입의 안정성을 보장해 주는 도구입니다.

# 개발하기에 앞서서 버전을 확인해보았습니다.
| 버전 정보를 보니 특별한 것이 있습니다. 하나의 라이브러리에 3가지 라이브러리 정보가 표시가 되네요. !!!
<pre>
$ swiftgen --version
  SwiftGen v5.2.1 (Stencil v0.9.0, StencilSwiftKit v2.3.0, SwiftGenKit v2.1.1)
</pre>
- [Stencil](https://stenciljs.com/) : 스텐실은.. magical!, reusable!! 이라하네요. 매직컬하게 재사용이 가능한 웹 컴퍼넌트 컴파일러라고 합니다.
- [StencilSwiftKit](https://github.com/SwiftGen/StencilSwiftKit) : Swift 코드 생성 전용 스텐실 노드와 필터들을 추가로 가져 오는 프레임 워크입니다.
- [SwiftGenKit](https://github.com/SwiftGen/SwiftGenKit) : SwiftGen의 프레임 워크로 다양한 리소스를 분석해서 스텐실 컨텍스트로 변환합니다.
	- 이 저장소는 기본 SwiftGen 저장소에 병합되었다고 합니다.

# 설치 방법은?
[link](https://github.com/SwiftGen/SwiftGen)를 클릭해서 "Installation"부분을 참고 하세요. 간단하게는 아래의 내용대로 하시면 됩니다. (제가 한 방법이죠)
<pre>
ex) 
install

$ brew update
$ brew install swiftgen

confirm
$ swiftgen ...
</pre>

# 이해는 뭐니뭐니해도 셈플이지요~
> 우선 기본 템플릿으로 만들어 보며 사용법을 익혀보고, 그 이후에 스텐실을 이용해서 내가 원하는 템플릿 파일을 만드는 방법에 대해 알아보려고 합니다.

# 기본 셈플 (기본 지원되는 템플릿으로 연습해보기)
> 샘플 소스를 다운로드하고 "/Resources/TestCase0?Localizable.strings"파일을 수정하십시오. 그런 다음 빌드를 실행하십시오. 그러면 "/Constants/Test.Case0 ?.Localized.swift"파일이 변경됩니다.
- 여러 케이스를 만들었습니다. Resources 가 되는 부분의 내용을 수정해보거나, 결과 파일을 실제 폴더에서 지우고 빌드도 해보며, 자동 생성되는 것을 익혀봅시다.

<table style="width:100%">
  <tr>
	<th>스크립트 셋팅 방법<br>(Target >> Bulid Phases Tap >> + Button Click >> New Run Script Phase)</th> 
    <th>기본 제공되는 템플릿을 여기서 셋팅했습니다.</th> 
  </tr>
  <tr>
  	<td><img width="382" height="196" src="/Image/script_setting00.png"></img></td>
    <td><img width="424" height="353" src="/Image/script_setting01.png"></img></td>
  </tr>
</table>

- "****.sh" 파일을 생성해서 그것을 실행 시키게 한다든지, 다양한 방법이 있습니다. 
- 기본적으로 5가지 제공되는 템플릿이 있습니다.
	1. 스트링(혹은 로컬라이제이션) : swiftgen strings [OPTIONS] FILE1 …
	2. 스토리보드 : swiftgen storyboards [OPTIONS] DIR1 …
	3. xcassets에 설정한 것들(주로 이미지) : swiftgen xcassets [OPTIONS] CATALOG1 …
	4. 색상정보 : swiftgen colors [OPTIONS] FILE1 …
	5. 추가한 폰트 : swiftgen fonts [OPTIONS] DIR1 …
	
## 7가지 경우의 테스트를 진행하였고, 7개 전체 설정은 아래와 같습니다.
> 개별 테스트한 경우는 스크롤 하시면 더~ 아래에 있습니다.

<table style="width:100%">
  <tr>
  	<td><img width="251" height="494" src="/Image/use_case_00.png"></img></td>
  </tr>
</table>

- ViewController.swift
<pre>
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
</pre>

> 자세한 내용을 살펴볼까요?

## Case 01 : String
TestCase01Localizable.strings을 셋팅하고 기본적인 스크립트를 실행했습니다.

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
### 결과
- file link : .. /Constants/BasicTemplate/[Test.Case01.Localized.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case01.Localized.swift)

## Case 02 : String
열거 형의 이름을 직접 정의하고 커멘드를 좀 줄여보았습니다.
Define the naming of the enum yourself, and abbreviate the command.
- 추가된 부분 : --param enumName=TestCase02Strings
- 수정된 부분 1 : --output => -o
- 수정된 부분 2 : --template => -t

<pre>
Script..

# testing script case 02
swiftgen strings --param enumName=TestCase02Strings "${SRCROOT}/${TARGETNAME}/Resources/TestCase02Localizable.strings" -t structured-swift4 -o "${SRCROOT}/${TARGETNAME}/Constants/BasicTemplate/Test.Case02.Localized.swift"
</pre>
### 결과
- file link : .. /Constants/BasicTemplate/[Test.Case02.Localized.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case02.Localized.swift)

## Case 03 : String
localization 설정을 해볼까요? 이것도 잘되는 지 확인해봅니다.
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

### 결과
- file link : .. /Constants/BasicTemplate/[Test.Case03.Localized.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case03.Localized.swift)

## Case 04 : StoryBoard
> 스토리 보드는 약간 다르지만 비슷합니다.
<pre>
Script.. 

# testing script case 04
swiftgen storyboards -t swift4 "${SRCROOT}/${TARGETNAME}/Base.lproj/Main.storyboard" -o "${SRCROOT}/${TARGETNAME}/Constants/BasicTemplate/Test.Case04.Storyboards.swift"
</pre>

### 결과
- file link : .. /Constants/BasicTemplate/[Test.Case04.Storyboards.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case04.Storyboards.swift)

## Case 05 : Xcassets
> 이번에는 Xcassets을 테스트 해볼까요?

<pre>
Script.. 

# testing script case 05
swiftgen xcassets "${SRCROOT}/${TARGETNAME}/Assets.xcassets" -t swift4 -o "${SRCROOT}/${TARGETNAME}/Constants/BasicTemplate/Test.Case05.Xcassets.swift"
</pre>

### 결과
- file link : .. /Constants/BasicTemplate/[Test.Case05.Xcassets.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case05.Xcassets.swift)

## Case 06 : Colors
> 셈플 컬러 파일을 아래와 같이 추가했습니다. 물론 "xcassets" 안에 컬러를 추가할 수도 있어요. 앞에 케이스에서 New Color를 하면 되고, 실제로 하나 추가해봤어요. 그 부분도 Case 05 결과를 보실때 확인해 보셔요~
>> https://github.com/SwiftGen/SwiftGen/issues/315

- 파일 추가 (colors.txt)
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

### 결과
- file link : .. /Constants/BasicTemplate/[Test.Case06.Colors.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case06.Colors.swift)

## Case 07 : Fonts
> Apple의 글꼴 파일 중 일부를 추가하였고, 해당 경로의 글꼴을 파일로 코드 생성하려고 했습니다. 진행사항입니다.

- 추가한 폰트 파일 ("Font" 폴더 안에 넣었습니다.)
<table style="width:100%">
  <tr>
	<th>폰트 파일 추가</th> 
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

### 결과
- file link : .. /Constants/BasicTemplate/[Test.Case07.Fonts.swift](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/BasicTemplate/Test.Case07.Fonts.swift)


# Stencil(스탠실) 스크립트 소스를 수정해서 샘플 만들어보기 
> 이제 우리 개발자가 원하는 포멧으로 수정해볼까요?


- Stencil은 무엇입니까? : https://stencil.fuller.li/en/latest/
<pre>
The Stencil template language

Stencil is a simple and powerful template language for Swift. 
It provides a syntax similar to Django and Mustache. 
If you’re familiar with these, 
you will feel right at home with Stencil.
</pre>

- 사용법 만 알아두면 스텐실을 기본적으로 사용할 수 있습니다.
- 아래의 테스트 케이스를 살펴 볼까요?

## 사용자 정의를 처음에 어떻게 접근할까요?
- 문법은 스크립트라 개발자 이시라면 생각보다 어렵지 않으실 것입니다.
- 그리고 저의 접근은 아래 링크를 이용해서 수정하는 것입니다.
> https://github.com/SwiftGen/SwiftGen/tree/master/templates
- SwiftGen의 기본 템플릿을 생성하는 스텐실 파일들이 들어있습니다. 그 안의 파일을 하나 가져와서 그걸 기반으로 조금씩 조금씩 제거하거나 다른 내용을 넣어보면서 테스트 해보면, 접근하기 쉬울 것입니다.

## Case 01 : String, Objective-C 소스를 만들수 있을까요?
> Objective-C에서 필요한 파일을 만들 수 있을까요? 확장자가 ".h"이며 #define 으로 정의된 내용들이 있는 파일을 만들어보고 싶었습니다. 가능할까요?

- 시도해보겠습니다. :)

<pre>
Script.. 

# testing script case 01
swiftgen strings "${SRCROOT}/${TARGETNAME}/Resources/TestCase01Localizable.strings" --templatePath ${SRCROOT}/swiftgen/StencilTemplates/Localization/objLocalization.stencil --output "${SRCROOT}/${TARGETNAME}/Constants/CustomTemplate/Test.Custom.Case01.Localized.h"
</pre>

- [flat-swift4.stencil](https://github.com/SwiftGen/SwiftGen/blob/master/templates/strings/flat-swift4.stencil) : 수정전 참고한 파일
- objLocalization.stencil : 생성한 파일
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

### 결과
- file link : .. /Constants/CustomTemplate/[Test.Custom.Case01.Localized.h](https://github.com/ClintJang/sample-swiftgen/blob/master/JWSSwiftGenSample/JWSSwiftGenSample/Constants/CustomTemplate/Test.Custom.Case01.Localized.h)

- 아래와 같습니다.
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

- 충분히 할만합니다.

## Case 02 : String
> 기본 템플릿을 보다 다르게 보이게 하려 합니다. 흠.. 무엇을 만들어 볼지 생각해보지 못했네요. 

.. 편리한 것을 만들어보려 합니다. (생각중.. 고민중.. 뭘 만들어보지..)



# 결론
> 현재 외국이나 앞서가는 개발업체들은 SwiftGen을 이용해서 개발 효율을 높이고 있는 것 같습니다. 한번 사용해 보시면 어떨까요?

> 만약 빌드때 느리다면, 빌드시점에서 사용하지 않고, 수정이 있을 때, 별도로 쉘에서 스크립트 명령어로 실행하는 식으로 관리할 수도 있습니다. 어짜피 자산 파일들은 자주 변경되는 부분은 아니니깐요.

- [iOSSampleApp](https://github.com/igorkulman/iOSSampleApp) 이런 식으로 하나의 프로젝트 단위 패키지 화가 가능합니다.
- 감사합니다. 
	- 시간이 되면 조금더 셈플을 만들어 보겠습니다.
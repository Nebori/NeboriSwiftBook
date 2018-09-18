//: [Previous](@previous)

/*:
 # Value
 안녕하세요 Nebori입니다.
 이번 챕터에서는 Swift에서 다루는 값에 대해서 알아보려고 합니다.
 아래 내용을 잘 확인해주세요. 바로 시작합니다.
 */
import Foundation
/*:
 # 참 / 거짓
 타입의 이름은 'Bool'입니다.
 */
var trueValue = true
var falseValue = false
/*:
 # 숫자
 정수나 실수를 표현할 수 있는 타입은 많지만,
 우선 간단하게 하나씩만 예로 들겠습니다.
 */
//: 정수
var intValue = 100
//: 실수
var floatValue = 1.1
/*:
 # 문자
 타입의 이름은 `String`입니다.
 */
var stringValue = "문자"
var multiLineValue = """
    이런 식으로도 문자열을 사용할 수 있습니다.
    다수 라인인 경우 이렇게 사용해보세요.
"""
var sumValue = "이렇게" + "합칠 수도 있습니다."
//: 아쉽지만 문자열로된 숫자는 더해지지 않습니다.
//: 아래의 결과는 문자열 "12"가 됩니다.
var issueValue = "1" + "2"
/*:
 # 범위
 Swift에서 재미있는 부분이라고 생각되는 범위 타입입니다.
 Obj-C를 사용해보셨다면 NSRange를 기억하실껍니다. 이제는 다른 방식으로 표현이 가능합니다.
 규칙성 있는 문자도 범위로 지정할 수 있습니다.
 */
var closedRange = 1...100       // 1부터 100까지
var halfOpenRange = 1..<100     // 1부터 100미만 까지
var sideRange = ...10           // 10까지
var floatRange = 1.1...10.1     // 1.1부터 10.1까지
var charRange = "a"..."f"       // a부터 f까지

/*:
 # 값으로 놀아보기
 */
//: 연산
1+1
8-3
//: 다른 타입과는 연산 불가능 (에러나는 부분은 주석 처리)
// Binary operator '-' cannot be applied to operands of type 'Int' and 'String'
// 10-"문자열"

/*:
 ## 변수
 변수는 값을 담아놓는 저장 공간입니다.
 지금은 'var'을 이용해서 변수를 만들어보도록 하겠습니다.
 변수에 '=' 기호를 이용해서 값을 담을 수 있고, 'var'로 선언된 변수는 값을 변경할 수 있습니다.
 */
var valuable = 10
valuable = 100
//: 이미 위에서 'valuable'변수는 Int형 값을 담았기때문에 아래와 같이 다른 타입의 값은 담을 수가 없습니다.
// error: cannot assign value of type 'String' to type 'Int'
// valuable = "갑자기 문자열"
//: 예약어도 변수명으로 사용할 수 있습니다. 하지만 권장하는 방법이 아닙니다. 헷갈리기 쉽기 때문이죠.
var `let` = "let"

/*:
 ### 타입 설정
 변수는 선언 시에 타입을 같이 설정해줄 수 있습니다.
 타입 설정방법은 변수 이름 뒤에 ':' (콜론)을 사용해서 타입을 지정하면 됩니다. 아래 예시를 볼까요?
 */
var typeFixed: String = "타입을 지정했어요."

/*:
 타입 선언을 생략하면 어떻게 될까요? 저희가 계속 사용한 방법입니다. 왜 에러가 발생하지 않았을까요?
 바로 대입되는 값에서 추론하여 타입을 지정하기 때문입니다.
 아래 'typeNoneFix'의 경우에는 100을 대입하면 'Int'타입을 가지게 됩니다.
 */
var typeNoneFix = 100

/*:
 이제 에러가 나는 상황을 알아볼까요?
 타입을 지정하고 지정한 타입이 아닌 다른 값을 넣으면 에러가 발생합니다.
 */
// error: cannot convert value of type 'Int' to specified type 'String'
// var errTypeFixed: String = 100

/*:
 하지만 바로 초기값을 대입하지 못하는 경우도 있습니다.
 그런 경우에는 타입 추론을 할 수 없게되고, 결국 에러를 발생시킵니다.
 이런 경우는 어떻게 해야할까요?
 바로 타입을 지정해주면 작동이 가능합니다.
 */
// error: type annotation missing in pattern
// var noneType
var noneInitValue: Int
noneInitValue = 100

/*:
 ## 상수
 이제는 상수를 알아보겠습니다.
 상수는 변하지 않는 값으로 'let'을 통해서 선언할 수 있습니다.
 상수로 선언된 값은 변경이 불가능하므로 변경 할 일이 없는 값을 상수로 지정해야합니다.
 예를들면, 1년은 몇 달인지? 하루는 몇 시간인지? 나타낼 때 상수를 활용할 수 있습니다.
 */
let month: Int = 12
let language: String = "Swift"
//: 천지개벽해도 'let'으로 선언된 상수는 값을 바꿀 수 없습니다.
// error: cannot assign to value: 'month' is a 'let' constant
// month = 10

/*:
 해당 챕터에서는 스위프트에서 값을 다루는 방법을 알아보았습니다.
 위 내용이 가장 기본적으로 사용하는 변수, 상수 사용방법이므로 잘 알아두시기를 권장합니다.
 */

//: [Next](@next)

//: [Previous](@previous)

/*:
 # Type
 
 안녕하세요. 이번 챕터에서는 Swift에서 사용하는 데이터 타입에 대해서 알아보려고 합니다.
 오늘도 역시 아래 내용을 잘 확인해주세요. 시작하겠습니다.
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.
 
 데이터 타입은 크게 3가지로 나누어 볼 수 있습니다.
 
 - 기본 제공 타입
 - 다수의 값을 다루는 타입
 - 사용자 타입
 
 하나씩 알아보도록 합니다.
 ****
 ## 기본 제공 타입
 - 참/거짓: Bool
 - 정수: Int, UInt
 - 실수: Float, Double
 - 문자, 문자열: Character, String
 */
import Foundation

/*:
 ### 참 / 거짓
 부울은 다룰 수 있는 값은 `true`, `false` 두 가지 입니다.
 아래는 부울 값 대입 예시입니다.
 */
let boolExam: Bool = true

/*:
 부울 타입의 경우 비교에 가장 많이 사용합니다.
 예를들어 1과 1이 같느냐? 1과 2가 같느냐?를 물어 각각 `true`, `false` 값을 얻을 수 있죠.
 */
let isTrueBool: Bool = 1 == 1
let isFalseBool: Bool = 1 == 2

/*:
 ### 정수
 정수는 두 가지의 타입을 가지고 있습니다.
 - Int: 음수와 정수
 - UInt: 0 이상의 정수
 바로 예시로 넘어가서 보여드리겠습니다.
 */
let signedInt: Int = -100
//: UInt는 음수를 담으려고 시도하면 에러를 발생시킵니다.
// error: negative integer '-100' overflows when stored into unsigned type 'UInt'
// let unsigned: UInt = -100
//: 여기서 알고있어야 할 점 한가지는 정수 타입의 경우에는 타입 지정을 하지 않을경우 `Int`타입으로 자동 인식합니다.

/*:
 #### 정수 타입의 크기
 정수는 타입을 타입 뒤에 비트를 적어 크기를 지정할 수 있습니다.
 `타입.max`, `타입.min`으로 해당 타입의 최대, 최소값을 대입할 수 있습니다.
 해당 비트수 지정은 환경이 32비트일 때, 64비트일 때 나눠서 코드를 작성할 수 있겠죠?
 아래는 정수 비트별로 다룰 수 있는 최대 값을 넣는 예시입니다.
 */
let signedInt01: Int8 = Int8.max
let signedInt02: Int16 = Int16.max
let sigendInt03: Int32 = Int32.max
let sigendInt04: Int64 = Int64.max

/*:
 #### 정수로 변환하기 (캐스팅)
 정수로 변환하는 예시는 바로 코드로 들어가겠습니다.
 */
let castingInt01 = Int("12345")
// 아래의 경우 실수를 정수로 바꾸면서 소수점 이하를 잃는 값 손실이 있을 수 있습니다.
let castingInt02 = Int(1.2345)

/*:
 다음은 변환이 실패하는 코드입니다.
 아래 예시의 경우는 에러는 발생하지 않지만 `failCastingInt01`가 nil 값을 가지게 됩니다.
 nil은 다른 언어에서 null과 비슷한 값으로 생각하시면 됩니다.
 */
let failCastingInt01 = Int("이런 문자인 경우는 nil을 반환합니다.")

/*:
 #### 정수 타입에서 에러가 발생하는 경우
 `Int8`타입의 경우 -128 ~ 127까지 다룰 수 있는 정수 타입입니다.
 이 타입의 변수에 다룰 수 있는 범위를 넘는 값을 넘기면 어떻게 될까요?
 */
// error: integer literal '200' overflows when stored into 'Int8'
//let overflowInt01: Int8 = 200

/*:
 다음으로 정수와 정수를 연산하는데 에러가 날 수 있을까요? 범위를 넘지 않는데!
 네. 날 수 있습니다. 아래를 확인해주세요.
 */
let int8Value: Int8 = 1
let int16Value: Int16 = 1
// error: binary operator '+' cannot be applied to operands of type 'Int8' and 'Int16'
// let typeErrorInt01 = int8Value + int16Value

/*:
 ### 실수
 실수는 두 가지 타입을 가지고 있습니다.
 - Float
 - Double
 여기서, 타입 지정을 생략할 경우 자동으로 `Double`타입으로 지정됩니다.
 */
let floatValue01: Float = 1.2345
// 아래의 타입은 Double입니다.
let doubleValue01 = 1.2345

/*:
 실수 역시 타입을 혼합해서는 연산할 수 없습니다.
 타입 변환을 통해서는 가능합니다.
 */
let sumValue = Double(floatValue01) + doubleValue01

/*:
 ### 문자와 문자열
 - 문자: Character
 - 문자열: String
 */

/*:
 #### 문자
 문자는 `'` 작은 따옴표로 지정할 경우에 문자로 인식하는 언어들이 있습니다.
 Swift의 경우에는 문자열과 동일하게 `"` 큰 따옴표로 지정하되, 1개의 문자만 입력하면 문자로 인식됩니다.
 */
// error: single-quoted string literal found, use '"'
// let charValue01: Character = 'a'
// error: cannot convert value of type 'String' to specified type 'Character'
// let charValue03: Character = "abcdefg"
// 아래의 경우에만 제대로 선언됩니다.
let charValue02: Character = "a"

/*:
 ##### 문자의 비교
 문자의 비교는 비교 연산자를 사용하면 가능합니다.
 */
let charValue04: Character = "a"
let isTrueValue01 = charValue04 == "a"
let isFalseValue01 = charValue04 != "a"

/*:
 ### 문자열
 문자열은 `"` 큰 따옴표를 사용하면 자동으로 문자열로 인식됩니다.
 바로 코드로 보여드리겠습니다.
 */
let stringValue01: String = "이건 문자열이에요."
let stringValue02 = "이렇게 만들어도 타입 추론에 의해 문자열로 인식돼요."

/*:
 아래와 같이 문자열 내에 바로 변수를 삽입해서 표현도 가능합니다.
 일반적으로 문자열을 합칠 때 보다 훨씬 섬세하게 결합이 가능하죠.
 */
let partString01: String = "네보리"
let partString02: String = "반가워요!"
let string03: String = "저는 \(partString01)에요. 정말 \(partString02)"

/*:
 #### 문자열로 변환하기 (캐스팅)
 문자열로 변환하는 방법은 코드로 보여드리겠습니다.
 */
let castingString01 = String(12345)
let castingString02 = String(true)

/*:
 ##### 문자열의 비교
 문자열의 비교도 비교 연산자를 사용하면 가능합니다.
 */
let stringValue03: String = "abcd"
let isTrueValue = stringValue03 == "abcd"
let isFalseValue = stringValue03 != "abcd"
/*:
 문자열은 비교하는 메서드가 존재합니다.
 `compare`라는 메서드인데요.
 간단한 사용 방법은 아래 있습니다.
 */
let stringValue04 = "b"
let result = stringValue04.compare("a")
if result == .orderedSame {
    // 완전히 같습니다.
    print("same")
} else if result == .orderedAscending {
    // 호출한 문자열이 더 작습니다.
    print("ascending")
} else if result == .orderedDescending {
    // 호출한 문자열이 더 큽니다.
    // 위 결과는 이곳으로 들어오게 됩니다.
    print("descending")
}
/*:
 문자열 비교를 하는데 크다? 작다? 이게 무슨말이지? 하시는 분이 계실껍니다.
 `String` 타입에서 `compare` 메서드는 참 / 거짓 값을 돌려주지 않고
 `ComparisonResult`타입을 돌려줍니다.
 비교 결과를 저장하는 열거형 타입인데, 이는 뒤에서 나오니 이런 것이 있구나 하고 넘겨주시기 바랍니다.
 
 문자에서 `a` 보다 `b`가 알파벳 순서에서 뒤에 있게됩니다.
 즉 `"b".compare("a")` 는 `b`를 기준으로 `a`가 먼저있나? 늦게있나? 확인하는 메서드로 생각하면 쉽습니다.
 그래서 위의 경우에는 `b`가 `a`보다 뒤에있는 값이므로 내림차순의 결과가 나오게 됩니다.
 */

/*:
 ****
 내용이 많이 길어져 챕터를 나누어야 할 것 같습니다.
 해당 챕터에서는 기본 제공 타입에 대해서 알아보았습니다.
 모든 타입에 대해서는 많은 메서드가 존재합니다.
 그 내용은 공부하시면서, 사용하시면서 찾아보시기 바랍니다.
 */

//: [Next](@next)

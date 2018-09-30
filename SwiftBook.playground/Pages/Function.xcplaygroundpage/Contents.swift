//: [Previous](@previous)

import Foundation

/*:
 # Function
 
 안녕하세요.
 이번 챕터에서는 Function(함수, 메서드)에 대해서 알아보도록 하겠습니다.
 
 함수는 어떠한 동작을 나타내는 단위입니다.
 이전 챕터들에서 사용했었던 `print()`도 함수였죠.
 
 이 챕터에서 함수의 작성 방법과 사용 방법까지 쭉 익히시면 됩니다.
 
 지금부터 아래 내용을 잘 확인해주세요.
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.
 [Nebori Swift Book](https://github.com/Nebori/NeboriSwiftBook)
 */

/*:
 ****
 ## 함수의 정의
 
 변수도 사용하기 위해서는 정의를 하듯이 함수도 정의를 해야겠죠?
 함수를 정의하는 방법을 알아보도록 합니다.
 우선 함수의 구조부터 보여드리겠습니다. `[]`안에 있는 값은 생략 가능합니다.
 ```
 // 매개변수 x, 리턴타입 x
 func 함수이름() {
 // 함수 바디
 }
 // 매개변수 x, 리턴타입 o
 func 함수이름() -> 리턴타입 {
 // 함수 바디
 return 리턴타입의 값
 }
 // 매개변수 o, 리턴타입 x
 func 함수이름([외부별명] 내부별명: 타입) {
 // 함수 바디
 }
 // 매개변수 o, 리턴타입 o
 func 함수이름([외부별명] 내부별명: 타입) -> 리턴타입 {
 // 함수 바디
 return 리턴타입의 값
 }
 ```
 */

/*:
 그러면 이제 실제로 코드에서 어떻게 사용하는지 보여드리겠습니다.
 위 구조와 똑같은 순서로 작성하겠습니다.
 */
// 매개변수 x, 리턴타입 x
func chirp() {
    print("새가 chirp")
}
chirp()
// 매개변수 x, 리턴타입 o
func getChirp() -> String {
    return "새가 chirp"
}
print(getChirp())
// 매개변수 o, 리턴타입 x
func putChirp(chirp: String) {
    print("새가 \(chirp)")
}
putChirp(chirp: "chirp")
// 매개변수 o, 리턴타입 o
func putChirpAndGetChirp(chirp: String) -> String {
    return "새가 \(chirp)"
}
print(putChirpAndGetChirp(chirp: "chirp"))

/*:
 ### 함수의 리턴값
 
 위의 함수를 보시면 `함수명() -> 리턴타입`으로 함수를 정의하고 있습니다.
 여기서, 함수의 리턴값을 한개가 아니고 다수개를 받고싶다면 어떻게 해야할까요?
 */

// error: consecutive statements on a line must be separated by ';'
// error: expected expression
// error: top-level statement cannot begin with a closure expression
// error: top-level statement cannot begin with a closure expression
// error: expected expression
//func multiReturnValue() -> Int, String {
//    return 10, "문자열"
//}

/*:
 에러 폭탄이 떨어집니다.
 저희는 여러 값을 다루는 방법을 이미 이전 챕터에서 배웠습니다.
 바로 컬렉션 타입을 이용하는 방법입니다.
 함수에서 튜플 타입을 리턴값에 사용하고, 그 함수를 사용하고 리턴 값을 받는 예제를 보여드리겠습니다.
 */

func returnNumberOne() -> (Int, String) {
    return (1, "One")
}
let (numberOne, strOne) = returnNumberOne()
numberOne // 1
strOne // "One"

/*:
 ### 함수의 매개변수
 
 함수의 매개변수는 해당 함수의 동작에 필요한 정보들을 전달하기 위해서 사용합니다.
 함수 선언중에서 `func 함수명(매개변수: 타입, ...)` 괄호 안에 매개변수를 작성하면 됩니다.
 매개변수의 이름과 타입을 반드시 정의해주어야 하며, 배개변수의 이름을 지정하면 해당 함수의 바디에서 그 이름을 사용하여 값에 접근할 수 있습니다.
 기본적인 예제먼저 보여드리겠습니다.
 */

func sumFunction(number1: Int, number2:Int) -> Int {
    return number1 + number2
}
let result01 = sumFunction(number1: 10, number2: 20)
result01 // 30

/*:
 그런데 함수를 사용하는 개발자가 직관적으로 알 수 없는 값들을 다룰 때는 매개변수명을 상세하게 적어주는 편이 좋습니다. (반드시 넣어야 하는 것은 아닙니다!)
 예를 들어서 지폐 개수를 매개변수로 받아 총 얼마를 가지고 있는지 계산하는 함수를 만들어보도록 하겠습니다.
 */

// 문제가 없는 함수입니다.
func moneyCalculater01(_ tenThousand: Int, _ oneThousand: Int) -> Int {
    return (tenThousand * 10000) + (oneThousand * 1000)
}
// 매개변수가 2개가 있는데, 어떤게 어떤 지폐일까요?
// 알 수 있는 방법이 없습니다. 코드를 뜯어보는 수 밖에...
moneyCalculater01(3, 8)

/*:
 그러면 추천하는 방식도 보여드리겠습니다.
 */

func moneyCalculater02(tenThousand: Int, oneThousand: Int) -> Int {
    return (tenThousand * 10000) + (oneThousand * 1000)
}
// 매개변수 명으로 내용을 유추할 수 있습니다.
moneyCalculater02(tenThousand: 3, oneThousand: 8)

//: [Next](@next)

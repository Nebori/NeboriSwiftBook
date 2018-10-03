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

/*:
 ### 함수 매개변수의 이름
 
 위에서 매개변수의 이름을 왜 지정해야 하는지에 대해서는 어느정도 이해하셨나요?
 지금부터는 매개변수의 이름에 대해서 알아보도록 하겠습니다.
 함수를 정의할 때 적는 매개변수의 이름은 함수 바디에서 사용하는 내부 매개변수 이름입니다.
 외부 매개변수 이름을 따로 지정해주지 않는다면 자동으로 내부 매개변수의 이름으로 값을 대입하게 됩니다.
 */

func parameterNames(intValue: Int, strValue: String) {
    // 여기서 intValue, strValue는 내부 매개변수 이름이 됩니다.
    intValue // 100
    strValue // "백"
}
// 이렇게 외부 매개변수 이름을 지정하지 않게되면
// 내부 매개변수 이름이 외부 매개변수 이름으로 쓰이게 됩니다.
parameterNames(intValue: 100, strValue: "백")

/*:
 이미 예시에서는 보여드렸지만 외부 매개변수 이름을 설정하는 방법을 보여드리겠습니다.
 */

func parameterExternalNames(write intValue: Int, read strValue: String) {
    // 여기서 write, read는 외부 매개변수 이름이 되고,
    // intValue, strValue는 내부 매개변수 이름이 됩니다.
    intValue // 100
    strValue // "백"
}
// 외부에서는 write, read를 이용하는 것을 볼 수 있습니다.
parameterExternalNames(write: 100, read: "백")

/*:
 이번엔 외부 매개변수 이름을 생략하는 방법에 대해서 보여드리겠습니다.
 외부 매개변수의 이름을 생략하고 싶다면 외부 매개변수 자리에 `_`를 사용하면 됩니다.
 띄어쓰기를 주의해주세요!
 */

func parameterOmitNames(_ intValue: Int, read strValue: String) {
    // 여기서 intValue의 값을 넣을 때는 이름을 생략하게 됩니다.
    // strValue의 값을 넣을 때는 read이름을 지정하고 값을 대입해야 합니다.
    intValue // 100
    strValue // "백"
}
parameterOmitNames(100, read: "백")

/*:
 ### 함수 오버로딩
 
 함수 오버로딩은 이름이 같은 함수를 여러개 정의하는 방식입니다.
 함수명이 동일한데 어떻게 여러개를 정의하나요? 매개변수가 다릅니다!
 바로 예시로 들어가보겠습니다.
 */

func sayYourMoney(hundred money: Int) {
    print("당신이 가진 돈은 \(money)백원입니다.")
}
// 아래처럼 외부 매개변수 이름이 다른 경우
func sayYourMoney(thounsand money: Int) {
    print("당신이 가진 돈은 \(money)천원입니다.")
}
// 아래처럼 매개변수 이름은 동일하지만 타입이 다른경우
func sayYourMoney(thounsand money: String) {
    print("당신이 가진 돈은 " + money + "천원입니다.")
}
sayYourMoney(hundred: 5) // 당신이 가진 돈은 5백원입니다.
sayYourMoney(thounsand: 3) // 당신이 가진 돈은 3천원입니다.
sayYourMoney(thounsand: "3") // 당신이 가진 돈은 3천원입니다.

/*:
 함수의 이름은 동일하지만 외부 매개변수 이름이나, 타입에 따라서 다르게 인식되는 것을 확인할 수 있습니다.
 */

/*:
 ### 함수 매개변수의 기본값
 
 여러분은 음식 배달 주문시에 꼭 현금, 카드로 결제하겠다고 말씀하시는 편이신가요?
 지금은 어플리케이션으로 주문을 많이 하지만 그 전에는 전화로 주문을 할 수 밖에 없었습니다.
 가끔 전화 마지막에 결제 방식을 까먹고 말 안한경우에는 카드를 내밀어보지만 현금 결제해주셔야 한다는 얘기를 종종 듣곤 했습니다.
 이 경우를 프로그래밍 세계로 끌고 들어와 보도록 하겠습니다.
 주문하는 사람은 결제 방식을 선택하지 않았지만, 배달은 도착을 했고 결국 현금 결제를 하게 되었습니다.
 그런데 이 행동이 함수라면 불가능하게됩니다.
 */

//func delieryOrder(order: String, isCash: Bool) {
//    print("주문은 \(order)를 하셨습니다.")
//    if isCash {
//        print("결제 방식은 현금이시네요.")
//    } else {
//        print("결제 방식은 카드시네요.")
//    }
//}
// 탕수육 중으로 하나 부탁드립니다.
// error: missing argument for parameter 'isCash' in call
//delieryOrder(order: "탕수육 중")

/*:
 함수 매개변수를 설정하고 값을 넣어주지 않고 호출을 할 경우에는 에러가 발생하기 때문인데요.
 이 상황을 에러가 나지 않도록 변경해봅시다.
 */

func delieryOrder(order: String, isCash: Bool = true) {
    // isCash 매개변수에 값을 넣어주지 않았기 때문에
    // isCash는 자동적으로 기본 값인 true가 대입됩니다.
    print("주문은 \(order)를 하셨습니다.")
    if isCash {
        print("결제 방식은 현금이시네요.")
    } else {
        print("결제 방식은 카드시네요.")
    }
}
// 탕수육 중으로 하나 부탁드립니다.
delieryOrder(order: "탕수육 중") // 주문은 탕수육 중를 하셨습니다. 결제 방식은 현금이시네요.

/*:
 이렇게 반드시 함수에 들어와야 하는 값은 그대로 값을 받도록 만들면 되고,
 필수가 아니거나 특수한 경우에만 다른 값이 들어가는 경우에는 초기값을 지정해주는 것이 개발자가 사용하기 편리합니다.
 */

/*:
 ### 함수의 가변갯수 매개변수
 
 한글로 적다보니 의미가 제대로 전달되지 않는 것 같습니다.
 매개변수의 수가 정해지지 않은 다수의 매개변수를 선언하는 방법을 알아보겠습니다.
 우선 사용하는 방법은 매개변수의 타입을 지정할 때 `...`을 사용하면 됩니다.
 다른 선언들과 다르게 조금 신기한 방식을 사용하니 예시를 잘 봐주세요.
 */

func partierList(_ names: String...) {
    // 함수 바디에서는 배열로 사용할 수 있습니다.
    names.count // 배열의 갯수
    for name in names {
        // 들어온 이름을 하나씩 확인
    }
}
partierList("호랑이", "사자", "오소리", "다람쥐")

/*:
 대표적으로 많이 사용하는 `print()`함수가 가변개수를 가진 매개변수를 사용합니다.
 public func print(_ items: Any..., separator: String = default, terminator: String = default)
 */

/*:
### 함수와 옵셔널

이전에 옵셔널을 다룰 때 값이 있을 수도 없을 수도 있을 때 사용한다고 말씀드렸습니다
그런데 함수도 예외는 없습니다. 함수의 매개변수가 옵셔널이거나, 반환 값이 옵셔널일 수 있다는 뜻입니다.
단계적으로 예시를 통해서 알아보도록 하겠습니다.
먼저, 매개변수의 옵셔널에 대해서 보여드리겠습니다.
옵셔널 타입의 언래핑 방법중에 `if-let`, `guard-let else`문을 사용하는 예제를 준비했습니다.
*/

// 매개변수의 타입을 지정할 때 ?를 사용합니다.
func yourDrivingLicenceNumberIfLet(licenceNumber: String?) {
    // licenceNumber은 옵셔널 타입으로 사용하기 위해서는 언래핑을 이용합니다.
    if let unwrapNumber = licenceNumber {
        print("당신의 운전면허 번호는 \(unwrapNumber)입니다.")
    } else {
        print("당신은 운전면허가 없습니다.")
    }
}
func yourDrivingLicenceNumberGuardLet(licenceNumber: String?) {
    // licenceNumber은 옵셔널 타입으로 사용하기 위해서는 언래핑을 이용합니다.
    guard let unwrapNumber = licenceNumber else {
        print("당신은 운전면허가 없습니다.")
        // guard-let else문엔 반드시 빠져나가는 명령이 필요
        return
    }
    print("당신의 운전면허 번호는 \(unwrapNumber)입니다.")
}
yourDrivingLicenceNumberIfLet(licenceNumber: nil)
// "당신은 운전면허가 없습니다."
yourDrivingLicenceNumberGuardLet(licenceNumber: "123456")
// "당신의 운전면허 번호는 123456입니다."

//: [Next](@next)

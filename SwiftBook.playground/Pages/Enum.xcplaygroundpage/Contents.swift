//: [Previous](@previous)

import Foundation

/*:
 # Enum
 
 안녕하세요.
 이번 챕터에서는 Enum(열거형)에 대하여 알아보려고 합니다.
 
 지금부터 아래 내용을 잘 확인해주세요.
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.
  [Nebori Swift Book](https://github.com/Nebori/NeboriSwiftBook)
 */

/*:
 ## 열거형
 
 열거형은 여러 값들을 열거해놓고 그 중 하나를 골라서 사용한다고 이해하시면 쉽습니다.
 열거형을 사용하는 경우는 어떤 상태(서있음, 달림, 누워있음, 앉아있음 등), 제한된 값만 가지는 값(계절, 12개월, 시간 등)을 다룰 때 사용합니다.
 지금부터 열거형의 사용 방법들을 알아보겠습니다.
 */

/*:
 ### 열거형 정의
 */

enum HumanStatus {
    // Swift3 가이드라인부터 열거형의 원소는 소문자로 시작하여 카멜케이스를 사용하기를 권장합니다.
    case lie
    case stand
    case run
}

/*:
 ### 열거형 사용
 
 위에 정의한 열거형을 사용해보겠습니다.
 */

var status = HumanStatus.stand
status = HumanStatus.run

/*:
 ### 열거형 사용 예시
 
 열거형은 일반적으로 상태를 많이 다루는데, 이 상태에 따라서 다른 행동을 해야 하는 경우에는 `if-else`보다는 `switch-case`를 사용하면 편리합니다.
 */

switch status {
case .stand:
    print("이 사람은 서있네요.")
case .run:
    print("이 사람은 달리네요.")
default:
    // switch를 사용하는 열거형의 모든 원소를
    // case로 선언해주지 않을 경우 default:를 사용하여
    // 나머지 원소들일 때 행동하는 코드를 작성하면 됩니다.
    break
}

/*:
 여기서 주의까지는 아니지만 기억해야 할 점은 위에도 적었듯이 모든 원소를 `case`로 정의하지 않는다면 `default`를 정의해주어야 한다는 점.
 그리고 위 예시에는 없지만 `case`로 정의할 경우 작동하는 코드가 있다면 `break`를 적지 않아도 되지만 `case`로 정의했으나 작동하는 코드가 없는 경우엔 반드시 `break`를 적어야 에러가 발생하지 않습니다. 아래 간단하게 예시를 보여드리겠습니다.
 */

switch status {
case .lie:
    break
case .stand:
    print("이 사람은 서있네요.")
case .run:
    print("이 사람은 달리네요.")
}

/*:
 ### 열거형 값 부여
 */

enum IntCount: Int {
    // Int 형일 경우 순서대로 0부터 값이 부여가 됩니다.
    // 즉, 생략이 가능합니다.
    case zero = 0
    case one
    case two
    case three
}
enum IntMoney: Int {
    case manWon = 10000
    case cheonWon = 1000
    case baekWon = 100
}
enum StrMoney: String {
    case manWon = "만원"
    case cheonWon = "천원"
    case baekWon = "백원"
}

/*:
 위 예시처럼 값을 부여하게 되면 접근하여 값을 가져올 수도 있어야겠죠? `rawValue`를 이용하세요.
 */

IntCount.zero.rawValue // 0
IntMoney.manWon.rawValue // 10000
StrMoney.manWon.rawValue // "만원"

/*:
 ### 열거형의 메서드, 프로퍼티
 
 열거형에도 구조체와 클래스처럼 메서드와 프로퍼티를 선언하여 사용할 수 있습니다.
 그런데 프로퍼티의 경우에는 계산 프로퍼티만 사용할 수 있는 점을 기억해주세요.
 */

enum MoneyPropertiesAndMethod {
    case manWon
    case cheonWon
    case baekWon
    case sipWon
    var koreanMoneyName: String {
        switch self {
        case .manWon:
            return "만원"
        case .cheonWon:
            return "천원"
        case .baekWon:
            return "백원"
        case .sipWon:
            return "십원"
        }
    }
    // error: enums must not contain stored properties
    // var storeProperty = "store"
    func speaking() {
        print("현재 \(self.koreanMoneyName)을 갖고 있습니다.")
    }
}

var koreanMoney = MoneyPropertiesAndMethod.cheonWon
koreanMoney.speaking()

/*:
 위 예제에 에러코드가 포함되어 있습니다. 위 처럼 저장 프로퍼티는 사용할 수 없는점을 확인해주시면 됩니다.
 */

//: [Next](@next)

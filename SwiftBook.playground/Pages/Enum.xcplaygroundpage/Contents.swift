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

/*:
 ### 열거형의 저장 프로퍼티 같은 association
 
 위에 내용중에 계산 프로퍼티는 사용할 수 있지만 저장 프로퍼티는 사용할 수 없다고 말씀드렸습니다.
 하지만 열거형에도 저장 프로퍼티 처럼 값을 저장할 수 있는 방법이 있습니다.
 바로 열거형에서 케이스를 정의할 때 값을 받아서 보관할 수 있는데요. 아래 내용을 확인해주세요.
 */

enum MoneyAssociation {
    case manWon
    case cheonWon
    case baekWon
    case sipWon
    // ()를 이용하여 원하는 값을 받습니다.
    case blankWon(Int)
    var koreanMoneyName: String {
        switch self {
        case .manWon:
            return "10000원"
        case .cheonWon:
            return "1000원"
        case .baekWon:
            return "100원"
        case .sipWon:
            return "10원"
        case .blankWon(let cost):
            // 위 case문과 차이점이 있죠?
            // 변수 명은 개발자가 원하는 이름을 사용하면 됩니다.
            return "\(cost)원"
        }
    }
    // error: enums must not contain stored properties
    // var storeProperty = "store"
    func speaking() {
        print("현재 \(self.koreanMoneyName)을 갖고 있습니다.")
    }
}

// 아래와 같이 열거형을 사용하면서 정의한 자료형의 값을 넣어주면 사용할 수 있습니다.
var moneyAssociation = MoneyAssociation.blankWon(500000)
moneyAssociation.speaking()

/*:
 ****
 이번 챕터에서는 열거형에 대하여 알아보았습니다.
 오픈소스 라이브러리나 기존 라이브러리들을 사용하시다보면 은근히 많은 곳에서 열거형이 사용된다는 점을 아실 수 있을겁니다.
 에러를 다룬다거나, iOS에서 예를들면 버튼의 상태를 다룰 때도 열거형을 사용하죠.
 개발을 진행하시면서 어느 곳에서 열거형이 사용되는지 느껴보시고, 앞으로 개발을 진행하시면서 이런 부분에서 열거형을 사용하면 되겠구나! 하고 감을 잡으시기를 바랍니다.
 다음 챕터에서는 생성자에 대해서 알아보도록 하겠습니다.
 다음에는 조금 더 좋은 내용으로 정리하고 부족한 내용은 채워서 가져오겠습니다.
 봐주셔서 감사합니다.
 */

//: [Next](@next)

//: [Previous](@previous)

import Foundation

/*:
 # Optional
 
 안녕하세요.
 이번 챕터에서는 Optional(옵셔널)을 알아보도록 하겠습니다.
 
 옵셔널은 Swift에서 값이 있을 수도, 없을 수도 있을 때 사용합니다.
 이게 대체 무슨말일까요? 그냥 값이 없으면 `null`로 지정하면 되는거 아닌가요?
 Swift에서는 아닙니다. 그러면 옵셔널에 대해서 알아보도록 할까요?
 
 지금부터 아래 내용을 잘 확인해주세요.
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.
 [Nebori Swift Book](https://github.com/Nebori/NeboriSwiftBook)
 */

/*:
 ****
 ## nil
 
 그러면 먼저 `nil`에 대해서 알아보겠습니다.
 `nil`은 다른 언어에서 `null`과 같다고 생각하시면 됩니다.
 `nil`은 값이 없는 상태를 나타냅니다. 일반적으로 정수형을 초기화할 때 0을 대입합니다.
 그러면 0도 초기화만 된 상태이니까 `nil`과 같지 않을까요?
 결과를 보시면 0과 `nil`은 다릅니다.
 0이라는 값은 초기화이니까 의미가 없는 값이라고 생각할 수 있지만, 그 0이라는 정수가 값이기 때문입니다.
 */

let optionalValue: Int? = nil
let intValue: Int = 0

if optionalValue == intValue {
    print("값이 같습니다.")
} else {
    print("같지 않습니다.")
}

/*:
 nil은 연산이 불가능합니다. 값이 없는 상태이기 때문인데요.
 이번 순서는 nil에 접근하게 될 경우 어떤 영향이 있는지 알아보는 순서입니다.
 */

let optionalValue02: Int? = nil
// error: value of optional type 'Int?' must be unwrapped to a value of type 'Int'
// let errorValue = optionalValue02 + 1

/*:
 다시 `nil`로 돌아와서, Swift에서는 모든 타입에 `nil`로 선언이 가능합니다.
 그런데 `nil`로 선언하게 될 경우에 해당 변수에 접근해서 값을 사용하기 위해서는 unwrapping(언래핑) 이란 것을 해야합니다.
 (곧 알아보게 될텐데, 우선은 언래핑이란 것을 해야 옵셔널 변수의 값에 접근을 할 수 있다. 라는 것을 참고해주세요.)
 그렇기 때문에 변수를 선언할 때는 이 변수가 반드시 값이 있는 변수인지, 값이 없을 수도 있는 변수인지를 먼저 파악하고 선언을 해야합니다.
 아래 간단한 예제 하나만 보고 넘어가도록 하겠습니다.
 */

/*:
 예를 들어, 사람의 이름과 소유한 차의 이름을 튜플로 저장한다고 생각해보겠습니다.
 사람은 이름은 무조건 가지고 있는 값이지만, 차는 있을 수도 없을 수도 있습니다.
 그럴 경우에 옵셔널 타입을 사용하면 되는 것이죠.
 */
let personValue01: (String, String, String?) = ("만", "수르", "비싼차")
let personValue02: (String, String, String?) = ("네", "보리", nil)

/*:
그렇다면 `nil`로 선언하지 않고 값으로 `nil`을 대입하면 어떻게 될까요?
 */

// error: nil cannot initialize specified type 'Int'
// let intValue02: Int = nil

/*:
 위 예제 코드에서도 보셨겠지만, 옵셔널 타입은 타입을 지정할 때 타입 뒤에 `?`를 붙이면 선언이 가능합니다.
 */

// 에러가 발생하지 않습니다.
let optionalValue03: Int? = nil

/*:
 ## optional
 
 이제 옵셔널 타입에 대하여 알아보도록 하겠습니다.
 앞에서 보신 타입의 뒤에  `?`를 붙이는 것을 옵셔널 타입이라고 말씀드렸습니다.
 여러분은 어떤 값에 대하여 선언 시에 타입과 있을 수도, 없을 수도 있는 값인가? 를 생각하여 옵셔널 타입을 선택해야 합니다.
 하지만 여러분이 선언을 하지 않는 옵셔널 타입에 대해서도 생각을 해야합니다.
 내가 만드는 값이 아닌 어떠한 메서드의 결과가 `nil`로 리턴되는 경우도 있기 때문인데요.
 */

let intValue04 = Int("one")
intValue04 // nil
let intValue05 = Int("123")
intValue05 // 123

/*:
 그렇다면 이제 옵셔널 타입의 값을 다루는 방법에 대해서 알아보려고 합니다.
 옵셔널 타입의 값은 일반 데이터처럼 다룰 수 없습니다.
 연산자나 메서드, 값을 바로 사용할 수가 없죠.
 */

let optionalValue06: Int? = 10
// error: value of optional type 'Int?' must be unwrapped to a value of type 'Int'
//optionalValue06 + 1

/*:
 ### optional unwrapping
 
 위 내용에도 나온 것 처럼 옵셔널 타입의 값은 바로 이용할 수가 없습니다.
 그러면 이 값을 사용하는 방법에 대해서 알아봐야겠죠?
 바로 `언래핑`이라는 것을 통해서 값을 사용할 수 있습니다. 옵셔널 타입의 값은 실제로 옵셔널이라는 랩에 싸여있습니다.
 그러면 이제 랩을 풀어보도록 하겠습니다.
 */

/*:
 #### 옵셔널 바인딩
 
 옵셔널 바인딩은 조건문을 통해서 옵셔널 타입의 값을 꺼내는 방법입니다.
 두 가지 방법이 있는데 이는 아래와 같습니다.
 - if-let
 - guard-let
 두 가지 방식은 차이점이 존재하는데, if-let의 경우는 if 조건문의 바디 내에서 언래핑이 된다는 점이고,
 guard-let의 경우는 guard 문의 깊이(뎁스)까지 언래핑이 된다는 차이점이 있습니다.
 if-let 먼저 코드로 보여드리겠습니다.
 */

let ifValue01: Int? = 10
if let unwrapValue = ifValue01 {
    // unwrapValue는 ifValue01의 값이 언래핑된
    // 10의 값을 가지고 있습니다.
    print("이 값은 언래핑된 \(unwrapValue) 입니다.")
    // 언래핑 되어있기 때문에 위에서 실패하던 연산도 가능해집니다.
    let unwrapSum = unwrapValue + 1
} else {
    print("이 값은 nil입니다.")
}
// error: use of unresolved identifier 'unwrapValue'
//print("if-let은 if 바디에서만 사용이 가능하므로 \(unwrapValue)은 사용할 수 없습니다.")

/*:
 옵셔널 바인딩을 사용할 때 여러가지 방식으로 사용할 수 있습니다.
 if-let을 이용한 다양한 방식을 먼저 보겠습니다.
 */
let ifValue02: String? = "1000"
let ifValue03: String? = "100"
// 여러 옵셔널 변수 바인딩
if let unwrapValue02 = ifValue02,
    let unwrapValue03 = ifValue03 {
    // 이렇게 여러 옵셔널 변수를 바인딩 할 수도 있고
    // TODO
}
// 옵셔널 바인딩 체인
if let unwrapValue02 = ifValue02,
    let unwrapIntValue02 = Int(unwrapValue02) {
    // 바인딩을 한 후에 이어서 바로 바인딩 된 값을 사용할 수 있고
}
// 조건 비교
if let unwrapValue02 = ifValue02,
    unwrapValue02 == "1000" {
    // 옵셔널 바인딩과 조건을 비교할 수도 있습니다.
}

/*:
 다음으로는 guard-let 을 보여드리려고 합니다. 그런데 코드를 먼저 보시기 전에 알아두셔야 할 점이 있습니다.
 guard-let의 경우는 사용하려면 반드시 return 이나 throw처럼 해당 메서드나 행동이 종료되는 명령이 포함되어야 합니다. 이 내용은 ControlFlow(흐름 제어) 전 챕터에 포함되어 있으니 내용을 참고하셔도 좋습니다.
 그래서 위 if-let처럼 사용할 수는 없고 메서드는 아직 보지는 않았지만 메서드를 이용해서 guard-let의 예시를 들도록 하겠습니다.
 아래 코드는 단순 예시이고, if-let에서 사용하는 다수 옵셔널 바인딩, 옵셔널 바인딩 체인, 조건 비교 모두 가능합니다.
 */

// 정수형 값 1개를 매개변수로 하는 guardLetExamFunction 메서드입니다.
func guardLetExamFunction(value: Int?) {
    guard let unwrapIntValue = value, unwrapIntValue > 5 else {
        print("해당 조건에 맞지 않습니다. 빠져나가겠습니다.")
        // 반드시 해당 메서드가 종료되는 코드를 포함해야 합니다.
        return
    }
    print("guard-let 조건을 통과하여 언래핑되었습니다.")
    print("이 값은 언래핑된 \(unwrapIntValue) 입니다.")
    print("if-let과는 다르게 바디 밖에서 사용이 가능합니다.")
}

/*:
 다음으로는 `??`연산자에 대해서 알아보려고 합니다.
 `??`연산자는 옵셔널 타입인 변수를 사용할 때 값이 nil일 경우를 대비하여 사용하는 연산자입니다.
 코드로 보시겠습니다.
 */

let userSettingCountry: String? = nil
let countryName: String = userSettingCountry ?? "Republic of Korea"

/*:
 위 코드에서 `userSettingCountry`는 값이 nil입니다.
 변수 `countryName`에 `userSettingCountry`를 대입하는데 만약 `userSettingCountry`이 nil이라면 "Republic of Korea" 값을 대입하라는 연산자가 바로 `??`입니다.
 사용자가 설정한 값을 사용해야 하는데, 사용자가 설정한 값이 없다면? 이 때와 같이 default값을 이용해야 할 경우에 사용할 수 있으니 참고해주세요.
 */

/*:
 #### 옵셔널 체인
 
 옵셔널 체인은 옵셔널 타입의 값이 메서드나 프로퍼티를 가지고 있을 때 언래핑을 한 후에 값을 이용하지 않고 간결하게 코드를 작성할 수 있게 도와줍니다.
 예를 들어, 옵셔널 타입의 클래스에 옵셔널 타입의 변수에 옵셔널 타입이 리턴되는 메서드를 사용해야 합니다.
 (아래 사용한 코드는 예시를 위한 코드로, 작동하는 코드가 아니므로 Playground에서는 주석처리하겠습니다.)
 단계를 적어볼까요?
 1. 옵셔널 타입의 클래스를 언래핑
 2. 옵셔널 타입의 변수를 언래핑
 3. 옵셔널 타입이 리턴되는 메서드의 결과 값을 언래핑
 */

//if let unwrapClass = optionalClass,
//    let unwrapVar = unwrapClass.optionalVar,
//    let unwrapReturnValue = unwrapVar.someFunc() {
//    // unwrapReturnValue 결과 값을 사용
//} else {
//    // 옵셔널 바인딩 체인중에 nil 값이 반환되었습니다.
//}

/*:
 하지만 옵셔널 체인을 사용하면 어떻게 될까요?
 1. 옵셔널 타입의 클래스의 옵셔널 타입의 변수의 옵셔널 타입이 리턴되는 메서드의 결과 값을 언래핑
 */

//if let unwrapReturnValue = optionalClass?.optionalVar?.someFunc() {
//    // unwrapReturnValue 결과 값을 사용
//} else {
//    // 옵셔널 체인중에 nil 값이 반환되었습니다.
//}

/*:
 위 예시보다 아래 예시가 훨씬 가독성이 높습니다.
 위 예시에서 이미 사용방법을 보여드렸는데, 바로 옵셔널 타입을 지정할 때 사용되는 `?`를 이용하는 것이죠.
 아래 예시 코드를 글로 풀어보자면, optionalClass가 nil이 아니라면, optionalVar가 nil이 아니라면, someFunc메서드를 실행하여 옵셔널 타입의 리턴 값을 unwrapReturnValue에 대입한다. 가 되는 것입니다.
 코드를 앞에서부터 쭉 보시면서 `?`를 만났을 때 그 값이 nil이라면 그 위치에서 nil을 반환하고, nil이 아니라면 언래핑 후 다음 코드를 진행합니다.
 */

/*:
 #### 강제 언래핑
 
 강제 언래핑은 `!`를 사용하여 옵셔널 타입의 값을 바로 언래핑하는 기술입니다.
 '강제'라는 이름처럼 언래핑을 무조건 실시하게 되는데 해당 값이 옵셔널 타입이고 값이 nil이 아니라면 아무 문제가 없습니다.
 하지만 강제 언래핑을 시도하는 값이 옵셔널 타입이고 nil이라면 런타임 에러가 발생하게 됩니다.
 런타임 에러는 서비스하는 어플리케이션이라면 심각한 문제를 초래할 수 있습니다.
 실행중 강제종료되는 경우인데, 이는 사용자에게 최악의 경험을 안겨주고 서비스하는 회사 입장에서도 끔찍한 경험이 될 것입니다.
 그렇기 때문에 강제 언래핑을 사용할 때는 신중해야 하고, 웬만하면 강제 언래핑은 일절 사용하지 않는 것을 추천드립니다.
 에러 예시는 아래와 같습니다.
 */

let ifValue04: Int? = nil
// error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
//let forcedUnwrapValue04: Int = ifValue04!

/*:
 값이 nil이 아니라면 에러는 발생하지 않습니다.
 */

let ifValue05: Int? = 10
// 에러 발생하지 않음
let forcedUnwrapValue05: Int = ifValue05!

/*:
 #### 암시적 언래핑 옵셔널 (IUO)
 
 암시적 언래핑 옵셔널은 옵셔널이지만 사용할 때는 옵셔널이 아닌 타입입니다.
 간단하게 설명하자면, 옵셔널이기 때문에 nil과 값을 다룰 수 있지만 사용을 할 때마다 자동으로 언래핑을 시도하는 타입이죠.
 */

var iuoValue01: Int! = 10
// nil을 다루어도 에러가 발생하지 않습니다.
iuoValue01 = nil
// error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
// let sumValue = iuoValue01 + 1

/*:
 하지만 암시적 언래핑 옵셔널 역시 nil을 갖고 있을 때 사용하면 (언래핑하면) 에러가 발생합니다.
 때에따라 사용해야 할 경우가 있을지도 모르지만 많이 사용해서는 안되겠습니다.
 */

/*:
 ****
 이번 챕터에서는 옵셔널에 대하여 알아보았습니다.
 nil을 다루기 위해서는 반드시 옵셔널을 사용해야 하다보니 Swift를 사용하다 보면 자연스럽게 많이 사용하게 될 것입니다.
 기본적인 사용방법은 옵셔널 타입을 선언하고 값을 사용할 때는 언래핑을 통해 사용한다는 것을 알고 계시면 도움이 될 것 같네요.
 다음 챕터에서는 Function(함수, 메서드) 에 대해서 알아보도록 하겠습니다.
 다음에는 조금 더 좋은 내용으로 정리하고 부족한 내용은 채워서 가져오겠습니다.
 봐주셔서 감사합니다.
 */

//: [Next](@next)

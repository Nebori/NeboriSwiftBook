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
optionalValue06 + 1

/*:
 ### optional unwrapping
 
 업로드 예정
 */

//: [Next](@next)

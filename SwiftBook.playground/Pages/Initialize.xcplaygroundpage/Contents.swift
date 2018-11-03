//: [Previous](@previous)

import Foundation

/*:
 # Initialize
 
 안녕하세요.
 이번 챕터에서는 Initialize(초기화)에 대하여 알아보려고 합니다.
 
 앞 챕터들을 거쳐오면서 많은 정의와 객체를 생성하는 것을 보셨습니다.
 최대한 간단하게 예제를 처리하기 위해서 default(초기값)을 할당하고 진행을 했었는데, 이번 챕터에서는 초기화를 조금 더 깊게 살펴보려고 합니다.
 
 지금부터 아래 내용을 잘 확인해주세요.
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.
 [Nebori Swift Book](https://github.com/Nebori/NeboriSwiftBook)
 */

/*:
 ## 초기화
 
 */

/*:
 ### 일반 타입
 
 먼저 앞 챕터들에서 사용했던 일반적인 초기화를 잠시 보고 가겠습니다.
 
 옵셔널이 아닌 변수나 상수는 초기값을 할당해주지 않으면 에러가 발생합니다.
 
 하지만 그 변수나 상수가 옵셔널이라면 자동으로 `nil`로 초기화가 된다는 차이점을 봐주시면 되겠습니다.
 */

// 선언만 한다면 에러는 발생하지 않습니다.
var noneInitValue: Int
// Variable 'test' used before being initialized
// print(noneInitValue)

var optionalNoneInitValue: Int?
print(optionalNoneInitValue) // nil

/*:
 ## 사용자 타입
 
 사용자 타입은 이전 챕터들에서 다루었던 구조체, 클래스, 열거형들을 말합니다.
 
 사용자 타입에서 초기화가 필요한 대상은 저장 프로퍼티입니다.
 
 하지만 저장 프로퍼티라고 반드시 초기화가 필요한 것은 아닙니다.
 
 - 기본값이 할당된 프로퍼티
 - 옵셔널인 프로퍼티
 
 의 경우에는 초기화가 필요 없지만 두가지에 해당하지 않는 프로퍼티 즉, 기본값이 없고 옵셔널이 아닌 저장 프로퍼티의 경우에는 초기화가 필요한 것이죠.
 
 */

/*:
 ## 사용자 타입의 초기화
 */

/*:
 ### 구조체
 
 구조체를 예를 들어 보도록 하겠습니다.
 
 우선 기본값을 가진 프로퍼티만 소유한 구조체를 먼저 정의해보았습니다.
*/

struct ExamNotRequiredStruct {
    var value: String = "기본값"
}
// 기본값이 있는 프로퍼티만 소유한 구조체는 값을 설정하지 않고도 객체를 생성할 수 있습니다.
let notRequiredStruct01 = ExamNotRequiredStruct()
// 기본값이 있더라도 초기값을 설정하면서 객체를 생성할 수 있습니다.
let notRequiredStruct02 = ExamNotRequiredStruct(value: "초기값")

/*:
 다음으로는 기본값을 가지지 않은 프로퍼티를 소유한 구조체를 정의해보겠습니다. 에러가 발생하게됩니다.
 */

struct ExamRequiredStruct {
    var value: String
}
// error: missing argument for parameter 'value' in call
// let requiredStruct01 = ExamRequiredStruct()

/*:
 위 예제처럼 단순하게 객체가 생성되면서 값을 할당하는 경우가 아니라면 어떨까요?
 
 개발자가 넣어준 초기값을 이용하여 다른 프로퍼티를 초기화해야 하는 경우라면 위처럼 객체를 생성할 수는 없습니다.
 
 `init`메서드를 이용하면 이런 처리가 가능합니다.
 */

struct ExamInitStruct {
    var value: String = "기본값"
    var noneDefaultValue: String
    var requiredValue: String
    
    // init 메서드는 동일한 이름으로 여러가지 메서드를 생성할 수 있습니다.
    init() {
        // 매개변수가 없는 생성자라면 초기값이 필요한 모든 프로퍼티를 초기화해야 에러가 발생하지 않습니다.
        noneDefaultValue = "초기값0"
        requiredValue = "초기값1"
    }
    
    init(noneDefaultValue: String) {
        // 매개변수와 이름이 같은 경우 self 키워드를 이용하여 구분합니다.
        // self가 붙은쪽이 현재 구조체를 뜻합니다.
        self.noneDefaultValue = noneDefaultValue
        requiredValue = "\(noneDefaultValue) 이렇게도 가능합니다."
    }
    
    init(noneDefaultValue: String, requiredValue: String) {
        self.noneDefaultValue = noneDefaultValue
        self.requiredValue = requiredValue
    }
}

// noneDefaultValue = "초기값0", requiredValue = "초기값1"
let initStruct01 = ExamInitStruct()
// noneDefaultValue = "바로", requiredValue = "바로 이렇게도 가능합니다."
let initStruct02 = ExamInitStruct(noneDefaultValue: "바로")
// noneDefaultValue = "모두", requiredValue = "이용 가능합니다."
let initStruct03 = ExamInitStruct(noneDefaultValue: "모두", requiredValue: "이용 가능합니다.")

/*:
 ### 초기화의 종류
 
 위 예제들에서는 기본적인 초기화 방법에 대하여 먼저 살펴보았습니다.
 
 지금부터는 초기화의 종류 두 가지에 대해서 알아보겠습니다.
 
 - Designated Initializer (지정 초기화)
 - Convenience Initializer (편의 초기화)
 */

/*:
 #### 지정 초기화
 
 객체를 생성할 때 모든 프로퍼티에는 초기 값이 설정되어야 한다고 말씀드렸습니다.
 
 지정 초기화는 초기화가 필요한 모든 프로퍼티를 초기화하는 것을 말합니다.
 
 위 예제들은 구조체를 사용했으니 지금부터는 클래스를 사용해보겠습니다.
 */

class ExamDesignatedClass {
    var fir: Int
    var sec: Int
    var thr: Int
    init() {
        // 지정 초기화
        // 초기화가 필요한 모든 프로퍼티를 초기화했습니다.
        fir = 0
        sec = 1
        // 모든 프로퍼티가 초기화가 끝나기 전에 self를 호출하면 에러가 발생합니다.
        // 'self' used in method call 'printProperties' before all stored properties are initialized
        // printProperties()
        thr = 2
        // 초기화가 끝난 후에 self를 호출하면 정상 작동합니다.
        printProperties() // 0, 1, 2
    }
    init(fir: Int, sec: Int, thr: Int) {
        self.fir = fir
        self.sec = sec
        self.thr = thr
    }
    func printProperties() {
        print("\(fir), \(sec), \(thr)")
    }
}

/*:
 지정 초기화는 하나 하나의 `init`메서드에서 모든 프로퍼티를 초기화 한다는 점을 확인하시면 됩니다.
 
 그런데 위 예제를 확인해보시면 사실상 코드 중복이 발생하고 있습니다.
 
 주석을 길게 늘어놓아서 다시 정리해보았습니다.
 */

//...
//init() {
//    fir = 0
//    sec = 1
//    thr = 2
//    // 다른 행동
//}
//init(fir: Int, sec: Int, thr: Int) {
//    self.fir = fir
//    self.sec = sec
//    self.thr = thr
//}
//...

/*:
 프로퍼티에 값을 할당하는 코드가 동일합니다. 위 코드를 중복을 줄이기 위해서 코드를 정리해보겠습니다.
 */

//...
//init() {
//    self.init(fir: 0, sec: 1, thr: 2) // 에러!!!
//    // 다른 행동
//}
//init(fir: Int, sec: Int, thr: Int) {
//    self.fir = fir
//    self.sec = sec
//    self.thr = thr
//}
//...

/*:
 그런데 에러가 발생합니다.
 
 `Designated initializer for 'class' cannot delegate (with 'self.init'); did you mean this to be a convenience initializer?`
 
 지정된 이니셜라이저를 위임할 수 없고, 이 뜻이 편의 초기화를 말하는 것인가? 하고 묻는군요.
 
 네. 편의 초기화를 말하는 것이 맞습니다. 아래 내용으로 넘어갑니다.
 */

/*:
 #### 편의 초기화
 
 편의 초기화는 단독으로 객체를 초기화할 수 없는 초기화를 말합니다.
 
 결국 단독으로 객체를 초기화할 수 없기 때문에 다른 초기화의 힘을 빌려서 초기화를 진행하게 됩니다. 그렇기 떄문에 위에서 이니셜라이저를 위임할 수 없다고 경고를 띄운 것입니다.
 
 그렇다면 다른 초기화 메서드에 위임하는 예제를 보도록 해볼까요?
 
 위 예제를 조금 정리하고 이름만 바꾸어보았습니다.
 */

class ExamConvenienceClass {
    var fir: Int
    var sec: Int
    var thr: Int
    // convenience 키워드를 사용하면 에러가 발생하지 않습니다.
    convenience init() {
        self.init(fir: 0, sec: 1, thr: 2)
    }
//    convenience init(fir: Int) {
//        // error: 'self' used in property access 'thr' before 'self.init' call
//        self.fir = fir
//        self.sec = 1
//        self.thr = 2
//    }
    // 위 처럼 convenience 키워드를 붙였다면
    // 다른 행동을 하더라도 초기화가 끝난 상태에서 진행이 되어야합니다.
    convenience init(fir: Int) {
        // error: 'self' used in property access 'thr' before 'self.init' call
        self.init(fir: fir, sec: 1, thr: 2)
    }
    init(fir: Int, sec: Int, thr: Int) {
        self.fir = fir
        self.sec = sec
        self.thr = thr
    }
    func printProperties() {
        print("\(fir), \(sec), \(thr)")
    }
}

/*:
 여기서 기억해야 할 것은 편의 초기화는 다른 편의 초기화를 이용하여 초기화를 진행할 수 있는데, 이용한 편의 초기화의 종착 초기화는 결국 지정 초기화여야 한다는 점입니다.
 
 `convenience -> convenience -> ... -> designated`
 
 일을 시켰는데 위임만 하면 일이 끝나지 않겠죠? 슬프지만 누군가는 마무리를 지어야 하는 법입니다.
 */

/*:
 #### 실패가능한 초기화
 
 초기화도 실패할 수 있습니다.
 
 예를들어 주민을 등록해야 하는데 주민번호 개수가 맞지 않다면?
 
 휴대폰 전화번호가 010으로 시작하지 않는다면? 초기화를 진행할 수 없게 될 것입니다.
 
 실패가능한 초기화의 구조는 `init?()` 뒤에 `optional`을 붙여주면 됩니다.
 
 그렇다면 초기화가 실패하면 어떤 값을 돌려주어야 할까요? 바로 `nil`입니다.
 */

class KoreanPerson {
    var name: String
    let country: String
    init(name: String) {
        self.name = name
        self.country = "korea"
    }
    init?(name: String, country: String) {
        // 실패 가능한 초기화
        self.name = name
        // 이렇게 조건을 확인합니다.
        if country != "korea" {
            // 일정 조건이 맞지 않는경우 nil을 반환합니다.
            return nil
        }
        self.country = country
    }
}

/*:
 정의는 마쳤습니다. 이젠 사용을 해볼 차례인데요.
 
 여기서, 일반 초기화는 객체를 가져다주지만 실패가능한 초기화는 옵셔널객체를 가져다 준다는 것을 기억해주세요.
 */

let koreanPerson = KoreanPerson(name: "한국인")
koreanPerson // "한국인", "korea"
let koreanPerson02 = KoreanPerson(name: "한국사람", country: "korea")
koreanPerson02 // "한국사람", "korea"
let neighborCountryPerson = KoreanPerson(name: "이웃국인", country: "neighbor")
neighborCountryPerson // nil
let maybeKoreanPerson = KoreanPerson(name: "한국사람인가", country: "korea")
maybeKoreanPerson // optional "한국사람인가", "korea"

//: [Next](@next)

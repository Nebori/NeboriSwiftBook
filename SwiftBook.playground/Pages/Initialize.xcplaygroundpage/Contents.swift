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

//: [Next](@next)

//: [Previous](@previous)

import Foundation

/*:
 # Struct
 
 안녕하세요.
 이번 챕터에서는 Struct(구조체)에 대해서 알아보도록 하겠습니다.
 어떠한 값들을 구조화하여 처리하기 위해서 하나의 덩어리로 만들어 사용할 때 구조체를 사용하면 됩니다.
 말로 전달하기에는 부족함이 많이 느껴지네요.
 
 지금부터 아래 내용을 잘 확인해주세요.
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.
 [Nebori Swift Book](https://github.com/Nebori/NeboriSwiftBook)
 */

/*:
 ## 구조체의 필요성
 
 구조체의 필요성에 대해서 먼저 알아보려고 합니다.
 왜 값들을 하나의 덩어리로 뭉쳐서 처리해야 하나요? 그냥 다 따로 관리하면 안되나요?
 물론 하나로 뭉쳐서 사용하지 않아도 괜찮고, 따로 관리해도 상관은 없습니다.
 하지만 가독성과 편의성을 위해서는 하나의 덩어리로 뭉쳐서 사용하는 것이 좋습니다.
 예시를 한번 들어보도록 하겠습니다.
 동네의 주민 정보를 관리하고 처리하려고 합니다.
 주민의 `이름`, `나이`, `동` 3가지의 값을 저장하고, `주민동`에 사는 주민의 이름과 나이를 출력하려고 합니다.
 */

var (citizen01Name, citizen01Age, citizen01Dong) = ("이주민", 30, "주민동")
var (citizen02Name, citizen02Age, citizen02Dong) = ("김주민", 37, "주민동")
var (citizen03Name, citizen03Age, citizen03Dong) = ("홍주민", 26, "저기동")
let citizenArray: Array<(String, Int, String)> = [
    (citizen01Name, citizen01Age, citizen01Dong),
    (citizen02Name, citizen02Age, citizen02Dong),
    (citizen03Name, citizen03Age, citizen03Dong)
]
for (name, age, dong) in citizenArray {
    if dong == "주민동" {
        print("이름은 \(name), 나이는 \(age) 입니다.")
    }
}

/*:
 나누어진 데이터들을 튜플로 모아서 배열에 대입하고, 그 배열을 반복문으로 하나의 요소씩 접근해서 동을 확인하고 이름과 나이를 출력했습니다.
 그러면 이제는 구조체로 한번 표현해볼까요?
 */

struct citizenInfo {
    let name: String
    let age: Int
    let dong: String
    func isZuminDong() {
        if dong == "주민동" {
            print("이름은 \(name), 나이는 \(age) 입니다.")
        }
    }
}

var citizen01 = citizenInfo(name: "이주민", age: 30, dong: "주민동")
var citizen02 = citizenInfo(name: "김주민", age: 37, dong: "주민동")
var citizen03 = citizenInfo(name: "홍주민", age: 26, dong: "저기동")
let citizenArray01: Array<citizenInfo> = [
    citizen01,
    citizen02,
    citizen03
]
for citizen in citizenArray01 {
    citizen.isZuminDong()
}

/*:
 코드로 다른점들을 파악할 수 있으신가요?
 튜플의 경우는 일시적으로 값을 묶을 수 있지만, 구조체는 처음부터 연관있는 값들을 하나의 구조체로 묶어서 관리할 수 있는 차이가 있습니다.
 그리고 구조체는 무엇보다 함수를 만들 수 있습니다. 튜플의 경우는 해당 튜플만의 함수는 만들 수 없습니다. 단순히 값들을 일시적으로 묶기만 하기 때문이죠.
 하지만 연관된 값을 관리할 때 함수가 필요하다면 튜플보다는 구조체를 사용해야 한다는 점을 느끼셨다면 성공입니다.
 */

/*:
 ## 구조체의 정의
 
 이제 구조체를 정의하는 방법을 알아보도록 하겠습니다.
 구조체의 기본 구조에 대해서 먼저 봐야겠네요.
 
 struct 구조체이름 {
    // 구조체의 소유 변수들 선언
    var 변수이름: 타입 // 구조체를 만들면서 값을 대입해야 하는 변수
    var 변수이름: 타입? // 옵셔널 값을 다룰 수 있는 변수
    var 변수이름 = 0 // 초기 값이 있는 변수
 }
 
 구조체를 사용하는 방법도 바로 보여드리겠습니다.
 
 var 변수이름 = 구조체이름([초기값이없는변수이름: 값])
 변수이름.변수이름 = 10
 
 `구조체이름()`을 사용하면 구조체를 생성할 수 있고, 초기값을 설정하지 않은 변수는 구조체를 생성하면서 반드시 값을 대입해야합니다.
 그렇다면 이제 바로 예제로 들어가보겠습니다.
 */

struct Teacher {
    var name: String
    var className: String?
}

let koreanTeacher = Teacher(name: "김선생님", className: "한국어")
// error: cannot assign to property: 'koreanTeacher' is a 'let' constant
// koreanTeacher.name = "김선생님"
var engTeacher = Teacher(name: "영선생님", className: "영어")
engTeacher.name = "영어선생님"
var newTeacher = Teacher(name: "신입선생님", className: nil)

/*:
 간단하게 학교 선생님의 정보에 대해서 구조체를 만들어보았습니다.
 수업을 맡지 않을 수도 있기때문에 옵셔널 값을 포함시켰고, 간단하게 성함을 포함시켰습니다.
 `let`으로 구조체를 생성하면 프로퍼티 값을 변경할 수 없습니다.
 `var`로 구조체를 생성하면 프로퍼티 값을 변경할 수 있죠. 그리고 옵셔널을 다룰 수 있는 `className`프로퍼티는 `nil`을 대입해도 문제가 없습니다.
 */

/*:
 ## 구조체의 프로퍼티
 
 구조체의 프로퍼티는 크게 두가지로 볼 수 있습니다.
 단순하게 값을 저장하고 읽는 용도의 저장 프로퍼티. (예를들어 사각형의 가로, 세로길이)
 값을 저장하지 않고 계산을 통해서 값을 반환하는 계산 프로퍼티가 있습니다. (예를 들어 사각형의 넓이)
 */

/*:
 ### 저장 프로퍼티
 */

struct Rectangle01 {
    var width: Int
    var height: Int
}
var rectangle01 = Rectangle01(width: 10, height: 20)
rectangle01.width // 10
rectangle01.height // 10

/*:
 ### 계산 프로퍼티
 */

struct Rectangle02 {
    var width: Int
    var height: Int
    var area: Int {
        // 단순히 값을 얻기만 하는 변수입니다.
        get {
            return width * height
        }
    }
}

/*:
 #### Mutating
 
 뮤테이팅은 구조체에서 정의한 함수에서 구조체의 내부 프로퍼티가 변경될 때 쓰는 키워드입니다.
 어떻게 사용하는지 알아보겠습니다.
 */

struct Rectangle04 {
    var width: Int
    var height: Int
    
    func noneMutateFunction() {
        print("아무 프로퍼티도 변경하지 않았습니다.")
    }
    
    // error: left side of mutating operator isn't mutable: 'self' is immutable
    // func errorMutateFunction() {
    //    height *= 2
    // }
    
    mutating func doubleArea() {
        width *= 2
    }
}

var rectangle04 = Rectangle04(width: 10, height: 10)
rectangle04.noneMutateFunction()
rectangle04.doubleArea()
rectangle04.width // 20

/*:
 뮤테이팅은 예시에서 보신 것 처럼 구조체의 내부 프로퍼티가 변경될 경우 붙여주어야 합니다.
 그런데 왜 뮤테이팅 키워드를 붙이게 해놓았을까요?
 제 생각에는 함수의 정의만 보고도 내부 프로퍼티가 변경되는 함수인지 아닌지 직관적으로 알 수 있도록 만들었다는 생각이 듭니다.
 앞으로는 정의된 함수에 `mutating`이 붙어있다면 이 함수는 내부 프로퍼티의 값을 변경하는 함수구나 알아주시면 됩니다.
 그렇다면 여러분이 많이 사용하는 배열의 정의를 한번 들여다볼까요?
 
 public struct Array<Element> {
 ...
 public mutating func shuffle()
 ...
 public mutating func insert(_ newElement: Element, at i: Int)
 }
 
 배열도 구조체로 정의되어있습니다. 그리고 내부 프로퍼티를 변경하기 위해 `mutating`키워드가 포함된 함수들을 보실 수 있습니다.
 */

/*:
 ****
 이번 챕터에서는 구조체에 대해서 알아보았습니다.
 구조체는 연관된 값들을 한군데로 묶어서 관리할 수 있고, 가독성도 뛰어난 장점을 가졌습니다.
 하지만 이런 장점들은 구조체만 가지고 있는 것은 아닙니다. 그렇다면 어떤 것이 이러한 장점들을 똑같이 가졌을까요?
 다음 챕터에서 알아보려는 `Class`입니다. 다음 챕터에서는 구조체와 같은 점, 다른 점을 모두 알아보고 `Class`에 대해서도 알아보도록 하겠습니다.
 다음에는 조금 더 좋은 내용으로 정리하고 부족한 내용은 채워서 가져오겠습니다.
 봐주셔서 감사합니다.
 */

//: [Next](@next)

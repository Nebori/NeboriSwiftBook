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

//: [Next](@next)

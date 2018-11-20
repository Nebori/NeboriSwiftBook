//: [Previous](@previous)

import Foundation

/*:
 # ARC
 
 안녕하세요.
 
 이번 챕터에서는 ARC(Automatic reference counting)에 대하여 알아보려고 합니다.
 
 
 
 여러분들은 앞의 챕터를 진행하시면서 많은 객체를 생성하셨습니다.
 
 객체가 생성되면 자동적으로 메모리에 값이 저장되게 되면서 메모리의 용량을 차지하게 되는데요.
 
 메모리의 총량은 한정되어있는데 계속 객체가 생성만 된다면 문제가 발생할 것입니다.
 
 이런 문제를 해결하기 위하여 메모리 관리에 대해서 알아보려고 합니다.
 
 
 
 지금부터 아래 내용을 잘 확인해주세요.
 
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.
 
 [Nebori Swift Book](https://github.com/Nebori/NeboriSwiftBook)
 */

/*:
 ## 메모리 관리
 
 메모리는 한정된 자원입니다.
 
 한정된 자원을 계속해서 사용만 한다면 결국 자원은 부족하게 될 것이고, 해야하는 일을 못하게 될 것입니다.
 
 그렇다면 저희는 여태 메모리 관리를 해왔던 것일까요?
 
 한번도 메모리 관리 코드를 추가해본 적이 없는데?
 
 네, 스위프트는 기본적으로 자동 레퍼런스 카운팅을 이용하여 메모리 관리를 하고 있습니다.
 
 개발자가 따로 코드를 작성하지 않더라도 메모리 관리를 해주고 있죠.
 
 (다른 언어들도 ARC를 많이 이용하고 있습니다)
 */

/*:
 ### 레퍼런스 카운트
 
 레퍼런스 카운트는 쉽게말해 내 코드에서 객체를 참조하는 개수입니다.
 
 정확하게는 강한 참조의 개수입니다.
 
 객체를 사용, 즉 객체의 주소를 참조하는 곳이 1군데가 생기면 레퍼런스 카운트가 1이 증가하게 됩니다.
 
 반대로 객체가 사용종료, 즉 객체의 주소를 참조하는 곳이 1군데가 사라지면 레퍼런스 카운트가 1이 감소하게 되는거죠.
 
 이렇게 증감이 계속되다가 객체의 주소를 참조하는 곳이 0개가 되는 순간 사용이 끝났다고 판단하여 메모리가 해제됩니다.
 */

/*:
 ## 객체
 
 객체는 주소를 참조하는 것이기 때문에 클래스에만 적용이 됩니다.
 
 일반적은 값 타입에는 적용되지 않죠. (알고있는 구조체, 열거형)
 
 그렇다면 지금부터 코드와 함께 객체에 대해서 알아보도록 하겠습니다.
 
 */

 /*:
 ### 소유, 해제
 
 간단한 예제 클래스를 생성하고, 그 클래스의 객체를 만들었다가 해제하는 예제입니다.
 */

class ReferenceExam {
    init() {
        print("생성 되었습니다")
    }
    deinit {
        print("해제 되었습니다")
    }
}
var reference01: ReferenceExam! = ReferenceExam() // 여기서 레퍼런스 카운트가 +1 됩니다.
// 생성 되었습니다
reference01 = nil // 여기서 레퍼런스 카운트가 -1 됩니다.
// 해제 되었습니다.

print("###################################")

/*:
 위에서 객체를 생성하는 부분에서 레퍼런스 카운트가 증가됩니다.
 
 해당 클래스를 참조하는 객체가 소유되면서 카운트가 +1 되는것이죠.
 
 아래 `nil` 을 대입하면서 더 이상 이 객체는 해당 클래스를 참조하지 않게 되면서 카운트가 -1 됩니다.
 
 결국 이 클래스는 아무도 참조하지 않게 되고 결국 메모리에서 해제당하고 맙니다.
 */

/*:
 위의 경우는 결국 레퍼런스 카운트가 0이 되어 메모리에서 해제되었습니다.
 
 하지만 아래와 같다면 어떻게 될까요?
 */

var reference02: ReferenceExam! = ReferenceExam() // 여기서 레퍼런스 카운트가 +1 됩니다.
// 생성 되었습니다
var reference03 = reference02 // 여기서 레퍼런스 카운트가 +1 됩니다.
reference02 = nil // 여기서 레퍼런스 카운트가 -1 됩니다.

/*:
 여기서는 메모리에서 해제되지 않습니다.
 
 `reference02`가 처음에 `ReferenceExam`클래스를 초기화하여 객체를 만들때 카운트가 1 증가하게되고, `reference03`가 `reference02`를 참조하면서 새로 초기화가 되지는 않았지만 카운트가 또 1 증가하게 되면서 총 카운트는 2가 됩니다.
 
 `reference02`를 참조 해제하더라도 `reference02`가 바라보고있던 `ReferenceExam`의 객체를 그대로 바라보고있는 `reference03`이 카운트를 1 가지고 있기때문에 결과적으로 참조 갯수가 0이 되지 않기때문입니다.
 */

/*:
 ### 타입의 소유
 
 `Scope`라는 말을 들어보셨나요?
 
 스코프는 영역이라는 뜻입니다. 변수의 스코프는 해당 변수가 존재하는 영역을 말하는데요.
 
 지금부터 변수의 스코프에 대해서 알아보겠습니다.
 */

/*:
 #### 지역 변수
 
 - 소유권을 잃는 시점: 영역에서 벗어날 때
 
 지역 변수는 간단하게 함수를 이용해서 설명할 수 있습니다.
 */

func localVariable() {
    var local = 100
}
// error: use of unresolved identifier 'local'
// print(local)

/*:
 위 예시에서 `local`변수는 함수 내에서만 사용할 수 있는 지역 변수입니다.
 
 함수 외부에서는 해당 지역 변수를 참조할 수도, 사용할 수도 없습니다.
 */

/*:
 함수에 객체를 추가해서 소유와 해제를 실행해보겠습니다.
 */

class LocalVariableClass {
    init() {
        print("로컬 클래스 생성")
    }
    deinit {
        print("로컬 클래스 해제")
    }
    func localPrint() {
        print("로컬 클래스에서 출력")
    }
}
func localVariable01() {
    let localVariableClass = LocalVariableClass()
    localVariableClass.localPrint()
}
localVariable01()
// 로컬 클래스 생성
// 로컬 클래스에서 출력
// 로컬 클래스 해제

print("###################################")

/*:
 #### 프로퍼티
 
 - 소유권을 잃는 시점: 객체의 생명 주기에 따라
 
 프로퍼티는 클래스를 통해서 예제를 구성해보겠습니다.
 */

class PropertyClass {
    var propertyObj: LocalVariableClass! = LocalVariableClass()
    init() {
        print("프로퍼티 클래스 생성")
    }
    deinit {
        print("프로퍼티 클래스 해제")
    }
}
var property01: PropertyClass! = PropertyClass()
// 로컬 클래스 생성
// 프로퍼티 클래스 생성
property01 = nil
// 프로퍼티 클래스 해제
// 로컬 클래스 해제

print("###################################")

/*:
 여기서 로컬클래스가 프로퍼티 클래스보다 늦게 해제되는 것을 확인할 수 있습니다.
 
 레퍼런스 카운트에 의해서 `PropertyClass`가 `LocalVariableClass`를 참조하고 있기 때문에 프로퍼티 클래스가 먼저 해제되고, 레퍼런스 카운트가 0이 된 로컬 클래스는 그 뒤에 해제가 됩니다.
 */

/*:
 #### 타입 프로퍼티
 
 - 소유권을 잃는 시점: 객체의 생명 주기와 상관 없음
 
 타입 프로퍼티도 클래스를 통해서 예제를 구성해보았습니다.
 */

class TypePropertyClass {
    static var typePropertyObj: LocalVariableClass! = LocalVariableClass()
    init() {
        print("타입 프로퍼티 클래스 생성")
    }
    deinit {
        print("타입 프로퍼티 클래스 해제")
    }
}
var property02: TypePropertyClass! = TypePropertyClass()
// 타입 프로퍼티 클래스 생성
property02 = nil
// 타입 프로퍼티 클래스 해제

TypePropertyClass.typePropertyObj.localPrint()
// 로컬 클래스 생성
// 로컬 클래스에서 출력

/*:
 타입 프로퍼티는 객체의 생명 주기와는 상관없이 전혀 다른 객체처럼 사용됩니다.
 */

//: [Next](@next)

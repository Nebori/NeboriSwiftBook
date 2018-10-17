//: [Previous](@previous)

import Foundation

/*:
 # Class
 
 안녕하세요.
 이번 챕터에서는 Class(클래스)에 대하여 알아보려고 합니다.
 
 클래스 먼저 자세히 알아보고, 그 다음으로 구조체와 클래스의 차이점에 대하여 다루려고 합니다.
 
 지금부터 아래 내용을 잘 확인해주세요.
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.
 [Nebori Swift Book](https://github.com/Nebori/NeboriSwiftBook)
 */

/*:
 ## 클래스
 */

/*:
 ### 클래스 정의
 
 먼저 클래스의 정의 방법에 대해서 먼저 보여드리겠습니다.
 구조체와 크게 다르지 않으므로 이 점 참고하여 봐주시길 바랍니다.
 */

class Rectangle {
    var width: Int = 0
    var height: Int = 0
}

/*:
 ### 객체 생성
 */
var rect01 = Rectangle()

/*:
 ### 프로퍼티 접근
 */
rect01.width = 30
rect01.height = 30

/*:
 ### 객체를 let으로 생성하면?
 
 변수를 `let`으로 생성하면 값을 변경할 수 없습니다. 모두 알고 계시는 사실이죠.
 하지만 클래스는 `let`으로 선언을 하더라도 내부 프로퍼티의 값을 변경할 수 있습니다.
 */
let rect02 = Rectangle()
rect02.width = 30
rect02.height = 30

/*:
 그렇다면 클래스는 `let`으로 선언되더라도 모든 것들을 바꿀 수 있는걸까요?
 */
// error: cannot assign to value: 'rect02' is a 'let' constant
// rect02 = Rectangle(width: 30, height: 30)

/*:
 그렇지는 않습니다. `let`으로 선언된 객체는 내부 프로퍼티는 변경할 수 있어도 객체 자체 주소를 새로 할당할 수는 없습니다.
 */

/*:
 ### 클래스의 프로퍼티
 
 클래스의 프로퍼티를 선언하는 방법에 대하여 알아보도록 하겠습니다.
 위 예제에서는 에러가 발생하지 않았는데 아래와 같이 하면 에러가 발생합니다.
 자세히 보시면 위 예제와 아래 예제가 다른 점이 있습니다.
 바로 프로퍼티를 초기 값을 주지 않았다는 점입니다.
 */

/*
 // error: class 'Rectangle01' has no initializers
class Rectangle01 {
    var width: Int
    var height: Int
}
 */

/*:
 에러 내용은 `Rectangle01`클래스가 생성자를 가지지 않았다고 나옵니다.
 말 그대로 프로퍼티를 반드시 초기화를 해야하고, 그 방법에는 직접 프로퍼티에 초기 값을 대입하거나, 아니면 생성자를 가져야 한다는 점을 알 수 있습니다.
 그렇다면 이 에러내용을 받아들이고 생성자를 갖도록 만들어주겠습니다.
 */

class Rectangle01 {
    var width: Int
    var height: Int
    var area: Int {
        return width * height
    }
    var comment: String
    // 생성자의 기본 모양입니다.
    // 초기 값을 설정하지 않는 프로퍼티는 이 생성자 안에서
    // 반드시 값을 설정해주어야 합니다.
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        // 생성자에서 초기 값이 없는 모든 프로퍼티를 초기화 해주면 되므로
        // 반드시 매개변수로 받아야하는 것만은 아닙니다.
        // 하지만 이런경우 생성자보다는 선언에서 바로 값을 대입해주는게 좋습니다.
        self.comment = "초기값"
    }
}

/*:
 위 예제에서 설명하고 싶은 내용은 주석에 추가하였으니 참고 부탁드립니다.
 */

/*:
 ### 클래스의 메서드
 
 구조체와 똑같이 클래스에도 메서드를 선언하고 사용할 수 있습니다.
 구조체에서 `mutating`키워드를 기억하시나요?
 `mutating`은 구조체의 메서드 안에서 프로퍼티의 값을 변경하기 위해서는 키워드를 반드시 넣어야만 했습니다.
 클래스는 구조체와 구조는 비슷하지만, `mutating`키워드를 사용하지 않습니다.
 그저 메서드를 선언하고 사용하면 끝입니다.
 구조체의 경우 에러가 발생했지만 클래스는 아래와 같이 에러가 발생하지 않습니다.
 */

class Rectangle03 {
    var width: Int = 0
    var height: Int = 0
    func doubleArea() {
        self.width *= 2
    }
}
// 객체 생성
let rect03 = Rectangle03()
rect03.width = 10
rect03.height = 10
// 메서드 사용
rect03.doubleArea()
rect03.width // 20

/*:
 #### 인스턴스 메서드
 
 인스턴스 메서드는 위에서 보신 예시처럼 별다른 키워드 없이 선언된 메서드입니다.
 객체를 생성해야만 메서드를 사용할 수 있고, 프로퍼티에 접근이 가능합니다.
 */

/*:
 #### 타입 메서드
 
 타입 메서드는 일반적으로 객체를 생성하고 메서드를 사용하는 방식이 아니라, 객체를 생성하지 않고 사용할 수 있는 메서드입니다.
 대신 해당 클래스의 프로퍼티에는 접근이 불가능하고 메서드를 선언할 때 `static`키워드를 이용하면 타입 메서드를 만들 수 있습니다.
 */

class Rectangle04 {
    var width: Int = 0
    var height: Int = 0
    func doubleArea() {
        self.width *= 2
    }
    // error: instance member 'width' cannot be used on type 'Rectangle04'
    // static func staticDoubleArea() {
    //    self.width *= 2
    // }
    static func printWhoIAm() {
        // 이렇게 내부 프로퍼티에 접근하지 않는다면 에러가 발생하지 않습니다.
        print("I am Rectangle04!!")
    }
}
// 사용방법은 아래와 같습니다.
// 클래스이름.타입메서드이름()
Rectangle04.printWhoIAm()

//: [Next](@next)

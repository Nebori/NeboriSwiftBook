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

//: [Next](@next)

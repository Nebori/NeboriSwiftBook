//: [Previous](@previous)

/*:
 # ControlFlow
 
 안녕하세요. 이번 챕터에서는 프로그램이 실행될 때 어떤 흐름으로
 실행이 되는지 의도할 수 있는 흐름 제어에 대하여 알아보려고 합니다.
 
 흐름 제어는 크게 두 가지로 볼 수 있습니다.
 
 - 조건문
 - 반복문
 
 조건문은 말 그대로 어떠한 조건을 걸고, 이 조건의 결과에 따라
 그대로 흐르게 두거나, 아니라면 흐름을 꺾어 다른 곳으로 흐르게 만들 수 있습니다.
 반복문은 역시 개발자가 의도한 횟수만큼 해당 흐름을 몇 번 반복하게 만드는 것 입니다.
 
 지금부터 아래 내용을 잘 확인해주세요.
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.

 [Nebori Swift Book](https://github.com/Nebori/NeboriSwiftBook)
 */
import Foundation
/*:
 ****
 ## 조건문
 
 Swift에서 조건문은 총 3가지 방식을 사용할 수 있습니다.
 - if (else)
 - switch - case
 - guard
 바로 알아보도록 하겠습니다.
 */

let ifValue: Bool = true
// error: expected '{' after 'if' condition
// if ifValue print(test)
if ifValue {print("한줄이라도 중괄호를 잊지마세요!")}
if ifValue {
    print("다수의 줄도 예외는 없습니다.")
}


//: [Next](@next)

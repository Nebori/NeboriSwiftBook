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
if 3 > 2 {
    print("다수의 줄도 예외는 없습니다.")
}

/*:
 #### if-else문
 
 if-else문은 if문에서 추가 조건을 사용할 때 사용하거나,
 if문의 조건에 맞지 않을 때, else만을 이용하면 모든 흐름이 else의 코드만 작동하게 됩니다.
 코드로 보시는게 이해하시기 좋을 것 같습니다. 한번 보시죠.
 */

let ifValue02: Int = 10
if ifValue02 == 10 {
    // ifValue02가 값이 10이라면 이 부분이 작동하게 됩니다.
}
if ifValue02 != 10 {
    // ifValue02가 값이 10이 아니라면 이 부분이 작동하게 됩니다.
} else {
    // 하지만 ifValue02는 10이니 위 조건에 벗어나게 되어서
    // 반드시 이 부분에 들어오게 됩니다.
}

/*:
 그렇다면 조건이 많을 경우에는 어떻게하죠?
 
 예를 들어 임의의 문자열 학점이 있고,
 학점이 A일 경우 "공부를 잘하시네요!"라는 멘트를,
 B일 경우 "조금만 더 노력하세요!"라는 멘트를,
 위 두 조건 이외의 값이라면 "점수가 모든 것은 아닙니다!"라는 멘트를 화면에 찍어야 한다고 치겠습니다.
 */

let yourGrade: String = "B"
if yourGrade == "A" {
    print("공부를 잘하시네요!")
} else {
    if yourGrade == "B" {
        print("조금만 더 노력하세요!")
    } else {
        print("점수가 모든 것은 아닙니다!")
    }
}

/*:
 문제를 해결했습니다! 하지만 한눈에 들어오지는 않네요.
 위 코드를 else-if를 사용하여 추천드리는 모습으로 바꾸어보겠습니다.
 */

if yourGrade == "A" {
    print("공부를 잘하시네요!")
} else if yourGrade == "B" {
    print("조금만 더 노력하세요!")
} else {
    print("점수가 모든 것은 아닙니다!")
}

/*:
 어떤가요? 위쪽 코드보다 조금 더 가독성이 올라가지 않았나요?
 사실 위, 아래 모두 같은 동작을 보장합니다. 하지만 아래쪽 코드를 조금 더 추천드리는 바입니다.
 */

/*:
 ****
 ### guard
 
 guard문은 함수나 반복문에서 조건을 이용하여 해당 흐름에서 빠져나갈 때 사용하는 조건문입니다.
 else를 사용해서 꼭 해당 흐름에서 빠져나갈 수 있는 명령문이 포함되어야 합니다.
 예시를 위해서 반복문을 사용해서 보여드리겠습니다.
 */

for x in 1...10 {
    // 변수 x에 1부터 10까지 순서대로 넣으면서 작동하는 반복문
    print(x)
    guard x != 5 else {
        // x가 5가 아닐 때를 제외할 때 이 코드가 실행됩니다.
        // 즉, 5일 때 작동하는 코드입니다.
        break
    }
}

/*:
 위 내용을 보면, guard-else문은 if문과는 조건 방식이 조금 다릅니다.
 if문의 경우 조건이 참일 경우에 바디가 실행되지만,
 guard-else문의 경우 조건이 거짓일 경우에 바디가 실행되는 방식입니다.
 */

let ifValue03: Bool = true
if ifValue {
    print("if문은 참일 경우 실행이 됩니다.")
}
let ifValue04: Bool = false
for x in 1...10 {
    guard ifValue04 else {
        print("guard-else문은 거짓일 경우 실행이 됩니다.")
        break // 흐름에서 나갈 수 있는 명령문이 필수입니다!
    }
}

/*:
 ****
 ### Switch-case
 
 스위치는 어떤 변수가 가질 수 있는 가능한 값들을 모두 `case`를 이용하여 정의하고,
 해당 변수가 해당 `case`에 속할 때, 해당 `case`에 정의해놓은 코드가 작동하고 switch-case문을 빠져나가게 됩니다.
 하지만 모든 상황을 `case`로 정의해놓아야 할까요? 그렇지는 않습니다.
 개발자가 생각했을 때, 해당 변수가 어떠한 값일 때 특수한 처리를 해야할 경우에 `case`문을 이용하고, 그 이외의 값일 때는 `default`를 이용하면 됩니다.
 또, 어떠한 언어에서는 `break`를 사용하지 않을 경우 그 이후의 `case`를 모두 실행하는 경우도 있습니다. 하지만 Swift에서는 그렇지 않습니다.
 바로 코드로 보시겠습니다.
 */

let switchValue01: Int = 10
switch switchValue01 {
case 0:
    print("switchValue01는 0이다.")
case 5:
    print("switchValue01는 5다.")
case 10:
    print("switchValue01는 10이다.")
case 11...20:
    // 범위도 가능합니다.
    print("switchValue01는 11 ~ 20 사이의 값이다.")
default:
    print("switchValue01는 0, 5, 10이 아니다.")
}

/*:
 Switch-case문은 튜플도 조건을 검사할 수 있습니다.
 예를 들어서 한국에서 사용자의 성이 '김'이거나, 이름이 '바로'인 사람에게 안내 문자를 보내야 한다고 생각해봅시다.
 사용자에게 성과 이름을 튜플로 입력받아서 확인하는 작업을 예제로 보여드리겠습니다.
 예제를 한번 확인해 볼까요?
 */

let userName01: (String, String) = ("김", "성조")
let userName02: (String, String) = ("이", "바로")
let userName03: (String, String) = ("김", "바로")
let userNameArray = [userName01, userName02, userName03]
for nameTuple in userNameArray {
    // 아직 반복문은 보지 않았지만 nameTuple에
    // userName01, 02, 03이 순서대로 한번씩 값이 대입되면서
    // 총 3번이 반복되는 반복문입니다.
    // 위 반복문은 [김성조, 이바로, 김바로] 순서로 작동됩니다.
    switch nameTuple {
    case ("김", "바로"):
        print("성이 김이고, 이름도 바로시군요! 애타게 찾았습니다.")
    case ("김", _):
        print("성이 김이시군요!")
    case (_, "바로"):
        print("이름이 바로시군요!")
    default:
        print("저희가 찾는 분이 아니군요.")
    }
}

/*:
 위 프로그램의 결과는 다음과 같습니다.
 성이 김이시군요!
 이름이 바로시군요!
 성이 김이고, 이름도 바로시군요! 애타게 찾았습니다.
 */

/*:
 위 프로그램에서 처음보는 것이 있지 않으신가요?
 네 바로 `_`입니다. 두 번째, 세 번째 `case`에는 `_`가 포함되어 있습니다.
 이는 값을 바인딩(대입)할 때, 이 값은 무시하겠다. 라는 표시입니다.
 위 예시에서는 사용자가 성과 이름을 모두 넣었지만, 개발자가 나는 이름만 필요하다! 혹은 성만 필요하다! 하는 경우
 튜플로 되어있는 값중에 원하는 값만 빼내고 필요없는 값은 변수에 할당하지 않겠다는 표시인 것입니다.
 */

//: [Next](@next)

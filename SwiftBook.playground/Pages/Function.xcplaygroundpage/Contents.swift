//: [Previous](@previous)

import Foundation

/*:
 # Function
 
 안녕하세요.
 이번 챕터에서는 Function(함수, 메서드)에 대해서 알아보도록 하겠습니다.
 
 함수는 어떠한 동작을 나타내는 단위입니다.
 이전 챕터들에서 사용했었던 `print()`도 함수였죠.
 
 이 챕터에서 함수의 작성 방법과 사용 방법까지 쭉 익히시면 됩니다.
 
 지금부터 아래 내용을 잘 확인해주세요.
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.
 [Nebori Swift Book](https://github.com/Nebori/NeboriSwiftBook)
 */

/*:
 ****
 ## 함수의 정의
 
 변수도 사용하기 위해서는 정의를 하듯이 함수도 정의를 해야겠죠?
 함수를 정의하는 방법을 알아보도록 합니다.
 우선 함수의 구조부터 보여드리겠습니다. `[]`안에 있는 값은 생략 가능합니다.
 ```
 // 매개변수 x, 리턴타입 x
 func 함수이름() {
 // 함수 바디
 }
 // 매개변수 x, 리턴타입 o
 func 함수이름() -> 리턴타입 {
 // 함수 바디
 return 리턴타입의 값
 }
 // 매개변수 o, 리턴타입 x
 func 함수이름([외부별명] 내부별명: 타입) {
 // 함수 바디
 }
 // 매개변수 o, 리턴타입 o
 func 함수이름([외부별명] 내부별명: 타입) -> 리턴타입 {
 // 함수 바디
 return 리턴타입의 값
 }
 ```
 */

/*:
 그러면 이제 실제로 코드에서 어떻게 사용하는지 보여드리겠습니다.
 위 구조와 똑같은 순서로 작성하겠습니다.
 */
// 매개변수 x, 리턴타입 x
func chirp() {
    print("새가 chirp")
}
chirp()
// 매개변수 x, 리턴타입 o
func getChirp() -> String {
    return "새가 chirp"
}
print(getChirp())
// 매개변수 o, 리턴타입 x
func putChirp(chirp: String) {
    print("새가 \(chirp)")
}
putChirp(chirp: "chirp")
// 매개변수 o, 리턴타입 o
func putChirpAndGetChirp(chirp: String) -> String {
    return "새가 \(chirp)"
}
print(putChirpAndGetChirp(chirp: "chirp"))

//: [Next](@next)

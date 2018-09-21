//: [Previous](@previous)

/*:
 # Type 02
 
 안녕하세요. 이번 챕터에서는 저번 챕터에 이어서 데이터 타입에 대해서 더 알아보려고 합니다.
 저번에 다루지 못한 타입에 대해서 먼저 보여드릴께요.
 - 다수의 값를 다루는 타입
 - 사용자 타입
 지금부터 아래 내용을 잘 확인해주세요.
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.
 
 [Nebori Swift Book](https://github.com/Nebori/NeboriSwiftBook)
 */

/*:
 ### 다수의 값을 다루는 타입
 - 튜플
 - 배열
 - 사전
 - 셋
 하나씩 알아보도록 합니다.
 */
import Foundation
import Cocoa
/*:
 ****
 ### 튜플
 
 튜플은 가변적인 타입입니다.
 여러가지 값을 묶어서 사용이 가능한데 타입 이름을 지정하지는 않습니다.
 대신 다른 타입들을 `()`괄호 안에 묶어서 표현하는 특이한 방법을 사용합니다.
 타입 구분은 `,`쉼표를 사용합니다.
 */
let tupleValue = ("문자열", 100)

/*:
 타입 지정을 위해서는 `()`괄호 안에 타입을 적으면 됩니다.
 */
let tupleValue01: (String, Int) = ("이렇게", 100)

/*:
 튜플을 사용하는 방법은 세가지 방법정도로 나누어 볼 수 있습니다.
 
 변수에 할당을 할 때
 
 - 변수 한개로 할당을 받는 방법
 - 변수 한개로 할당 받되, 각 타입별 이름을 지정하는 방법
 - 괄호 안에 타입 갯수별로 따로 할당을 받는 방법
 
 말로 보면 좀 복잡합니다. 지금부터 코드로 예시를 들어드릴께요.
 */

/*:
 #### 변수 한개로 할당을 받는 방법
 
 위에 적은 것과 같은 방법입니다. 사용하는 방법까지 알아보죠.
 마치 배열처럼 사용 할 수 있습니다. 0은 첫번째 요소, 1은 두번째 요소죠.
 */
let tupleValue02: (String, Int) = ("문자열", 200)
tupleValue02.0 // "문자열"
tupleValue02.1 // 200

/*:
 #### 변수 한개로 할당 받되, 각 타입별 이름을 지정하는 방법
 
 할당은 위와 같이 하나의 변수로 받지만 타입 지정하는 곳을 주목해주세요.
 `first: String, second: Int`가 보이시나요?
 아래처럼 타입 지정할 때 앞에 별명을 붙여주면 해당 값을 이용할 때 별명을 이용해 값을 가져올 수 있습니다.
 별명이 있다고는 해도 역시나 위처럼 0, 1로도 값을 읽어 올 수 있습니다.
 */
let tupleValue03: (first: String, second: Int) = ("문자열", 200)
// 아래와 같이 선언해도 똑같은 선언
// let tupleValue03 = (first: "문자열", second: 200)
tupleValue03.first // "문자열"
tupleValue03.second // 200
tupleValue03.0 // "문자열"
tupleValue03.1 // 200

/*:
 위 코드를 보면 별명 타입 선언을 하거나, 별명 타입을 포함한 값은 별명으로 값 접근이 가능하다는 것을 알 수 있습니다.
 그런데 변수는 타입만 선언하고 값은 별명이 있다면? 별명으로 값 접근이 가능할까요?
 불가능합니다. 튜플 타입 변수를 선언할 때는 이점을 유의하여 코딩을 진행해주세요.
 */
let tupleValue04: (String, Int) = (first: "문자열", second: 200)
// error: value of tuple type '(String, Int)' has no member 'first'
//tupleValue04.first
tupleValue04.0 // "문자열"
tupleValue04.1 // 200

/*:
 #### 괄호 안에 타입 갯수별로 따로 할당을 받는 방법
 
 아예 변수를 여러개를 이용해서 값을 할당받는 방법입니다.
 괄호를 이용해서 대입하는 값과 같은 갯수로 변수를 만들어주면 해당 이름으로 해당 위치의 값을 이용할 수 있습니다.
 */
let (partTuple01, partTuple02) = ("문자열", 200)
partTuple01 // "문자열"
partTuple02 // 200

/*:
 #### 튜플과 타입 알리아스
 
 타입 알리아스는 타입 별칭을 정의해서 사용하는 것을 말합니다.
 별칭이란 어떠한 타입을 내가 원하는 별칭으로 만들어 해당 별칭을 호출하면 지정한 어떠한 타입을 호출한 것과 동일한 효과를 냅니다.
 아래 코드로 보시겠습니다.
 */
typealias Number = Int
let count: Number = 10

/*:
 `Int`를 `number`라는 별칭으로 부르겠다고 선언해주고, 두번째 줄에서 상수 `count`를 `number`별칭 타입으로 지정하고 10을 대입해 주었습니다.
 사실 위에 두 줄인 코드는 아래와 같다고 할 수 있겠습니다.
 */
let intCount: Int = 10

/*:
 여기서 왜 한 줄로 짤 수 있는 코드를 두 줄로 짜나요? 라고 물으신다면,
 예시이기 때문입니다. 라고 답변 드리고싶네요.
 타입 알리아스는 튜플에 사용하면 효과가 나타납니다.
 */
typealias Today = (year: Int, month: Int, day: Int)
let todayValue01: Today = (2018, 9, 20)
todayValue01.year // 2018
todayValue01.month // 9
todayValue01.day // 20

/*:
 코드 가독성에서도 타입 알리아스를 사용하는 것이 훨씬 낫다는 것을 느끼실 수 있습니다.
 */

/*:
 #### 튜플 비교
 
 튜플 간 비교는 다른 타입들처럼 사용하면 됩니다.
 */
(100, "swift") == (100, "swift") // true
("swift", 10.01) == ("swift", 10.02) // false

/*:
 #### 튜플 값 무시
 
 튜플 값 무시는 `_`를 사용하면 됩니다.
 튜플의 경우 한 가지 값이 아닌 다수의 값이 넘어오게 되는데 이중 필요하지 않은 값은 무시를 통해서 변수에 할당하지 않는 방법입니다.
 */
let ignoreTuple01 = (fir: "처음", sec: "둘째", thi: "셋째")
let (first, _, _) = ignoreTuple01

/*:
 위 코드의 경우 세 개의 값을 가진 튜플을 만들고, 값을 다른 각각의 변수에 대입하는 코드입니다.
 그런데 `_`가 두개 보이시나요? 그 두 개의 값은 무시한다는 표시입니다.
 여기에서 개발자는 `first`값 만 필요하기 때문에 해당 값만 사용하겠다. 라는 의미가 포함되어 있는 것입니다.
 */

/*:
 ****
 ### 콜렉션
 
 콜렉션도 다수의 값을 다룰 때 사용합니다.
 
 - 배열
    - 순서가 보장됨
    - 값의 중복이 가능함
 - 사전
    - 순서가 보장되지 않음
    - 값의 중복이 가능함 (키는 중복이 불가능함)
 - 셋
    - 순서가 보장되지 않음
    - 값의 중복이 불가능함
 
 지금부터 한개 씩 알아보도록 하겠습니다.
 */

/*:
 #### 배열
 
 배열은 순서가 보장되는 콜렉션입니다.
 인덱스 순서를 기반으로 작업을 할 때 유리합니다.
 배열은 두 가지 방법으로 선언을 할 수 있습니다.
 */
let arrayValue01: Array<String>
let arrayValue02: [String]

/*:
 동일한 타입을 가진 상수가 2개 만들어졌습니다.
 `Array<type>`이나 `[type]`가 모두 배열 타입으로 인식되므로 개발자 성격에 따라서 표현 방식이 다를 수도 있다는 점은 알고 계시면 좋습니다.
 다음으로 배열을 생성하는 방법들에 대해서 알아보겠습니다.
 */

/*:
 ##### 배열 생성
 */
var emptyArray01 = [Int]() // Int 타입의 빈 배열 생성
var emptyArray02 = Array<Int>() // Int 타입의 빈 배열 생성
var intArray01: [Int] = [1, 2, 3, 4, 5] // Int 타입의 5개의 원소를 갖는 배열 생성
var intArray02 = Array<Int>([1, 2, 3, 4, 5]) // Int 타입의 5개의 원소를 갖는 배열 생성

/*:
 ##### 배열 원소 접근방법
 
 배열의 원소에 접근하는 기본적인 방법은 인덱스를 이용하는 것 입니다.
 배열은 순서를 보장하기 때문에 값이 들어간 순서로 꺼낼 수 있습니다.
 */
var intArray03 = [1, 2, 3, 4, 5]
intArray03[0] // 1
intArray03[4] // 2
// Fatal error: Index out of range
// intArray03[5]

/*:
 그런데 배열을 생성하고 열심히 사용하다보면 현재 이 배열에 몇가지 원소가 존재하는지 알 수 없습니다.
 그런데 원소의 개수보다 많은 인덱스를 넣으면 에러가 발생한다면서요?
 네 맞습니다. 그래서 배열에는 몇개의 원소가 존재하는지 알 수 있는 방법이 있습니다.
 */
var intArray04 = [1, 2, 3, 4, 5]
intArray04.count
intArray04.isEmpty

/*:
 `count`를 이용하는 방법입니다. `count`는 배열에 몇개의 원소가 존재하는지 그 개수를 반환합니다. 위 코드의 경우 5개지요.
 `isEmpty`는 배열이 원소의 개수가 0개라면 `true`, 원소의 개수가 1개 이상이라면 `false`를 반환합니다.
 이렇게 개발자는 해당 배열이 비어있는지, 몇개의 원소가 존재하는지 확인하고 이 범위를 벗어나지 않도록 개발을 진행해야 합니다.
 */

/*:
 ##### 배열 원소 수정 및 추가
 
 배열을 `let`으로 선언하지 않았다면 원소를 추가하거나 수정할 수 있습니다.
 먼저 원소를 수정하는 방법을 보겠습니다.
 */
var intArray05: [Int] = [10, 10, 10]
intArray05[0] = 1
intArray05[1...2] = [2, 3]
intArray05

/*:
 직접 해당 인덱스를 넣고 변경하는 방법과, `...` 범위를 이용하여 여러 원소를 변경할 수도 있습니다.
 다음으로는 원소를 추가하는 방법을 알아보겠습니다.
 위에서 사용했던 `intArray05` 에 정수 4, 5를 추가하겠습니다.
 */

intArray05.append(4)
intArray05.append(5)
intArray05

/*:
 배열에서 원소를 삭제하는 방법은 아래와 같습니다.
 원소를 삭제하다가 원소가 삭제하려는 것보다 적거나 해당 위치에 값이 없으면 에러가 발생하니 주의해서 사용해야합니다
 */
intArray05.remove(at: 4) // 5번 째 원소를 삭제 (방은 0부터 시작)
intArray05.removeFirst() // 첫번 째 원소를 삭제
intArray05.removeLast() // 제일 뒤 원소를 삭제
intArray05

/*:
 ****
 #### 사전 (딕셔너리)
 
 딕셔너리는 키와 값을 매핑해서 다수의 값을 다루는 콜렉션입니다.
 값은 중복을 허용하지만 키는 중복을 허용하지 않습니다.
 */

/*:
 ##### 딕셔너리 생성
 */
var dicValue01 = [String: Int]() // 키는 String, 값은 Int 타입의 빈 딕셔너리 생성
var dicValue02 = Dictionary<String, Int>() // 키는 String, 값은 Int 타입의 빈 딕셔너리 생성
var dicValue03: [String: Int] = ["월요일": 1, "화요일": 2] // 키는 String, 값은 Int 타입의 2개의 키와 값을 갖는 딕셔너리 생성

/*:
 ##### 딕셔너리 원소 접근방법
 
 딕셔너리의 원소에 접근하는 방법은 찾고자 하는 값의 키를 이용하는 것 입니다.
 */
var dicValue04 = ["월요일": 1, "화요일": 2, "수요일": 3]
dicValue04["월요일"] // 1
dicValue04["화요일"] // 2
dicValue04["없는키"] // nil

/*:
 딕셔너리도 배열처럼 원소의 개수를 알 수 있는 방법이 있을까요? 네 있습니다.
 */

dicValue04.count // 3
dicValue04.isEmpty // false

/*:
 하지만 딕셔너리의 경우 인덱스를 이용해서 접근을 할 수가 없어서 원소의 갯수만을 알아서는 접근할 수는 없습니다.
 이럴 때 딕셔너리에는 모든 키를 가져오는 방법이 있습니다.
 이렇게 키를 모두 가져와서 필요한 키만 사용할 수 있겠습니다.
 */
print(dicValue04.keys) // "월요일", "화요일", "수요일"
dicValue04["월요일"] // 1

/*:
 ##### 딕셔너리 원소 수정 및 추가
 
 딕셔너리를 `let` 으로 선언하지 않았다면 원소를 추가하거나 수정할 수 있습니다.
 원소를 수정하는 방법입니다.
 배열과 똑같죠? 해당 원소를 찾은 후에 값을 대입해주면 수정이 완료됩니다.
 */

var dicValue05 = ["월요일": 1, "화요일": 2, "수요일": 3]
dicValue05["수요일"] = 4
dicValue05["수요일"] // 4

/*:
 이제는 딕셔너리에 원소를 추가하는 방법입니다.
 딕셔너리에 새로운 키를 넣고 값을 대입해주면 자동으로 키와 값이 추가됩니다.
 */

dicValue05["목요일"] = 4
dicValue05["금요일"] = 5

/*:
 딕셔너리에서 원소를 제거하는 방법은 아래와 같습니다.
 */

dicValue05["금요일"] = nil
dicValue05.removeValue(forKey: "목요일")
dicValue05 // ["수요일": 4, "화요일": 2, "월요일": 1]

/*:
 ****
 #### 셋
 
 셋은 유일한 원소를 다수개 다루는 콜렉션입니다.
 유일한 원소를 가진다는 점, 딕셔너리와는 다르게 키 없이 원소만 저장합니다.
 그러면 배열과 유일한 원소를 가진다는 점만 다른걸까요?
 아닙니다. 임의의 순서로, 순서가 보장되지 않는다는점이 또 다릅니다.
 */

/*:
 ##### 셋 생성
 
 사용하는 방식은 배열과 다르지 않습니다.
 하지만 유일한 원소를 넣지 않고 중복된 원소를 넣으려고 시도한다면? 에러가 발생하지 않습니다.
 유일한 값이 남게되죠. 아래 예시가 있습니다.
 */

let setValue01: Set<String> = ["apple", "orange", "grape"] // String 타입의 3개의 유일한 원소를 갖는 셋 생성
let setValue02 = Set<String>() // String 타입의 빈 셋 생성
let setValue03: Set<String> = ["apple", "apple"]
// 중복된 값이 2개가 들어가 ["apple"]만이 남게됩니다.

/*:
 ##### 셋 원소 접근방법
 
 셋 내 원소를 접근하기 위해서는 몇가지 방법이 있습니다. 아래 예시로 소개해드리겠습니다.
 */

let setValue04: Set<String> = ["apple", "orange", "grape"]
let value04Index = setValue04.index(after: setValue04.startIndex) // setValue04의 시작 인덱스 가져오기
setValue04[value04Index] // grape
setValue04.first // orange

/*:
 셋도 원소의 개수와 비어있는지 확인하는 방법이 똑같습니다.
 */

setValue04.count // 3
setValue04.isEmpty // false

/*:
 ##### 셋 원소 추가 및 삭제
 
 셋을 `let` 으로 선언하지 않았다면 추가 및 삭제가 가능합니다.
 `insert()` 메서드를 사용해서 원소를 추가할 수 있습니다.
 하지만 동일한 값을 넣었다면? 기존 원소에 덮어쓰기가 되면서 결과적으로 원소 개수가 증가하지 않습니다.
 */

var setValue05: Set<String> = ["apple", "orange", "grape"]
setValue05.insert("strawberry")
setValue05 // {"orange", "grape", "strawberry", "apple"}
setValue05.insert("apple")
setValue05 // {"orange", "grape", "strawberry", "apple"}

/*:
 다음은 삭제하는 방법입니다.
 `remove()` 메서드는 한개의 원소, `removeAll()` 메서드는 모든 원소를 삭제합니다.
 */

setValue05.remove("apple")
setValue05 // {"orange", "grape", "strawberry"}
setValue05.removeAll()
setValue05 // 비어버렸습니다.

/*:
 ##### 셋 집합 연산방법
 
 셋이 진가를 발휘하는 방법인 집합 연산입니다.
 교집합, 합집합, 여집합, 차집합 등 집합 연산을 이용할 수 있는게 바로 셋 입니다. 메서드를 먼저 알아볼까요?
 - 교집합: `intersection()` : 두 집합의 원소 중 같은 원소의 집합
 - 합집합: `union()` : 두 집합의 원소 모두를 합한 원소의 집합
 - 여집합: `symmetricDifference()` : 두 집합의 원소 중 같은 원소를 제외한 모든 원소의 집합
 - 차집합: `subtracting()` : 두 집합의 원소 중 같은 원소를 제외한 한쪽 집합
 
 바로 아래에 이해를 돕기 위한 이미지를 준비했습니다.
 
 ![set image](Type_02_Set.png)
 */

/*:
 아래는 간단한 집합 연산을 보여드리겠습니다.
 내가 키우는 동물 집합과 고양이 집합을 임의로 만들어 비교하는 예시입니다.
 */
var myAnimals: Set<String> = ["골든리트리버", "페르시안", "러시안", "래그돌", "거북이", "샴", "앵무새"]
var cat: Set<String> = ["페르시안", "러시안", "래그돌", "샴", "노르웨이숲", "브리티시쇼트헤어", "아비시니안"]

myAnimals.intersection(cat) // 두 집합에서 동일한 원소들
myAnimals.union(cat) // 두 집합을 모두 합친 원소들
myAnimals.symmetricDifference(cat) // 두 집합에서 서로 가지고 있지 않은 원소들
myAnimals.subtracting(cat) // myAnimals를 기준으로 cat이 가지고 있지 않은 원소들

/*:
 ****
 해당 챕터는 너무 양이 많아서 두 챕터로 나누게 되었습니다.
 튜플과 콜렉션 모두 많이 많이 중요한 부분입니다.
 앞으로 Swift로 개발을 진행하시면서 많이 보시고, 사용하고, 헷갈리는 부분입니다. (지금 저도 그렇습니다.)
 내용을 쭉 보시고 기본적인 느낌이라도 느끼고 가셨으면 좋겠습니다.
 고생하셨고, 봐주셔서 감사합니다. 다음에는 조금 더 좋은 내용으로 정리해서 가져오겠습니다.
 */

//: [Next](@next)
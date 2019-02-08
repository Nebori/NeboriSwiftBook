//: [Previous](@previous)

import Foundation

/*:
 # Inheritance
 
 안녕하세요.
 
 이번 챕터에서는 Inheritance(상속)에 대하여 알아보려고 합니다.
 
 
 
 여행 및 개인 프로젝트를 진행하면서 일정문제로 업로드를 꽤 오래 지속하지 못했습니다.
 
 시간이 괜찮을 때 조금씩 작성해서 업로드를 진행할 예정입니다.
 
 
 
 지금부터 아래 내용을 잘 확인해주세요.
 
 아래 내용은 모두 Xcode 10, Swift 4.2 에서 작성되었습니다.
 
 [Nebori Swift Book](https://github.com/Nebori/NeboriSwiftBook)
 */

/*:
 ## 상속
 
 혹시 '뉴 게임'이 있는 비디오 게임을 해보신 적이 있으신가요?
 
 게임과 친하지 않은분들도 계질지 모르니 잠시 설명드리겠습니다.
 
 스토리가 있는 게임에서 처음부터 결말까지 모두 클리어를 하게된 후 플레이어는 더 이상 진행할 내용이 없게 됩니다.
 
 물론 이 상태에서 오픈월드형 게임이라면 맵을 누빌 수는 있지만, 더 이상 진행 할 스토리가 없으니 심심할 수도 있게되죠.
 
 '뉴 게임'을 이용하면 현재 주인공의 상태는 그대로 유지 (예를 들면 레벨, 착용 장비 등)한채 스토리의 시작 부분으로 돌아가는 것입니다.
 
 여기서, 이 게임의 주인공은 현재 상태를 그대로 `상속`받게됩니다.
 
 `상속`받았다고 해서 똑같이 플레이를 할 필요는 없습니다. 사용하던 장비를 해제하고 다른 장비를 착용할 수도 있게됩니다.
 
 이렇게 Swift에서도 클래스간 `상속`을 이용할 수 있습니다.
 
 바로 클래스의 상속에 대해서 알아보도록 하겠습니다.
 */

/*:
 ### 클래스의 상속
 
 위에서 말씀드린 것 처럼 클래스도 부모 클래스의 프로퍼티, 메서드를 상속받을 수 있습니다.
 */

class OlderHero {
    var name: String
    var weapon: String
    var isLongerName: Bool {
        return name.count > 5
    }
    init(name: String, weapon: String) {
        self.name = name
        self.weapon = weapon
    }
    func infoPrint() {
        print("나는 \(name)이고, 무기는 \(weapon)입니다.")
    }
}

class NewHero: OlderHero {}

var hero01 = NewHero(name: "새로운최고영웅", weapon: "강한검")
hero01.infoPrint()
// 나는 새로운최고영웅이고, 무기는 강한검입니다.
hero01.weapon = "더강한검"
hero01.infoPrint()
// 나는 새로운최고영웅이고, 무기는 더강한검입니다.
if hero01.isLongerName {
    // 영웅의 이름이 5글자보다 많군요.
    // 위 예제는 이곳이 실행되겠네요.
} else {
    // 영웅의 이름이 5글자 이하군요.
}

/*:
 자녀 클래스는 부모 클래스를 상속만 받았을 뿐, 아무 구현도 하지 않았지만 부모 클래스가 가지고 있던 프로퍼티와 메서드를 모두 활용 가능한 것을 확인할 수 있습니다.
 */

/*:
 #### 재정의
 
 이제는 부모 클래스의 프로퍼티와 메서드를 재정의 하는 방법을 알아보려고 합니다.
 
 재정의는 부모 클래스에서 받은 프로퍼티나 메서드를 동일한 이름을 사용하지만, 다른 행동을 하도록 정의하는 것을 말합니다.
 */

class VarietyHero: OlderHero {
    override var isLongerName: Bool {
        return name.count > 3
    }
    override func infoPrint() {
        print("나는 빛나는 \(name)이고, 무기는 빛나는 \(weapon)입니다.")
    }
}
// 초기화는 재정의를 하지 않았기때문에 이전 init()메서드를 그대로 사용합니다.
var hero02 = VarietyHero(name: "영웅", weapon: "좋은검")
hero02.infoPrint()
// 나는 빛나는 영웅이고, 무기는 좋은검입니다.
if hero02.isLongerName {
    // 영웅의 이름이 3글자보다 많군요.
} else {
    // 영웅의 이름이 3글자 이하군요.
    // 위 예제는 이곳이 실행되겠네요.
}

/*:
 위 예제에서 볼 수 있듯이, 부모 클래스의 프로퍼티와 메서드를 상속받아 재정의를 할 수 있다는 것을 확인할 수 있습니다.
 
 하지만 재정의는 해당 프로퍼티와 메서드의 이름은 변경할 수 없기때문에 이는 주의해야합니다.
 */

/*:
 #### super
 
 `super`는 부모 클래스의 프로퍼티나 메서드에 접근할 때 사용할 수 있는 키워드입니다.
 */

class mutantHero: OlderHero {
    override func infoPrint() {
        print("나는 돌연변이 \(name)이고, 무기는 \(weapon)입니다.")
        // 부모의 infoPrint()는
        // print("나는 \(name)이고, 무기는 \(weapon)입니다.")
    }
    func allInfoPrint() {
        self.infoPrint() // 현재 클래스의 infoPrint()
        super.infoPrint() // 부모 클래스의 infoPrint()
    }
}

var hero03 = mutantHero(name: "영웅", weapon: "총")
hero03.allInfoPrint()
// 나는 돌연변이 영웅이고, 무기는 총입니다.
// 나는 영웅이고, 무기는 총입니다.

/*:
 super`는 상속받은 자식 클래스에서 부모 클래스에 접근하기 위해서 사용한다는 것을 볼 수 있습니다.
 */

/*:
 #### 자식 클래스의 초기화
 
 이번에는 부모 클래스와 이를 상속받은 자식 클래스에서 초기화가 필요한 프로퍼티가 있는 경우에 어떻게 처리를 하는지 알아보도록 하겠습니다.
 
 부모 클래스에서도 초기화가 필요한 프로퍼티가 있고, 상속받은 자식 클래스에서도 초기화가 필요한 프로퍼티가 있다고 가정하겠습니다.
 
 자식 클래스에서 초기화 메서드에 처리하는 순서는 아래와 같습니다.
 
 - 자식 클래스의 프로퍼티 초기화
 - 부모 클래스의 초기화 메서드 호출
 - 자식 클래스의 나머지 초기화 동작 (메서드 등)
 
 바로 아래 있는 예시로 확인해보세요.
 */

class UnfinishedHero {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "노네임")
    }
}
class ReadyHero: UnfinishedHero {
    var weapon: String
    init(weapon: String) {
        // 자식 클래스의 프로퍼티 초기화
        self.weapon = weapon
        // 부모 클래스의 지정 초기화 메서드 호출
        super.init(name: "노네임")
        // 자식 클래스의 나머지 초기화 동작
        self.printInfo()
    }
    init(name: String, weapon: String) {
        // 자식 클래스의 프로퍼티 초기화
        self.weapon = weapon
        // 부모 클래스의 지정 초기화 메서드 호출
        super.init(name: name)
        // 자식 클래스의 나머지 초기화 동작
        self.printInfo()
    }
    
    func printInfo() {
        print("내 이름은 \(name), 무기는 \(weapon)이다.")
    }
}

_ = ReadyHero(name: "불", weapon: "숯")
// 내 이름은 불, 무기는 숯이다.
_ = ReadyHero(weapon: "숯")
// 내 이름은 노네임, 무기는 숯이다.

//: [Next](@next)

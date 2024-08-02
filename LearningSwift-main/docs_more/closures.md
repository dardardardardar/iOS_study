# 클로저(Closures)

Swift에서는 func로 만드는 함수는 이름이 이미 붙어있는 클로저이고 그냥 클로저는 이름 없이 존재하다가 어디에 할당하면 그제야 이름 붙은 클로저가 된다.

```swift
func sayHello() {
    print("Hello")
}

let sayHi: () -> Void = { () -> Void in
    print("Hi")
}

var nextWork: () -> Void = sayHi
nextWork() // Hi

nextWork = sayHello
nextWork() // Hello

// 이름은 없지만 {...}으로 실체가 있는 클로저는
// ()를 붙여서 바로 실행해볼 수도 있다.
let result: String = { () -> String in
    return "Good morning"
}()

print(result) // Good morning
```

클로저는 다른 함수에 매개변수로 활용할 수도 있다.

```swift
func work(nextWork: () -> Void) {
    print("일하자. 다 끝났으면 nextWork를 하자")
    nextWork()
}

work(nextWork: {
    print("다음 일 하는 중...")
})

work {
    print("다음 일 하는 중...")
}

func sayHello() {
    print("다음 일 하는 중...")
}

work(nextWork: sayHello)


// 출력 결과:
//일하자. 다 끝났으면 nextWork를 하자
//다음 일 하는 중...
```

클로저는 타입의 프로퍼티로 삼을 수도 있다.

```swift
struct Student {
    var name: String
    
    // 기존의 전통적인 메서드는
    // Swift 입장에선 이름이 있는 클로저인 함수들이었다
    func sayHello() {
        print("\(name)님 안녕하세요")
    }
    
    // 이름이 없는 클로저를 프로퍼티에 지정해서
    // 메서드처럼 쓸 수 있을까? : OK
    var sayHi: () -> Void = {
        print("님 어서오고")
    }
}

var ned: Student = Student(name: "Ned Park")

ned.sayHello() // Ned Park님 안녕하세요

ned.sayHi() // 님 어서오고

// 심지어, 프로퍼티까 기능을 따로 바꿔서 지정할 수도 있다
ned.sayHi = {
    print("님 어서옵쇼")
}

ned.sayHi() // 님 어서옵쇼
```

배열을 정렬하는 sorted(by:) 메서드에 각종 클로저 표현식을 적용해보자.

```swift
var names: [String] = ["KIA", "삼성", "LG", "두산", "SSG", "NC", "KT", "한화", "롯데", "키움"]

// 따로 함수 만들어서 정렬에 필요한 클로저로 지정해줄 수 있다
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames: [String] = names.sorted(by: backward)
print(reversedNames)
// ["한화", "키움", "삼성", "롯데", "두산", "SSG", "NC", "LG", "KT", "KIA"]

// ----------------------------------

// 클로저를 바깥에 이름지어 할당시켜 만들고 써도 된다
var backwardClousure: (String, String) -> Bool
backwardClousure = { (s1: String, s2: String) -> Bool in
    return s1 > s2
}

reversedNames = names.sorted(by: backwardClousure)
print(reversedNames)

// ----------------------------------

// 하지만 언제 함수 이름지어 만들고 하겠나?
// 클로저로 바로 by에 코드까지 심어주자!
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reversedNames)

// ----------------------------------

// 위 코드는 한줄로 작성도 가능합니다
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
print(reversedNames)

// ----------------------------------

// 컨텍스트로 타입 추론 (Inferring Type From Context):
// sorted에서 by 항목으로 요구되는 타입은
// 현재 (String, String) -> Bool
// 이 정보를 알고있다 생각해서 축약/생략 가능하다
reversedNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})
print(reversedNames)


// ----------------------------------

// 단일 표현 클로저의 암시적 반환 (Implicit Returns from Single-Expression Closures)
// 클로저 내용에 return 명령줄 하나만 있어서 return은 생략 가능
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
print(reversedNames)

// ----------------------------------

// 짧은 인수 이름 (Shorthand Argument Names)
reversedNames = names.sorted(by: { $0 > $1 })
print(reversedNames)

// ----------------------------------

// 연산자 메서드 (Operator Methods)
reversedNames = names.sorted(by: > )
print(reversedNames)

// 우리가 만든 타입이 > 같은 비교연산자에 대응하게 하려면
// Comparable 프로토콜을 참고하세요


// ----------------------------------

// 후행클로저
reversedNames = names.sorted { s1, s2 in s1 > s2 }
print(reversedNames)

reversedNames = names.sorted { $0 > $1 }
print(reversedNames)
```

sorted외에도 map, filter 등의 메서드들도 클로저를 활용한다.

```swift
var names: [String] = ["KIA", "삼성", "LG", "두산", "SSG", "NC", "KT", "한화", "롯데", "키움"]

// sorted, map, filter, reduce, foreach
var result: [String] = names.map { name in
    return "\(name) 야구단"
}

print(result)
// ["KIA 야구단", "삼성 야구단", "LG 야구단", "두산 야구단", "SSG 야구단", "NC 야구단", "KT 야구단", "한화 야구단", "롯데 야구단", "키움 야구단"]

names.forEach { name in
    print("\(name) 야구팀 화이팅!")
}
/*
 KIA 야구팀 화이팅!
 삼성 야구팀 화이팅!
 LG 야구팀 화이팅!
 두산 야구팀 화이팅!
 SSG 야구팀 화이팅!
 NC 야구팀 화이팅!
 KT 야구팀 화이팅!
 한화 야구팀 화이팅!
 롯데 야구팀 화이팅!
 키움 야구팀 화이팅!
 */

var teams: [String] = names.filter { name in
    return name < "가"
}

print(teams)
// ["KIA", "LG", "SSG", "NC", "KT"]
```

## 참고자료

The Swift Programming Language (한국어)

- [클로저 (Closures)](https://bbiguduk.github.io/swift-book-korean/documentation/the-swift-programming-language-korean/closures)

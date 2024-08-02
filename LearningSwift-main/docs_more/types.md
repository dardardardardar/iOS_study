# 타입(Types)

## Extension

Extension은 기존에 존재하는 타입에 연산 프로퍼티와 메서드들을 추가할 수 있는 기능이다. 저장 프로퍼티를 추가 선언할 수는 없다.

```swift
extension String {
    func sayHello() -> String {
        let name: String = self
        return "Hello, \(name)"
    }
}

let name: String = "Ned"
print("\(name.sayHello())")
```

## 값 타입의 복사 할당과 Lazy

```swift
var tutor: String = "Ned"

// 값 타입을 매번 복사할 때마다
// 새로운 메모리 공간을 확보해서 할당하면
// 시간이 필요할 것이다
var tutor2: String = tutor

// Swift에서는 내부에서 지능적으로
// 처음 복사 할당할 경우엔 새로운 메모리를 확보해서 복사하지 않고
// 마치 참조타입처럼 작동하다가
// tutor/tutor2 어느 한쪽의 내용이 변경되면
// 그즈음에 실제로 새로운 메모리 확보/할당하는 복사 작업을 일으킨다 : LAZY
tutor2 = "Tuna"

print(tutor)
print(tutor2)
```

## 타입 변환

Swift는 "명시적" 타입 변환이 필요하다.

```swift
let point1: Int = 3
let point2: Double = 3.14

// Swift는 "명시적" 타입 변환이 필요하다

let result: Int = point1 + Int(point2)
print(result) // 6

let result2: Double = Double(point1) + point2
print(result2) // 6.140000000000001
```

부동소수점 값을 정수형으로 변환하면 소수점 이하는 버림한다.

```swift
print("\(Int(3.14))") // 3
print("\(Int(99.9))") // 99
print("\(Int(-3.14))") // -3
```

## 타입과 연산자

문자열은 + 연산자로 덧붙일 수 있다.

```swift
let cars: [String] = ["그랜저", "캐스퍼", "레이", "재규어", "마세리티 콰트로 포르테"]

var lineup: String = "저희가 준비한 차들은..."

for car in cars {
    lineup += car + ", "
}

print(lineup)
// 저희가 준비한 차들은...그랜저, 캐스퍼, 레이, 재규어, 마세리티 콰트로 포르테,
```

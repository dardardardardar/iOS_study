# 열거형

열거형과 함께 자주 쓰이는 문법인 switch에선, 모든 case를 준비했다면 default를 만들지 않아도 된다.

```swift
let isOK: Bool = true

if isOK {
    print("OK")
} else {
    print("not ok")
}

switch isOK {
case true:
    print("OK")
case false:
    print("not ok")
}
```

열거형은 값에서 원시값을 확인할 수 있고, 원시값에 해당하는 값도 확인할 수 있다. 원시값에 해당하는 값이 없다면 nil을 반환한다.

```swift
enum Country: Int {
    case ARG = 54
    case COL = 57
    case GBR = 44
    case USA = 1
    case ESP = 34
}

// ARG값의 원시값 보기
print(Country.ARG.rawValue) // 54

// 원시값이 34인 나라값 있는지 살펴보기
if let country: Country = Country(rawValue: 34) {
    print(country) // ESP
} else {
    print("해당 국가 없음")
}

// 존재하지 않으면 nil로 처리됨
if let country: Country = Country(rawValue: 134) {
    print(country) // ESP
} else {
    print("해당 국가 없음") // 해당 국가 없음
}
```

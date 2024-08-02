# 집합(Set)

Set은 순서 없이 내용의 중복을 허용하지 않는 컬랙션이다.

```swift
var lotto: Set<Int> = []

lotto.insert(3)
lotto.insert(5)
lotto.insert(1)
lotto.insert(3)
lotto.insert(1)

print(lotto)
// [5, 3, 1]
```

특정 항목을 삭제할 때는, 삭제한 내용을 옵셔널 타입으로 반환받을 수 있다.

```swift
var lotto: Set<Int> = []

lotto.insert(3)
lotto.insert(5)
lotto.insert(1)
lotto.insert(3)
lotto.insert(1)

var removed: Int? = lotto.remove(9)

if let removed {
    print("\(removed) 삭제 완료")
} else {
    print("삭제 대상 없음")
}

_ = lotto.remove(3)

print(lotto)
// [5, 3, 1]
```

contains 메서드로 포함여부를 확인할 수 있다. sorted() 메서드는 정렬된 배열을 반환한다.

```swift
// 현재 결승전 아르헨티나 선수들(등번호)
var players: Set<Int> = [
    23,
    4, 13, 25, 3,
    7, 20, 24,
    11, 10, 9
]

// 메시가 뛰고있나 확인해봅시다
if players.contains(10) {
    print("메시는 현재 뛰고 있습니다")
}

print("\(players)")
// [23, 11, 9, 24, 4, 10, 3, 7, 20, 13, 25]
// 실행마다 결과는 다르게 나온다

// 현재 선수들 목록을 출력해봅시다
for player in players {
    print("\(player)")
}

print("--------")

print(players.sorted())
// Set에 정렬 메서드를 사용하면 고정된 배열의 결과를 받는다
// [3, 4, 7, 9, 10, 11, 13, 20, 23, 24, 25]

for player in players.sorted() {
    print("\(player)")
}
```

합집합, 차집합, 여집합 같은 수학의 집합 개념을 적용할 수 있다.

```swift
let launchs: Set<String> = ["매운돼지갈비", "라면", "김밥", "이삭토스트", "갈치찜", "삼계탕", "맘스터치", "버거킹"]

let dinners: Set<String> = ["치킨", "곱창", "초밥", "보쌈", "장어", "피자", "조개구이", "버거킹", "라면", "김밥"]

// 교집합
print(launchs.intersection(dinners))
// ["라면", "김밥", "버거킹"]

// 대칭 차집합: 합집합에서 교집합 제외
print(launchs.symmetricDifference(dinners))
// ["조개구이", "매운돼지갈비", "피자", "갈치찜", "곱창", "이삭토스트", "치킨", "장어", "보쌈", "삼계탕", "맘스터치", "초밥"]

// 합집합
print(launchs.union(dinners))
// ["이삭토스트", "버거킹", "김밥", "매운돼지갈비", "치킨", "초밥", "맘스터치", "조개구이", "갈치찜", "삼계탕", "보쌈", "피자", "곱창", "장어", "라면"]

// 차집합: 순수하게 점심에만 언급된 것들
print(launchs.subtracting(dinners))
// ["갈치찜", "이삭토스트", "삼계탕", "맘스터치", "매운돼지갈비"]

// 차집합: 순수하게 저녁에만 언급된 것들
print(dinners.subtracting(launchs))
// ["조개구이", "장어", "치킨", "피자", "보쌈", "초밥", "곱창"]
```

내용들을 하나씩 꺼내어 확인할 수 있지만, 실행마다 그 순서는 달라진다.

```swift
let names: [String] = ["손흥민", "이강인", "김민재", "정우영", "정우영"]

var nameSet: Set<String> = []

for name in names {
    nameSet.insert(name)
}
        
print(nameSet)
// ["이강인", "손흥민", "김민재", "정우영"]
```

배열 안에 집합 만들기도 가능하다.

```swift
let finalPlayers: [Set<Int>] = [
    [23, 4, 13, 25, 3, 7, 20, 24, 11, 10, 9],
    [12, 17, 23, 2, 4, 16, 6, 7, 10, 11, 24]
]
```

딕셔너리의 값으로 집합 쓰기도 가능하다.
```swift
let copaFinalPlays: [String: Set<Int>] = [
    "ARG": [23, 4, 13, 25, 3, 7, 20, 24, 11, 10, 9],
    "COL": [12, 17, 23, 2, 4, 16, 6, 7, 10, 11, 24]
]
```

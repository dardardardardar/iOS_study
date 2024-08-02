# 자동 클로저 (Auto Closures)

다음과 같이 먹거리들을 준비하고 하나씩 먹은 내용을 출력하도록 코드를 작성합시다.

```swift
var wantToEat: [String] = ["오므라이스", "라면", "야채볶음밥", "차돌짬뽕", "제육", "감자전", "비빔국수", "아이스크림라떼", "삼겹살"]

print("현재 메뉴는 \(wantToEat.count)개") // 9

// 하나씩 먹어서 해치우기 클로저를 만들어봅시다
// 배열에서 맨 앞의 것부터 하나씩 해치우고
// 먹은 것은 return으로 받아냅시다
let eat: () -> String = {
    let menu: String = wantToEat.removeFirst()
    return menu
}

var eatMenu: String = eat()
print("내가 먹은 음식은 \(eatMenu)")

print("남은 메뉴는 \(wantToEat.count)개")
```

이제 먹거리를 대접하는 함수를 만들어봅시다. 먹는 일은 밖에서 지정하도록 매개변수로 만듭니다.

```swift
func serve(eating: () -> String) {
    let result: String = eating()
    print("먹거리 대접 : \(result)")
}

serve(eating: {
    let menu: String = wantToEat.removeLast()
    return menu
})

serve {
    let menu: String = wantToEat.removeLast()
    return menu
}

serve {
    return wantToEat.removeLast()
}

print("남은 메뉴는 \(wantToEat.count)개")
```

위 먹거리 대접 함수에 자동클로저를 끼얹어봅시다. 자동클로저는 해당 클로저의 받는 부분이 ()로 아무 것도 안받아야 합니다.

```swift
func serveKiosk(eating: @autoclosure () -> String) {
    let result: String = eating()
    print("먹거리 대접 : \(result)")
}

// 자동클로저는 한줄짜리 실행문을 클로저로 만들어서
// 그 결과를 반영하도록 만들어줍니다.
// 아래코드를 실행하면, 보통은 wantToEat.removeFirst()를 먼저 실행하고
// 그 결과인 String을 eating에 넘긴다고 생각하지만,
// 자동클로저는 wantToEat.removeFirst() 코드를 그대로 받아서
// 내부에서 활용할 때 적절한 타이밍에 실행하고 결과를 반영합니다.
serveKiosk(eating: wantToEat.removeFirst())

print("남은 메뉴는 \(wantToEat.count)개")
```

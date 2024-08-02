# 옵셔널 체이닝(Optional Chaining)

가장 간단한 사례를 보여드리겠습니다.

```swift
print(["ABC", "B", "C"].first?.count ?? "-1") // 3
print(Array<String>().last?.count ?? "-1") // -1
```

우리가 만드는 데이터 타입들이 has-a라는 포함관계로 이어지면, 체이닝 방식으로 세부 내용에 접근할 수 있습니다.

```swift
struct School {
    var name: String
    var student: [Student] // has-a(포함) 관계
}

struct Student {
    var name: String
    var prize: String
}

var appSchool: School = School(
    name: "앱스쿨: iOS 6기",
    student: [
        Student(name: "Ned", prize: "장학생"),
        Student(name: "Tuna", prize: "개근상"),
    ])

if let name: String = appSchool.student.first?.name {
    print(name)
}
```

만약 포함관계 사이의 특정 프로퍼티가 옵셔널 타입이라면, 체인은 이제 옵셔널 체인으로 ? 표시가 들어갈 순간이 생깁니다.

```swift
struct Car {
    var name: String
    var connectedPhone: Phone?
}

struct Phone {
    var name: String
    
    var showNavigation: (() -> Void)? = {
        print("길을 안내하겠습니다.")
    }
}

var myCar: Car? = Car(
    name: "붕붕이",
    connectedPhone: Phone(name: "나의 아이폰")
)

// 옵셔널들 때문에, nil일 가능성을 배제하려고 if let들이 여러번 나올 수도 있다.
if let car = myCar {
    if let phone = car.connectedPhone {
        if let navigation = phone.showNavigation {
            navigation()
        }
    }
}

// 그나마 옵셔널 바인딩들을 묶어서 코드 줄이는 방법이 있다.
if let car = myCar, let phone = car.connectedPhone, let navigation = phone.showNavigation {
            navigation()
}

// 옵셔널 체이닝으로 한줄로 깔끔하게 끝내자
myCar?.connectedPhone?.showNavigation?()
```

옵셔널 체이닝은 앱을 만들면서 자연스럽게 접할 수도 있습니다.

```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelHello: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showHello(_ sender: Any) {
        // 이것이 옵셔널 체이닝 입니다!
        labelHello?.text = "Hello"
    }
    
}
```

## subscript 메서드를 알아봅시다

```swift
struct School {
    var name: String = "앱스쿨"
    var students: [Student] = [
        Student(name: "둘리"),
        Student(name: "또치"),
        Student(name: "도우너"),
        Student(name: "고길동"),
    ]
    
    subscript(index: Int) -> Student {
        get {
            return students[index]
        }
        
        set {
            students[index] = newValue
        }
    }
}

struct Student {
    var name: String
}

var appSchool: School = School()
print(appSchool.students.first?.name ?? "학생정보 없음")

// 위 처럼 길게 학생 이름 찾기 귀찮아서 줄여보기로 했다 - subscript
print(appSchool[2].name)
```

## 참고자료

The Swift Programming Language (한국어)

- [옵셔널 체이닝](https://bbiguduk.github.io/swift-book-korean/documentation/the-swift-programming-language-korean/optionalchaining)
- [서브스크립트](https://bbiguduk.github.io/swift-book-korean/documentation/the-swift-programming-language-korean/subscripts)
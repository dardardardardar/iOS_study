# 프로퍼티 관찰자(Property Observer)

프로퍼티 관찰자로 프로퍼티의 값을 업데이트 하기 전과 후에 특정한 일을 더 할 수 있다.

```swift
struct Student {
    // 저장 프로퍼티
    var name: String
    
    // 연산 프로퍼티
    var callName: String {
        get {
            return "\(name) 학생"
        }
    }
    
    // 프로퍼티 관찰자가 있는 저장 프로퍼티
    var point: Int = 0 {
        willSet {
            print("새로운 값으로 \(point)를 \(newValue)로 업데이트 예정")
        }
        
        didSet {
            print("\(oldValue)를 \(point)로 업데이트 완료")
        }
    }
    
    // 프로퍼티 관찰자의 항목 이름을 직접 정해볼 수도 있습니다
    var nickname: String = "(아직 없음)" {
        willSet(newName) {
            print("닉네임을 \(nickname)에서 \(newName)으로 업데이트 예정")
        }
        
        didSet(oldName) {
            print("직네임을 \(oldName)에서 \(nickname)으로 업데이트 완료")
        }
    }
}

var ned: Student = Student(name: "Ned Park")
print(ned.callName) // Ned Park 학생

ned.point = 100
// 새로운 값으로 0를 100로 업데이트 예정
// 0를 100로 업데이트 완료
print(ned.point)
// 100

ned.nickname = "icebomb"
//닉네임을 (아직 없음)에서 icebomb으로 업데이트 예정
//직네임을 (아직 없음)에서 icebomb으로 업데이트 완료

ned.nickname = "Tutor"
//닉네임을 icebomb에서 Tutor으로 업데이트 예정
//직네임을 icebomb에서 Tutor으로 업데이트 완료
```
//
//  LogStore.swift
//  MyLogApp
//
//  Created by Mac on 7/25/24.
//

import Foundation

class LogStore: ObservableObject {
    @Published var logs: [Log] = [
        Log(text: "안녕",emotion: "😀"),
        Log(text: "만두",emotion: "😭"),
        Log(text: "힘들다",emotion: "😂"),
    ]

// 최신순 정렬
// deleteLog랑 안 맞아서 오류 발생(일단 사용X)
var displayLog: [Log] {
    get {
        logs.sorted {
            $0.date > $1.date
        }
    }
}
    
    func addLog(text: String, emotion:String) {
        let log : Log = Log(text: text,emotion: emotion)
        logs.append(log)
    }
    
    func deleteLog(at offsets: IndexSet) {
        logs.remove(atOffsets: offsets)
    }
}

//
//  GameViewModel.swift
//  RockScissorsPaperGame
//
//  Created by 이다영 on 7/26/24.
//
//가위:1 바위:2 보:3
//배열로 비교하는게 나으려나

import Foundation

class GameViewModel: ObservableObject {
    @Published private(set) var model: GameModel = GameModel()
    
    var userChoice: String {
        get {
            model.userChoice
        }
    }
    
    var computerChoice: String {
        get {
            model.computerChoice
        }
    }
    
    var choiceList: [String] {
        get {
            model.choiceList
        }
    }
    var computerResult: String { model.printComputerResult }
    var result: String { model.result }
    
    //사용자의 선택 값을 넣어주기
    func insertUserChoice(at index: Int) {
           guard index >= 0 && index < model.choiceList.count else {
               // 인덱스가 유효하지 않은 경우 처리
               print("Invalid index")
               return
           }
           model.userChoice = model.choiceList[index]
       }
    
    //컴퓨터의 값 랜덤으로 넣어주기
    func insertComputerChoice() {
        let randomeIndex = Int.random(in: 0..<model.choiceList.count)
        model.computerChoice = model.choiceList[randomeIndex]
        determineResult()
        model.printComputerResult = model.printComputerList[randomeIndex]
        
    }
    
    // 결과 계산 후 출력
    private func determineResult() {
        let user = model.userChoice
        let computer = model.computerChoice
        
        if user == computer {
            model.result = "무승부 😪"
        } else if ( user == "가위" && computer == "보") ||
                    ( user == "바위" && computer == "가위") ||
                    ( user == "보" && computer == "바위") {
            model.result = "이겼습니다 🎉"
        } else {
            model.result = "졌습니다 👎"
        }
    }
    
    
}

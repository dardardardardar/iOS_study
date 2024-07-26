//
//  GameModel.swift
//  RockScissorsPaperGame
//
//  Created by 이다영 on 7/26/24.
//

import Foundation

struct GameModel {
    var choiceList: [String] = ["가위", "바위", "보"]
    var printComputerList: [String] = ["✌🏻", "✊🏻", "✋🏻"]
    var printComputerResult: String = ""
    var userChoice: String = ""
    var computerChoice: String = ""
    var result: String = "선택해주세요"
}

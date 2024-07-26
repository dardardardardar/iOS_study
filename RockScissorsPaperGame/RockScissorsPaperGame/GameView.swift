//
//  ContentView.swift
//  RockScissorsPaperGame
//
//  Created by 이다영 on 7/26/24.
//

import SwiftUI

struct GameView: View {
    @ObservedObject private var viewModel: GameViewModel = GameViewModel()
    @State private var selectedChoice: String? = nil
    
    var body: some View {
        
        VStack {
            Text("< 가위바위보 게임 >")
                .padding(.top, 50)
                .bold()
                .font(.title2)
            
            Text("나")
                .padding(.top)
                .padding(.bottom, 0.4)
            
            HStack {
                Button(action: {
                    viewModel.insertUserChoice(at: 0)
                    selectedChoice = viewModel.choiceList[0]
                    viewModel.insertComputerChoice()
                }, label: {
                    Text("✌🏻")
                }).background(selectedChoice == viewModel.choiceList[0] ? backgroundColor(for: viewModel.result) : Color.clear) // 클릭된 버튼 색상 변경
                    .foregroundColor(.white)
                    .clipShape(Circle())
                
                Button(action: {
                    viewModel.insertUserChoice(at: 1)
                    selectedChoice = viewModel.choiceList[1]
                    viewModel.insertComputerChoice()
                    
                }, label: {
                    Text("✊🏻")
                }).background(selectedChoice == viewModel.choiceList[1] ? backgroundColor(for: viewModel.result) : Color.clear) // 클릭된 버튼 색상 변경
                    .foregroundColor(.white)
                    .clipShape(Circle())
                
                Button(action: {
                    viewModel.insertUserChoice(at: 2)
                    selectedChoice = viewModel.choiceList[2]
                    viewModel.insertComputerChoice()
                }, label: {
                    Text("✋🏻")
                }).background(selectedChoice == viewModel.choiceList[2] ? backgroundColor(for: viewModel.result) : Color.clear) // 클릭된 버튼 색상 변경
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .font(.system(size: 70))
            .padding()
            
            Text("VS")
                .font(.system(size: 50))
            
            Text("컴퓨터")
                .padding(.top)
                .padding(.bottom, 0.4)
            
            Text(viewModel.model.printComputerResult)
                .font(.system(size: 70))
                .padding(.bottom, 70)
            
            
            Text(viewModel.result)
                .frame(maxWidth: .infinity) // 최대 너비를 화면 끝까지
                .padding()
                .background(backgroundColor(for: viewModel.result))
                .foregroundColor(.white) // 텍스트 색상 흰색
                .font(.title) // 텍스트 크기
        }
        Spacer()
    }
    
    private func backgroundColor(for result: String) -> Color {
        switch result {
        case "무승부 😪":
            return Color.mint
        case "이겼습니다 🎉":
            return Color.blue
        case "졌습니다 👎":
            return Color.red
        default:
            return Color.gray
            
        }
    }
}

#Preview {
    GameView()
}

//
//  ContentView.swift
//  MyLogApp
//
//  Created by Mac on 7/25/24.
//

import SwiftUI

struct MyLog: View {
    @StateObject var logStore: LogStore = LogStore()
    @State var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationStack{
            List {
               
                    Section {
                        ForEach(logStore.logs) { log in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(log.text)
                                    Text(log.emotion)
                                }
                                Text(log.displayDate)
                            }
                    }
                        .onDelete(perform: logStore.deleteLog)
                }
                
            }
            
            .navigationTitle("My Log")
            .toolbar{
                ToolbarItem(placement: .automatic) {
                Button {
                    isShowingSheet.toggle()
                    } label: {
                        Label("Add a Log" , systemImage: "square.and.pencil")
                    }
            }
    }
                        .sheet(isPresented: $isShowingSheet) {
                            AddingLogView(isShowingSheet: $isShowingSheet, logStore: logStore)
                }
        }
    }
}
struct AddingLogView: View {
    @State var emotion:String = ""
    @Binding var isShowingSheet: Bool
    
    var logStore:LogStore
    @State private var text:String = ""
                    
    var body: some View {
        NavigationStack {
            VStack{
                TextEditor(text: $text)
                    .padding()
                HStack{
                    Button("😀"){
                        emotion = "😀"
                    }
                    Button("😂"){
                        emotion = "😂"
                    }
                    Button("😎"){
                        emotion = "😎"
                    }
                    Button("😭"){
                        emotion = "😭"
                    }
                    Button("😤"){
                        emotion = "😤"
                    }
                    
                }
                .font(.largeTitle)
                
                if !text.isEmpty {
                    Button("Save") {
                        logStore.addLog(text: text,emotion: emotion)
                        isShowingSheet.toggle()
                    }
                    .padding()
                }
            }
            .navigationTitle("Add a log")
        }
    }
}

#Preview {
    MyLog()
}
                    

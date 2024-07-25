//
//  GameView.swift
//  BasketCount
//
//  Created by Jongwook Park on 7/25/24.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    HStack {
                        Spacer()
                        Text("0")
                            .padding()
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Spacer()
                        Text("0")
                            .padding()
                        Spacer()
                    }
                    .padding()
                }
                HStack {
                    Button(action: {
                        print("+1")
                    }, label: {
                        HStack {
                            Spacer()
                            Text("+1")
                                .padding()
                            Spacer()
                        }
                        .background(Color.orange)
                        .foregroundStyle(Color.white)
                        .padding()
                    })
                    
                    Button(action: {
                        print("+1")
                    }, label: {
                        HStack {
                            Spacer()
                            Text("+1")
                                .padding()
                            Spacer()
                        }
                        .background(Color.orange)
                        .foregroundStyle(Color.white)
                        .padding()
                    })
                }
                
                HStack {
                    HStack {
                        Spacer()
                        Text("+2")
                            .padding()
                        Spacer()
                    }
                    .background(Color.blue)
                    .padding()
                    
                    HStack {
                        Spacer()
                        Text("+2")
                            .padding()
                        Spacer()
                    }
                    .background(Color.blue)
                    .padding()
                }
                
                HStack {
                    HStack {
                        Spacer()
                        Text("+1")
                            .padding()
                        Spacer()
                    }
                    .background(Color.gray)
                    .padding()
                    
                    HStack {
                        Spacer()
                        Text("+1")
                            .padding()
                        Spacer()
                    }
                    .background(Color.gray)
                    .padding()
                }
            }
            .font(.largeTitle)
            .navigationTitle("3x3")
        }
    }
}

#Preview {
    GameView()
}

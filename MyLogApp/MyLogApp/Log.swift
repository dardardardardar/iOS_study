//
//  Log.swift
//  MyLogApp
//
//  Created by Mac on 7/25/24.
//

import Foundation

struct Log: Identifiable {
    var id: UUID = UUID()
    
    var text:String
    
    var date:Date = Date()
    
    var emotion:String
    
    var displayDate:String {
        get {
            let formetter: DateFormatter = DateFormatter()
            formetter.dateStyle = .medium
            formetter.timeStyle = .short
            return formetter.string(from: date)
        }
    }
}

//
//  Task.swift
//  TodoboxSelf
//
//  Created by 송지연 on 2022/07/28.
//

struct Task{
    var title: String
    var note: String?
    var done: Bool = false
    
    init(title: String, note: String? = nil, done: Bool = false){
        self.title = title
        self.note = note
        self.done = done
    }
}



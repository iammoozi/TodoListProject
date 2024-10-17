//
//  TodoModle.swift
//  TodoListProject
//
//  Created by 김재윤 on 10/17/24.
//

import Foundation

struct TodoModel: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

extension TodoModel{
    static var MOCK_DATA:[TodoModel]{
        get {
            return [
                TodoModel(title: "알고리즘 공부하기"),
                TodoModel(title: "swift5 문법 공부하기"),
                TodoModel(title: "저녁 식사하기"),
                TodoModel(title: "런닝"),
                TodoModel(title: "ios app devlopment"),
            ]
        }
    }
}

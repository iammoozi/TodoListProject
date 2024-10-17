//
//  TodoModle.swift
//  TodoListProject
//
//  Created by 김재윤 on 10/17/24.
//

import Foundation

struct TodoModle: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

extension TodoModle {
    static var MOCK_DATA:[TodoModle]{
        get {
            return [
                TodoModle(title: "알고리즘 공부하기"),
                TodoModle(title: "swift5 문법 공부하기"),
                TodoModle(title: "저녁 식사하기"),
                TodoModle(title: "런닝"),
                TodoModle(title: "ios app devlopment"),
            ]
        }
    }
}

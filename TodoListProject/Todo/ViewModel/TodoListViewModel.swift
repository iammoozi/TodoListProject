//
//  TodoListViewModel.swift
//  TodoListProject
//
//  Created by 김재윤 on 10/17/24.
//
// todoitem배열에 요소를 추가하고 제거하는 로직은 여기에 
import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todoItem:[TodoModel] = [] // 에플에서 제공하는 coredata를 통해서 앱을 종료했을때 사라지는 데이터를 막을 수 있다.
    @Published var isPresented: Bool = false
    
    func addItem(title: String){
        let newItem = TodoModel(title: title)
        todoItem.append(newItem)
    }
    
    func removeItem(at offsets: IndexSet){
        todoItem.remove(atOffsets: offsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int){
        todoItem.move(fromOffsets: source, toOffset: destination)
    }
    
    func toggleItem(item: TodoModel){
        if let index = todoItem.firstIndex(where: {
            (originalItem) -> Bool in
            return originalItem.id == item.id
        }){
            todoItem[index].isCompleted.toggle()
        }
    }
}

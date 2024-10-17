//
//  TodoListView.swift
//  TodoListProject
//
//  Created by 김재윤 on 10/17/24.
//

import SwiftUI

struct TodoListView: View {
    @State var todoItem:[TodoModel] = TodoModel.MOCK_DATA
    @State var isPresented: Bool = false
    
    
    
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
    
    var body: some View {
        NavigationStack{
            VStack {
                List{
                    Section("할일 목록"){
                        ForEach(todoItem) { item in
                            if !item.isCompleted{
                                HStack{
                                    Text(item.title)
                                    Spacer()
                                    Image(systemName: item.isCompleted
                                          ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted
                                                     ? .green : .gray)
                                    .onTapGesture {
                                        // iscomplete toggle()
                                        toggleItem(item: item)
                                    }
                                }
                            }
                        }
                    }
                    Section("완료 목록"){
                        ForEach(todoItem) { item in
                            if item.isCompleted{
                                HStack{
                                    Text(item.title)
                                    Spacer()
                                    Image(systemName: item.isCompleted
                                          ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted
                                                     ? .green : .gray)

                                    .onTapGesture {
                                        // iscomplete toggle()
                                        toggleItem(item: item)
                                    }
                                }
                            }
                        }
                    }
                    
                }
                .listStyle(PlainListStyle())
                
                Button("생성하기") {
                    isPresented.toggle()
                }
                .frame(width: 200, height: 30)
                .padding()
                .foregroundColor(Color(.white))
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .sheet(isPresented: $isPresented){
                    NewTodoListView(todoItem: $todoItem, isPresented:
                    $isPresented)
                }
            }
            .navigationTitle("Todo List")
            .navigationBarItems(trailing: EditButton())
        }
        .padding()
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View{
        TodoListView()
    }
}

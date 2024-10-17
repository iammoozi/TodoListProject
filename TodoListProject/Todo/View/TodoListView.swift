//
//  TodoListView.swift
//  TodoListProject
//
//  Created by 김재윤 on 10/17/24.
//
// 일반적인 배열을 출력하는 뷰
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                List{
                    Section("할일 목록"){
                        ForEach(viewModel.todoItem) { item in
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
                                        viewModel.toggleItem(item: item)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                        .onMove(perform: viewModel.moveItem)
                    }
                    Section("완료 목록"){
                        ForEach(viewModel.todoItem) { item in
                            if item.isCompleted{
                                HStack{
                                    Text(item.title)
                                        .foregroundColor(Color(.systemGray3))
                                        .strikethrough()
                                    Spacer()
                                    Image(systemName: item.isCompleted
                                          ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted
                                                     ? .green : .gray)

                                    .onTapGesture {
                                        // iscomplete toggle()
                                        viewModel.toggleItem(item: item)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                        .onMove(perform: viewModel.moveItem)
                    }
                    
                    
                }
                .listStyle(PlainListStyle())
                
                Button("생성하기") {
                    viewModel.isPresented.toggle()
                }
                .frame(width: 200, height: 30)
                .padding()
                .foregroundColor(Color(.white))
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .sheet(isPresented: $viewModel.isPresented){
                    NewTodoListView(viewModel: viewModel)
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

//
//  NewTodoListView.swift
//  TodoListProject
//
//  Created by 김재윤 on 10/17/24.
//

import SwiftUI

struct NewTodoListView: View {
    
    @State var newTodoListTitle: String = ""
    @Binding var todoItem: [TodoModel]
    @Binding var isPresented: Bool
    
    func addItem(title: String){
        let newItem = TodoModel(title: title)
        todoItem.append(newItem)
    }
    
    
    var body: some View {
        VStack{
            Text("새로운 할 일을 추가해보세요")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment: .leading){
                Text("새로운 할 일")
                    .font(.subheadline)
                    .foregroundColor(Color(.gray))
                TextField("", text: $newTodoListTitle)
                    .frame(width: 300 , height: 20)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
            }
            .padding([.top],30)
            Button("완료"){
                addItem(title: newTodoListTitle)
                newTodoListTitle = ""
                isPresented.toggle()
            }
            .frame(width: 200, height: 30)
            .padding()
            .foregroundColor(Color(.white))
            .background(Color(.systemBlue))
            .cornerRadius(10)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding([.top],50)
        .background(Color(.systemGray6))
    }
}

//
//struct NewTodoListView_Previews: PreviewProvider{
//    static var previews: some View{
//        NewTodoListView()
//    }
//}

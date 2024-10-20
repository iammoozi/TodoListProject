//
//  NewTodoListView.swift
//  TodoListProject
//
//  Created by 김재윤 on 10/17/24.
//
// 새롭게 만들어진 투두를 제외하고는 추가적으로 관리하는 데이터,로직 없음
import SwiftUI

struct NewTodoListView: View {
    @StateObject var viewModel: TodoListViewModel
    @State private var newTodoListTitle: String = ""
    
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
                viewModel.addItem(title: newTodoListTitle)
                newTodoListTitle = ""
                viewModel.isPresented.toggle()
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

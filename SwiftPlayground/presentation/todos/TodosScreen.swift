//
//  TodoListView.swift
//  SwiftPlayground
//
//  Created by Peter Chege on 14/02/2026.
//


import SwiftUI
import SwiftData

struct TodosScreen: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Todo.createdAt, order: .reverse)
    private var todos: [Todo]
    
    @State private var newTitle: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // Input Field
                HStack {
                    TextField("New todo...", text: $newTitle)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Add") {
                        addTodo()
                    }
                    .disabled(newTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding()
                
                // Todo List
                List {
                    ForEach(todos) { todo in
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(todo.isCompleted ? .green : .secondary)
                                .onTapGesture {
                                    toggle(todo)
                                }
                            
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                        }
                    }
                    .onDelete(perform: deleteTodo)
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Todos")
        }
    }
    
    private func addTodo() {
        let todo = Todo(title: newTitle)
        context.insert(todo)
        newTitle = ""
    }
    
    private func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            context.delete(todos[index])
        }
    }
    
    private func toggle(_ todo: Todo) {
        todo.isCompleted.toggle()
    }
}

#Preview {
    TodosScreen()
}

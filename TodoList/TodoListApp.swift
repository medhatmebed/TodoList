//
//  TodoListApp.swift
//  TodoList
//
//  Created by Medhat Mebed on 12/26/23.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}

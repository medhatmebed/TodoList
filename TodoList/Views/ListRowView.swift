//
//  ListRowView.swift
//  TodoList
//
//  Created by Medhat Mebed on 12/26/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
   
    ListRowView(item: ItemModel(title: "first titkle", isCompleted: false))
//    ListRowView(item: item1)
//    ListRowView(item: item2)
}

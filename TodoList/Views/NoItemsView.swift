//
//  NoItemsView.swift
//  TodoList
//
//  Created by Medhat Mebed on 12/27/23.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView {
            VStack {
                Text("there're no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person i think you should click on the add button and add a bunch of todo list")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView()) {
                        Text("Add Somthing 🥳")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                        color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10,
                        x: 0,
                        y: animate ? 50 : 30
                    )
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear {
                addAnimation()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation (
                Animation
                    .easeOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoItemsView()
            .navigationTitle("title")
    }
}

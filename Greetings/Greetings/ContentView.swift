//
//  ContentView.swift
//  Greetings
//
//  Created by Anca Arhip on 21.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    let colorList1: [Color] = [.red, .purple, .green, .pink]
    let colorList2: [Color] = [.black, .white, .blue]
    
    @State var screenTapped: Bool = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: screenTapped ? colorList2 : colorList1, startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .opacity(0.8)
                
            Text("SwiftUI Basics")
                .font(.largeTitle)
                .fontWeight(.semibold)
            .foregroundColor(Color.black)
            .rotation3DEffect(3, axis: <#T##(x: CGFloat, y: CGFloat, z: CGFloat)#>)
        }
        .onTapGesture {
            screenTapped.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

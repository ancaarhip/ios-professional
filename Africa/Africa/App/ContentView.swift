//
//  ContentView.swift
//  Africa
//
//  Created by Anca Arhip on 29.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // MARK: - PROPERTIES
        
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        // MARK: - BODY
        
        VStack {
            
            NavigationView {
                List {
                    CoverImageView()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    ForEach(animals) { animal in
                        NavigationLink {
                            AnimalDetailView(animal: animal)
                        } label: {
                            AnimalListItemView(animal: animal)
                        } //: NAVIGATIONLINK
                    }
                } //: LIST
                .navigationBarTitle("Africa", displayMode: .large)
            } //: NAVIGATION
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ExternalLinkView.swift
//  Africa
//
//  Created by Anca Arhip on 29.10.2022.
//

import SwiftUI

struct ExternalLinkView: View {
    
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.com")!) {
                        Text(animal.name)
                    }
                } //: GROUP
                .foregroundColor(.accentColor)
            } //: HSTACK
        } //: BOX
    }
}

struct ExternalLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  SearchBarView.swift
//  Movie
//
//  Created by Anca Arhip on 02.11.2022.
//  From AppCoda

import SwiftUI

struct SearchBarView: View {
    
    // MARK: - PROPERTIES
    
    @Binding var searchText: String
    
    @State private var localSearchText: String = ""
    
    @State private var isEditing = false
    
    // FUNCTIONS
    
    private func endEditing() {
        isEditing = false
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            
            TextField("Search ...", text: $localSearchText, onEditingChanged: {
                isEditing = $0
            })
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color("AccentColor"))
                .foregroundColor(Color("TextColor"))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        
                        Button {
                            $searchText.wrappedValue = localSearchText
                            endEditing()

                        } label: {
                            Image(systemName: "magnifyingglass")
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                                .foregroundColor(Color("TextColor"))
                        }

                        if isEditing || !localSearchText.isEmpty {
                            Button {
                                localSearchText = ""
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
        } //: HSTACK
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}

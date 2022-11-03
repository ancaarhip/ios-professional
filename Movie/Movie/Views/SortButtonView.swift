//
//  SortButtonView.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import SwiftUI

struct SortButtonView: View {
    
    // MARK: - PROPERTIES
    
    @State private var actionSheetIsPresented: Bool = false
    
    var sender: Tab
    
    // MARK: - BODY
    
    var body: some View {
        Button(action: {
            actionSheetIsPresented.toggle()
        }) {
            Image("ic_sort")
        }
        .actionSheet(isPresented: $actionSheetIsPresented) {
            ActionSheet(
                title: Text(""),
                    
                buttons: SortType.allCases.map { sortType in
                    switch sortType {
                    case SortType.none:
                        return .cancel()
                    default:
                        return .default(Text(sortType.rawValue)) {
                            NotificationCenter.default.post(
                                name:Notification.Name.sort(sender.rawValue),
                                object: sortType)
                        }
                    }
                    
                }
            )
        }
    }
}

struct SortButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SortButtonView(sender: .home)
    }
}

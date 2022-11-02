//
//  MainView.swift
//  Movie
//
//  Created by Anca Arhip on 30.10.2022.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - PROPERTIES
    
    @State private var tabSelection = Tab.home
    
    // MARK: - BODY
    
    var body: some View {
        TabView(selection: $tabSelection) {
            FavoritesView()
                .tabItem {
                    tabs[.favorites]?.image
                    tabs[.favorites]?.text
                }
                .tag(Tab.favorites)
            
            HomeView()
                .tabItem {
                    tabs[.home]?.image
                    tabs[.home]?.text
                }
                .tag(Tab.home)
            
            SearchView()
                .tabItem {
                    tabs[.search]?.image
                    tabs[.search]?.text
                }
                .tag(Tab.search)
        } //: TAB
        .onAppear {
            // correct the transparency bug for Tab bars
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            } else {
                // Fallback on earlier versions
            }
            // correct the transparency bug for Navigation bars
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

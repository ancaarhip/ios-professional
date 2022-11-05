//
//  HomeView.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        TabView() {
            WeatherView()
                .tabItem {
                    Image(systemName: "weather")
                    Text("Alerts")
                }
            
            ContactsView()
                .tabItem {
                    Image(systemName: "phone")
                    Text("Contacts")
                }
                
        }
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

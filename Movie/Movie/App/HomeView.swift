//
//  HomeView.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    
    @State private var selectedTab = RecommendationType.now_playing
    @State private var actionSheetIsPresented: Bool = false
    @StateObject var moviesViewModel = MoviesViewModel()
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Movies", selection: $selectedTab) {
                    ForEach(RecommendationType.allCases, id: \.self) { item in
                        Text("\(item.rawValue)")
                            .tag(item)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: selectedTab) { _ in
                    moviesViewModel.recommendation = selectedTab
                }
                
                MoviesGridView(movies: moviesViewModel.movies)
                
            } //: VSTACK
            .navigationBarTitle(Tab.home.rawValue, displayMode: .inline)
            .navigationBarItems(
                trailing:
                    SortButtonView(sender: Tab.home)
            )
            .onAppear{
                moviesViewModel.recommendation = selectedTab
            }
        } //: NAVIGATION
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

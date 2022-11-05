//
//  WeatherView.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import SwiftUI

struct WeatherView: View {
    
    // MARK: - PROPERTIES
    
    @StateObject var alertsViewModel = AlertsViewModel()
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(alertsViewModel.alerts) { alert in
                        NavigationLink {
                            AlertDetailView(alert: alert)
                        } label: {
                            AlertRowView(alertModel: alert)
                        }
                        
                    }
                } //: LIST
                .listStyle(PlainListStyle())
            } //: VSTACK
            .navigationBarTitle("Weather Alerts", displayMode: .inline)
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

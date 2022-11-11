//
//  VideoListView.swift
//  Africa
//
//  Created by Anca Arhip on 29.10.2022.
//

import SwiftUI

struct VideoListView: View {
    
    // MARK: - PROPERTIES
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink {
                        VideoPlayerView(videoSelected: item.id, videoTitle: item.name)
                    } label: {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }
            } //: LIST
            .listStyle(.insetGrouped)
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        } //: NAVIGATION
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

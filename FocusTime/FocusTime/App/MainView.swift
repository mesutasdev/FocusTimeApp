//
//  MainView.swift
//  FocusTime
//
//  Created by Mesut As Developer on 9/28/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab: Int = 1
    
    var body: some View {
        TabView{
            MeditationsFocus()
                .tabItem {
                    Label("Meditation", systemImage: "figure.mind.and.body")
                }
                .tag(0)
            
            FocusView()
                .tabItem {
                    Label("Focus", systemImage: "moon.stars")
                }
                .tag(1)
            
            BookFocus()
                .tabItem {
                    Label("Book", systemImage: "book")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainView()
     
}

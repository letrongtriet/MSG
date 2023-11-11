//
//  MainView.swift
//  MSG
//
//  Created by Triet Le on 10.11.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "square.and.pencil")
                }
            
            ChallengeListView()
                .tabItem {
                    Label("Challenges", systemImage: "square.and.pencil")
                }
            
            CharacterView()
                .tabItem {
                    Label("Character", systemImage: "square.and.pencil")
                }
            
            ShopView()
                .tabItem {
                    Label("Shop", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    MainView()
}

//
//  HomeView.swift
//  SwiftUI-Deep-Links-TabView-NavigationStack
//
//  Created by YILMAZ ER on 18.04.2024.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var appData: AppData
    var body: some View {
        TabView(selection: $appData.activeTab,
                content:  {
            HomeView()
                .tabItem {
                    Label(Tab.home.rawValue, systemImage: Tab.home.symbolImage)
                }
                .tag(Tab.home)
            
            FavouriteView()
                .tabItem {
                    Image(systemName: Tab.favourite.symbolImage)
                }
                .tag(Tab.favourite)
            
            SettingsView()
                .tabItem {
                    Image(systemName: Tab.settings.symbolImage)
                }
                .tag(Tab.settings)
        })
        .tint(.red)
    }
    
    @ViewBuilder
    func HomeView() -> some View {
        NavigationStack(path: $appData.homeStack) {
            List(HomeStack.allCases, id: \.rawValue) {  link in
             
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }
            }
            .navigationTitle("Home")
            .navigationDestination(for: HomeStack.self) { link in
                Text(link.rawValue + " View")
            }
        }
    }
    
    @ViewBuilder
    func FavouriteView() -> some View {
        NavigationStack(path: $appData.favouriteStack) {
            LazyVStack {
                ForEach(FavouriteStack.allCases, id: \.rawValue) { link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }}
            }
            .navigationTitle("Home")
            .navigationDestination(for: FavouriteStack.self) { link in
                Text(link.rawValue + " View")
            }
        }
    }
    
    @ViewBuilder
    func SettingsView() -> some View {
        NavigationStack(path: $appData.settingsStack) {
         
            List(SettingsStack.allCases, id: \.rawValue) { link in
                NavigationLink(value: link) {
                    Text(link.rawValue)
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: SettingsStack.self) { link in
                Text(link.rawValue + " View")
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppData())
}

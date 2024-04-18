//
//  HomeView.swift
//  SwiftUI-Deep-Links-TabView-NavigationStack
//
//  Created by YILMAZ ER on 18.04.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var appData: AppData
    var body: some View {
        TabView(selection: $appData.activeTab,
                content:  {
            Text("adfas")
                .tabItem {
                    Image(systemName: Tab.home.symbolImage)
                }
        })
        .tint(.red)
    }
    
    @ViewBuilder
    func HomeView() -> some View {
        NavigationStack {
            List {
                ForEach(HomeStack.allCases, id: \.rawValue) { link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }}
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}

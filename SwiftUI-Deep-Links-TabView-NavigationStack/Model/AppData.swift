//
//  AppData.swift
//  SwiftUI-Deep-Links-TabView-NavigationStack
//
//  Created by YILMAZ ER on 18.04.2024.
//

import Foundation

class AppData: ObservableObject {
    @Published var activeTab: Tab = .home
    @Published var homeStack: [HomeStack] = []
    @Published var favouriteStack: [FavouriteStack] = []
    @Published var settingsStack: [SettingsStack] = []
}

//
//  Tab.swift
//  SwiftUI-Deep-Links-TabView-NavigationStack
//
//  Created by YILMAZ ER on 18.04.2024.
//

import Foundation


/// TabView Tab's

enum Tab: String, CaseIterable {
    case home = "Home"
    case favorite = "Favorites"
    case settings = "Settings"

    var symbolImage: String {
        switch self {
        case .home: "house.fill"
        case .favorite: "heart.fill"
        case .settings: "gear"
        }
    }
    
    static func convert(from: String) -> Self? {
        return Tab.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}

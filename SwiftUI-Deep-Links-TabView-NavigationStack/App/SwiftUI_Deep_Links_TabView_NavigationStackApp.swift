//
//  SwiftUI_Deep_Links_TabView_NavigationStackApp.swift
//  SwiftUI-Deep-Links-TabView-NavigationStack
//
//  Created by YILMAZ ER on 18.04.2024.
//

import SwiftUI

@main
struct SwiftUI_Deep_Links_TabView_NavigationStackApp: App {
    @StateObject private var appData: AppData = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
                .onOpenURL { url in
                    let string = url.absoluteString.replacingOccurrences(of: "myapp://", with: "")
                    let components = string.components(separatedBy: "?")
                    
                    for component in components {
                        if component.contains("tab=") {
                            /// Tab Change Request
                            let tabRawValue = component.replacingOccurrences(of: "tab=", with: "")
                            if let requestedTab = Tab.convert(from: tabRawValue) {
                                print(requestedTab)
                                appData.activeTab = requestedTab
                            }
                        }
                        
                        if component.contains("nav=") && string.contains("tab") {
                            let requestedNavPath = component
                                .replacingOccurrences(of: "nav=", with: "")
                                .replacingOccurrences(of: "_", with: " ")
                        switch appData.activeTab {
                        case .home:
                            if let navPath = HomeStack.convert(from: requestedNavPath) {
                                appData.homeStack.append(navPath)
                            }
                        case .favourite:
                            if let navPath = FavouriteStack.convert(from: requestedNavPath) {
                                appData.favouriteStack.append(navPath)
                            }
                        case .settings:
                            if let navPath = SettingsStack.convert(from: requestedNavPath) {
                                appData.settingsStack.append(navPath)
                            }
                        }
                        }
                    }
                }
        }
    }
}

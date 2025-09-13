//  Manoonchai SyyBoard
//  Copyright (c) 2025 Saamkhaih Kyakya
//  Licensed under the MIT License.
//
//  iosrmpkbdApp.swift
//  iosrmpkbd
//
//  Created by Saamkhaih Kyakya on 11/9/25.
//

import SwiftUI

@main
struct iosrmpkbdApp: App {
    @State private var selectedTab: Tab = .enable

    enum Tab {
        case enable
        case howToUse
        case about
    }

    var body: some Scene {
        WindowGroup {
            ContentViewWrapper(selectedTab: $selectedTab)
        }
        .commands {
            CommandGroup(after: .help) {
                Button(".how_to_use") {
                    selectedTab = .howToUse
                }
                Button(".about") {
                    selectedTab = .about
                }
            }
        }
    }
}

// Wrapper to pass selectedTab to ContentView
struct ContentViewWrapper: View {
    @Binding var selectedTab: iosrmpkbdApp.Tab
    
    var body: some View {
        ContentView(selectedTab: $selectedTab)
    }
}

#if DEBUG
struct iosrmpkbdApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWrapper(selectedTab: .constant(.enable))
            .previewDevice("iPhone 15")
    }
}
#endif

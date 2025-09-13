//
//  ContentView.swift
//  iosrmpkbd
//
//  Created by Saamkhaih Kyakya on 11/9/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var selectedTab: iosrmpkbdApp.Tab

    var body: some View {
        TabView(selection: $selectedTab) {
            EnableKbdView()
                .tabItem {
                    Label {
                        Text(".enable")
                    } icon: {
                        Image(systemName: selectedTab == .enable ? "keyboard.fill" : "keyboard")
                    }
                    .environment(\.symbolVariants, .none)
                }
                .tag(iosrmpkbdApp.Tab.enable)

            HowToUseView()
                .tabItem {
                    Label {
                        Text(".how_to_use")
                    } icon: {
                        Image(systemName: selectedTab == .howToUse ? "hand.tap.fill" : "hand.tap")
                    }
                    .environment(\.symbolVariants, .none)
                }
                .tag(iosrmpkbdApp.Tab.howToUse)

            AboutView()
                .tabItem {
                    Label {
                        Text(".about")
                    } icon: {
                        Image(systemName: selectedTab == .about ? "info.circle.fill" : "info.circle")
                    }
                    .environment(\.symbolVariants, .none)
                }
                .tag(iosrmpkbdApp.Tab.about)
        }
    }
}

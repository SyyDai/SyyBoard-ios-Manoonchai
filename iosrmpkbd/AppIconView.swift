//
//  AppIconView.swift
//  SyyBoardMNC
//
//  Created by Saamkhaih Kyakya on 13/9/25.
//

import SwiftUI

struct AppIconView: View {
    var body: some View {
        if let icons = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
           let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
           let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
           let iconName = iconFiles.last,
           let uiImage = UIImage(named: iconName) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
                .cornerRadius(8)
        }
    }
}

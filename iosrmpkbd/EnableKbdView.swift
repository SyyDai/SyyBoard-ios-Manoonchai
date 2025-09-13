//
//  EnableKbdView.swift
//  SyyBoardMNC
//
//  Created by Saamkhaih Kyakya on 13/9/25.
//

import SwiftUI

struct EnableKbdView: View {
    private var appName: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
        Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "App"
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    HStack(spacing: 8) {
                        AppIconView()
                        
                        Text(appName)
                            .font(.title2)
                            .bold()
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(".enable_keyboard_instruction")
                            .bold()
                            
                        Text(".settings") + Text(" ") +
                        Text(Image(systemName: "chevron.right")) + Text(" ") +
                        Text(".apps") + Text(" ") +
                        Text(Image(systemName: "chevron.right")) + Text(" ") +
                        Text(appName) + Text(" ") +  // appName is dynamic, keep as-is
                        Text(Image(systemName: "chevron.right")) + Text(" ") +
                        Text(".keyboards")
                        
                        Text(".enable_both")
                    
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        .regularMaterial,
                        in: RoundedRectangle(
                            cornerRadius: {
                                if #available(iOS 26, *) {
                                    return 20
                                } else {
                                    return 10
                                }
                            }()
                        )
                    )
                    
                    Button {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        Text(".open_app_setting")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.accentColor)
                    
                }
                .padding()
            }
            .navigationTitle(".enable_keyboard")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    EnableKbdView()
}

//
//  AboutView.swift
//  SyyBoardMNC
//
//  Created by Saamkhaih Kyakya on 13/9/25.
//

import SwiftUI

struct AboutView: View {
    
    var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"
        return "v\(version) (\(build))"
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    VStack(alignment: .leading, spacing: 5) {                    Text(".about_desc")                                .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text(appVersion)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Button {
                        if let url = URL(string: "https://github.com/SyyDai/SyyBoard-ios-Manoonchai") {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        Text(".open_website_sourcecode")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.accentColor)
                    
                    Button {
                        if let url = URL(string: "https://discord.gg/aNbFWTmuHU") {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        Text(".open_website_discord")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.accentColor)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(".privacy_policy_title")
                            .bold()
                        Text(".privacy_policy_desc")
                    
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
                    
                    if let copyright = Bundle.main.infoDictionary?["NSHumanReadableCopyright"] as? String {
                        Text(copyright)
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
                    }
                    
                }
                .padding()
            }
            .navigationTitle(".about")
            .navigationBarTitleDisplayMode(.large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    AboutView()
}

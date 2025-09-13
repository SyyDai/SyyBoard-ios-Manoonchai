//
//  HowToUseView.swift
//  SyyBoardMNC
//
//  Created by Saamkhaih Kyakya on 13/9/25.
//
import SwiftUI

struct HowToUseView: View {
    @State private var testText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("iPhone:")
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(".settings") + Text(" ") +
                        Text(Image(systemName: "chevron.right")) + Text(" ") +
                        Text(".accesibility") + Text(" ") +
                        Text(Image(systemName: "chevron.right")) + Text(" ") +
                        Text(".touch") + Text(" ") +  // appName is dynamic, keep as-is
                        Text(Image(systemName: "chevron.right")) + Text(" ") +
                        Text(".assistivetouch")
                        
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
                    Text(".how_to_ios")
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(".how_to_ios_step")
                            .bold()
                        Text(".how_to_ios_step_1")
                        Text(".how_to_ios_step_2")
                        Text(".how_to_ios_step_3")
                        Text(".how_to_ios_step_4")
                    }
                    
                    Divider()
                        .background(Color.gray)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("iPad:")
                            .bold()
                        Text(".how_to_ipados18")
                        Text(".how_to_ipados26") + Text(" ") +
                        Text(".menubar") + Text(" ") +
                        Text(Image(systemName: "chevron.right")) + Text(" ") +
                        Text(".edit") + Text(" ") +
                        Text(Image(systemName: "chevron.right")) + Text(" ") +
                        Text(".show_keyboard")
                    }
                    
                    Divider()
                        .background(Color.gray)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(".how_to_type")
                        Text(".how_to_type_note")
                            .foregroundColor(.red)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(".keys_title")
                            .bold()
                        
                        Text(".press") + Text(" ") + Text(Image(systemName: "arrow.right.to.line")) + Text(".tab_key") + Text(" ")  + Text(".tab_desc")
                        
                        Text(".press") + Text(" ") + Text(Image(systemName: "return")) + Text(".return_key") + Text(" ")  + Text(".return_desc")
                        
                        Text(".press") + Text(" ") + Text(Image(systemName: "space")) + Text(".space_key") + Text(" ")  + Text(".space_desc")
                        
                        Text(".press") + Text(" ")  + Text(Image(systemName: "delete.left")) + Text(".delete_key") + Text(" ")  + Text(".delete_desc")
                    }
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(".note_title")
                            .bold()
                            .foregroundColor(.red)
                        Text(".sometimes_shift_option") +
                        Text(" ") +
                        Text(Image(systemName: "shift")) +
                        Text(".shift_key") +
                        Text(" ") +
                        Text(Image(systemName: "option")) +
                        Text(".option_key") +
                        Text(" ") +
                        Text(".shift_option_desc")
                        
                        Text(".use_capslock") +
                        Text(" ") +
                        Text(Image(systemName: "capslock")) +
                        Text(".capslock_key") +
                        Text(" ") +
                        Text(".capslock_state_desc")
                    }
                    .foregroundColor(.red)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".support_title")
                            .bold()
                        
                        let supportItems: [(String, String?)] = [
                            ("System", "Should be Qwerty when type;"),
                            ("Qwerty", nil),
                            ("Colemak Mod-DH", nil),
                            ("Thai Manoonchai", "‘’“”… at QWERT and «» at NM"),
                            ("Tai Tham Manoonchai", nil)
                        ]
                        
                        ForEach(supportItems, id: \.0) { mainText, noteText in
                            HStack(alignment: .top, spacing: 6) {
                                Image(systemName: "chevron.right")
                                    .frame(width: 6, height: 6)
                                    .foregroundColor(.blue)
                                    .padding(.top, 12)
                                if let note = noteText {
                                    Text(mainText) + Text(" (\(note))").font(.footnote).foregroundColor(.gray)
                                } else {
                                    Text(mainText)
                                }
                            }
                        }
                        .font(.body)
                    }
                    
                    Divider()
                        .background(Color.gray)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(".test_keyboard_title")
                            .bold()
                        TextField(".test_keyboard_here", text: $testText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.trailing, 16)
                    }
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle(".how_to_use_title")
            .navigationBarTitleDisplayMode(.large)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // full-width for iPad
    }
}

#Preview {
    HowToUseView()
}

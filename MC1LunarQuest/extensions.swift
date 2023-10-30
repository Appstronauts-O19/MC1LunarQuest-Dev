//
//  extensions.swift
//  LunarQuest
//
//  Created by Kevser on 21/10/23.
//

import Foundation
import SwiftUI

extension Color {
    static let UserSetup_grey = Color(red: 0.46, green: 0.46, blue: 0.5)
    static let RoleSetup_purple = Color(red: 0.65, green: 0.35, blue: 0.87)

}

struct PurpleButtonStyle: ButtonStyle {
    
    var toggled : Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, UIScreen.main.bounds.width/10)
            .padding()
            .background(toggled ? Color.RoleSetup_purple : Color.UserSetup_grey) // Change the background color to purple when pressed
            .cornerRadius(40)
    }
}



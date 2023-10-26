//
//  Settings.swift
//  MC1LunarQuest
//
//  Created by Fabio Festa on 24/10/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var user : UserModel
    
    
    var body: some View {
        
        
        NavigationStack {
            
            Image(user.role.stringValue)
                .resizable()
                .frame(width: 157, height: 300)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.top,-80)
            
            
            
            Text("Astronaut Name")
                .font(
                    Font.custom("SF Pro", size: 30)
                        .weight(.bold)
                )
                .foregroundColor(.white)
                .padding(.top)
                .padding(.leading,-150)
            
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 360, height: 44)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 1)
                        .overlay(
                            TextField("Username: ", text: $user.username)
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                .foregroundColor(.white)
                        )
                )
            
            
            Text("Pick your role")
                .font(
                    Font.custom("SF Pro", size: 22)
                        .weight(.bold)
                )
                .foregroundColor(.white)
                .padding(.top)
                .padding(.leading,-183)
            
            HStack(spacing: 100) {
                Button("Explorer") {
                    user.role = .explorer
                }
                .buttonStyle(PurpleButtonStyle(toggled: user.role == .explorer))
                
                Button("Scientist") {
                    user.role = .scientist
                }
                .buttonStyle(PurpleButtonStyle(toggled : user.role == .scientist))
            }.padding()
            
            
            
            Text("Allow Permissions")
                .font(
                    Font.custom("SF Pro", size: 22)
                        .weight(.bold)
                )
                .foregroundColor(.white)
                .padding(.top)
                .padding(.leading,-180)
            
            
            VStack {
                Button(action: {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.3))
                            .frame(width: 360, height: 44)
                            .cornerRadius(10)
                        Label("Change Camera Access",systemImage: "camera.fill")
                            .foregroundColor(.white)
                    }
                }
            }
            
            .navigationTitle("Settings")
        }
        
    }
}

#Preview {
    SettingsView(user: .constant(UserData().user))
}

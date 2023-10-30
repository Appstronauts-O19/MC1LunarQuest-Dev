//
//  Settings.swift
//  MC1LunarQuest
//
//  Created by Fabio Festa on 24/10/23.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var userData: UserData
    
    var isActivated: Bool {
        switch userData.user.role {
        case .explorer:
            return true
        case .scientist:
            return false
        }
    }

    
    
    var body: some View {
        
        
        NavigationStack {
            
            ZStack{
                
                Image(userData.user.role.stringValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 230, height: 300)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(.purple, lineWidth: 6))
                    //.padding(.top,-80)
                
                Image(systemName: "person.circle")
                    .foregroundColor(.purple)
                    .background(Circle().foregroundColor(.black))
                    .scaleEffect(2.5)
                    .padding(.top, 230)
    

            }

        
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
                            TextField("Username: ", text: $userData.user.username)
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
            
            HStack() {
                Button("Explorer") {
                    userData.user.role = .explorer
                }
                .buttonStyle(PurpleButtonStyle(toggled: userData.user.role == .explorer))
                
                Button("Scientist") {
                    userData.user.role = .scientist
                }
                .buttonStyle(PurpleButtonStyle(toggled : userData.user.role == .scientist))
                
                
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
    SettingsView()
        .environmentObject(UserData())
}

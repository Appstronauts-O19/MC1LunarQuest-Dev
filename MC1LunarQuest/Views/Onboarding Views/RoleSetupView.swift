//
//  RoleSetupView.swift
//  LunarQuest
//
//  Created by Kevser on 21/10/23.
//
import Foundation
import SwiftUI


struct RoleSetupView: View {
    
    @EnvironmentObject var userData: UserData
        
    var body: some View {
        
        NavigationStack{
            
            ZStack {
                if userData.user.role == .explorer {
                    Image(.explorer) // Use the image for Role 1
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black, Color.clear,Color.clear]),
                                startPoint: .bottom,
                                endPoint: .top
                            ))
                    
                } else {
                    Image(.scientist) // Use the image for Role 2
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black, Color.clear,Color.clear]),
                                startPoint: .bottom,
                                endPoint: .top
                            ))
                }
                
                VStack {
                    // Your buttons or other content here
                    Spacer(minLength: 500)
                    Text("Pick your role")
                        .font(.title).bold()
                        .foregroundColor(.white)
                    
                    Text("Choose your role wisely, for it will shape your journey. Each role brings its own set of fascinating facts and insights, catering to your unique interests.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .padding(.top, 1)
                    
                    HStack {
                        Button("Explorer") {
                            userData.user.role  = .explorer
                        }
                        .buttonStyle(PurpleButtonStyle(toggled: userData.user.role == .explorer))
                        
                        Button("Scientist") {
                            userData.user.role  = .scientist
                        }
                        .buttonStyle(PurpleButtonStyle(toggled : userData.user.role == .scientist))
                    }.padding()
                    
                    HStack{
                        NavigationLink(destination: PermissionsView()){
                            Label("Allow Permissions  ", systemImage: "arrowshape.forward.circle")
                                .padding(10)
                                .background(Color.UserSetup_grey.opacity(0.6))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
                    }.padding()
                    
                    Spacer()
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .accentColor(.purple)
    }
}

#Preview {
    
    RoleSetupView()
}


//
//  RoleSetupView.swift
//  LunarQuest
//
//  Created by Kevser on 21/10/23.
//
import Foundation
import SwiftUI


struct RoleSetupView: View {
    
    @Binding var user : UserModel
        
    var body: some View {
        
        NavigationView{
            ZStack {
                if user.role == .explorer {
                    Image(.explorer) // Use the image for Role 1
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Image(.scientist) // Use the image for Role 2
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                
                VStack {
                    // Your buttons or other content here
                    Spacer(minLength: 500)
                    Text("Pick your role")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                        .foregroundColor(.white)
                    
                    Text("Choose your role wisely, for it will shape your journey. Each role brings its own set of fascinating facts and insights, catering to your unique interests.")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                    
                    HStack {
                        Button("Explorer") {
                            user.role  = .explorer
                        }
                        .buttonStyle(PurpleButtonStyle(toggled: user.role == .explorer))
                        
                        Button("Scientist") {
                            user.role  = .scientist
                        }
                        .buttonStyle(PurpleButtonStyle(toggled : user.role == .scientist))
                    }.padding()
                    
                    HStack{
                        NavigationLink(destination: PermissionsView(user: $user)){
                            Label("Allow Permissions  ", systemImage: "arrowshape.forward.circle")
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.UserSetup_grey.opacity(0.6)))
                                .foregroundColor(.white)
                        }
                    }.padding()
                    
                    Spacer()
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

#Preview {
    
    RoleSetupView(user: .constant(UserData().user))
}


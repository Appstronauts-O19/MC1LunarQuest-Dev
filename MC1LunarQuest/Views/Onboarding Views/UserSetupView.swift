//
//  UserSetupView.swift
//  LunarQuest
//
//  Created by Kevser on 20/10/23.
//

import SwiftUI
import Foundation


struct UserSetupView: View {
    @Binding var user : UserModel
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                
                Image(.background)
                //.resizable() doesn't work - gotta figure it out
                    .aspectRatio(contentMode: .fill)
                
                VStack {
                    
                    Spacer(minLength: 400)
                    
                    Text("Astronaut's Name")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundColor(.white)
                    
                    ZStack(alignment: .bottom){
                        
                        Image(.badgeResized)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                            .padding(.leading)
                        
                        
                        Text("\(user.username)")
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Text("Welcome aboard on LunarQuest! \nTo make your mark in the cosmos,  \ninscribe your name below.")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.UserSetup_grey.opacity(0.6))
                            .frame(height: 50)
                            .padding(.horizontal)
                        
                        HStack {
                            
                            Spacer()
                            
                            Image(systemName: "person.circle")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                            
                            TextField("Your name", text: $user.username)
                            //doesn't work!!!!!!!!!!!!!!
                                .foregroundColor(.white)
                                .disableAutocorrection(true)
                            
                        }.padding()
                        
                    }.padding()
                    
                    
                    HStack{
                        NavigationLink(destination: RoleSetupView(user: $user)){
                            //Image(systemName: "arrowshape.forward.circle")
                            Label("Pick Your Role  ", systemImage: "arrowshape.forward.circle")
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.UserSetup_grey.opacity(0.6)))
                                .foregroundColor(.white)
                            
                        }
                    }.padding()
                          
                    Spacer()
                }
                
            }.ignoresSafeArea()
        }
        
    }
}

#Preview {
    
    UserSetupView(user: .constant(UserData().user))
}

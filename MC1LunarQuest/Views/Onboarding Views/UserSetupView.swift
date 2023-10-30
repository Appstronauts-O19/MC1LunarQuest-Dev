//
//  UserSetupView.swift
//  LunarQuest
//
//  Created by Kevser on 20/10/23.
//

import SwiftUI
import Foundation


struct UserSetupView: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        NavigationStack{
            
            ZStack {
                
                Image(.background)
                //.resizable() doesn't work - gotta figure it out
                    .aspectRatio(contentMode: .fill)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black, Color.black.opacity(0.8), Color.clear, Color.clear, Color.clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        ))
                
                ZStack(alignment: .bottom){
                    
                    Image(.badgeResized)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .padding(.leading)
                    
                    
                    Text("\(userData.user.username)")
                        .foregroundColor(.yellow)
                        .bold()
                        .padding(.leading, 20)
                        .padding()
                }
                .rotationEffect(.degrees(-0.5))
                .padding()
                    
                
                VStack {
                    
                    Spacer(minLength: 530)
                    
                    Text("Camera Access")
                        .font(.title).bold()
                        .foregroundColor(.white)
                    
                    Text("Welcome aboard on LunarQuest! \nTo make your mark in the cosmos,  \ninscribe your name below.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .padding(.top, 1)
                    
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
                            
                            TextField("Your name", text: $userData.user.username)
                            //doesn't work!!!!!!!!!!!!!!
                                .foregroundColor(.white)
                                .disableAutocorrection(true)
                            
                        }.padding()
                        
                    }.padding()
                    
                    
                    HStack{
                        NavigationLink(destination: RoleSetupView()){
                            //Image(systemName: "arrowshape.forward.circle")
                            Label("Pick Your Role  ", systemImage: "arrowshape.forward.circle")
                                .padding(10)
                                .background(Color.UserSetup_grey.opacity(0.6))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                            
                        }
                    }.padding()
                          
                    Spacer()
                }
                
            }.ignoresSafeArea()
            
        }
        
    }
}

#Preview {
    UserSetupView()
        .environmentObject(UserData())
}

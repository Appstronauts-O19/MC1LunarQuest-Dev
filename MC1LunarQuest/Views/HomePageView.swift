//
//  HomePageView.swift
//  LunarQuest
//
//  Created by Kevser on 22/10/23.
//

import SwiftUI

struct HomePageView: View {
    @Binding var user : UserModel
    
    var body: some View {
        
        
        NavigationView(content: {
            
        
            ZStack{
                
                VStack{
                    
                    ZStack{
                        
                        Rectangle()
                            .padding()
                            .foregroundColor(.clear)
                            .frame(width: 299, height: 354)
                            .background(.black)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .inset(by: 2)
                                    .stroke(Color.purple, lineWidth: 4))
                            .padding(.bottom,60)
                        
                        VStack{
                            
                          
                            
                            Image(user.role.stringValue)
                                .resizable()
                                .frame(width: 157, height: 300)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding(.top,-100)
                                
                            
                            
                            Text("\(user.username)")
                                .font(
                                    Font.custom("SF Pro", size: 30)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 233, alignment: .center)
                            
                            Text("\(user.role.stringValue)")
                                .font(
                                    Font.custom("SF Pro", size: 18)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 233, height: 19, alignment: .center)
                            
                            HStack{
                                
                                Image("placeholder1")
                                Image("placeholder2")
                                Image("placeholder3")
                                Image("placeholder1")
                                
                            }
                            
                            
                            
                        }
                        
                        
                    }
                    
                    
                    
                    
                    Button(action: {
                        // Azione da eseguire quando il bottone viene premuto
                    }) {
                        
                        NavigationLink(destination: MissionsPageView()){
                            Label("Space Mission", systemImage: "moon.fill")
                                .font(Font.custom("SF Pro", size: 17))
                                .foregroundColor(.white)
                                .foregroundColor(.white)  // Colore del testo
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        .frame(width: 299, height: 50, alignment: .center)
                        .background(Color(red: 0.65, green: 0.35, blue: 0.87))
                        .cornerRadius(12)
                    
                    
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination: SettingsView(user: $user)) {
                            Label("Settings", systemImage: "gearshape.fill")
                                .font(Font.custom("SF Pro", size: 17))
                                .foregroundColor(.white)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .frame(width: 299, height: 50, alignment: .center)
                    .background(Color(red: 0.65, green: 0.35, blue: 0.87))
                    .cornerRadius(12)
                    
                    Button(action: {
                        // Azione da eseguire quando il bottone viene premuto
                    }) {
                        Label("Info", systemImage: "info.circle")
                            .font(Font.custom("SF Pro", size: 17))
                            .foregroundColor(.white)
                            .foregroundColor(.white)  // Colore del testo
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .frame(width: 299, height: 50, alignment: .center)
                    .background(Color(red: 0.65, green: 0.35, blue: 0.87))
                    .cornerRadius(12)
                    
                }
                
            }
            
            
            foregroundColor(.black)
            
            
        }).navigationBarHidden(true)
    }
}

#Preview {
    
    HomePageView(user: .constant(UserData().user))
}

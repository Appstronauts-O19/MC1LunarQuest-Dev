//
//  HomePageView.swift
//  LunarQuest
//
//  Created by Kevser on 22/10/23.
//

import SwiftUI

struct HomePageView: View {
    @Binding var user : UserModel
    //@State private var exampleUser = UserModel(badges: ["moon.stars.fill",  "heart.circle.fill", "house.circle.fill"])
    
    var body: some View {
        
        NavigationStack{
            
            
            ZStack{
                Image(.homeView)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
                VStack{
                    
                    ZStack{
                        
                        Rectangle()
                            .padding()
                            .foregroundColor(.clear)
                            .frame(width: 299, height: 400)
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
                                .padding(.top,-120)
                            
                       
                            Text("\(user.username)")
                                .font(
                                    Font.custom("SF Pro", size: 30)
                                        .weight(.bold)
                                )
                                .foregroundColor(.white)
                                .padding(.top, -40)
                            
                            Text("\(user.role.stringValue)")
                                .font(
                                    Font.custom("SF Pro", size: 18)
                                        .weight(.medium)
                                )
                                .foregroundColor(.white)
                            
                            HStack(spacing: 20){
                                
                                ForEach(user.badges, id: \.self) { badgeName in
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 54, height: 54)
                                        .background(
                                            Image(systemName: badgeName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 54, height: 54)
                                                .clipped()
                                        )
                                    
                                }
                                
                            }
                            .padding()
                        }
                    }
                    
                    Button(action: {
                        // Azione da eseguire quando il bottone viene premuto
                    }) {
                        
                        NavigationLink(destination: MissionsPageView()){
                            Label("Space Mission", systemImage: "moon.fill")
                                .font(Font.custom("SF Pro", size: 17))
                                .foregroundColor(.white)
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
                        NavigationLink {
                            InformationView(user: $user)
                        }
                        label: {
                            Label("Info", systemImage: "info.circle")
                                .font(Font.custom("SF Pro", size: 17))
                                .foregroundColor(.white)
                            }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .frame(width: 299, height: 50, alignment: .center)
                    .background(Color(red: 0.65, green: 0.35, blue: 0.87))
                    .cornerRadius(12)
                    
                }
                
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
        }
        .navigationBarHidden(true)
        .accentColor(.purple)
    }
}

#Preview {
    HomePageView(user: .constant(UserData().user))
}

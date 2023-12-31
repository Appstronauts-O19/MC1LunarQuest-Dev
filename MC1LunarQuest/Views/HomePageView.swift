//
//  HomePageView.swift
//  LunarQuest
//
//  Created by Kevser on 22/10/23.
//

import SwiftUI

struct HomePageView: View {
    
    @EnvironmentObject var userData : UserData
    //@State private var exampleUser = UserModel(badges: ["moon.stars.fill",  "heart.circle.fill", "house.circle.fill"])
    
    var body: some View {
        
        NavigationStack{
            
            
            ZStack{
                Image(.homeView)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
                VStack{
                    
                    ZStack{
                        
                        VStack{
                            
                            //User Image
                            Circle()
                                .overlay(
                                    Image("\(userData.user.role.stringValue)Close")
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                )
                                .overlay(
                                    Circle().stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.purple, Color.purple.opacity(0.1)]),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    ), lineWidth: 6))
                                .frame(width: 200, height: 200)
                            
                            //User Name
                            Text("\(userData.user.username)")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                            
                            
                            //User Role
                            Text("\(userData.user.role.stringValue)")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            //Badges
                            HStack(spacing: 20){
                                
                                //loop for last 4 elements of badges array.
                                ForEach(userData.user.badges.prefix(4), id: \.self) { badgeName in
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 54, height: 54)
                                        .background(
                                            Image(badgeName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 54, height: 54)
                                                .clipped()
                                        )
                                    
                                }
                                
                            }
                            
                        }
                        .background(
                            Rectangle()
                            .padding()
                            .foregroundColor(.clear)
                            .frame(width: 299, height: 400)
                            .background(.black)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .inset(by: 2)
                                    .stroke(LinearGradient(
                                        gradient: Gradient(colors: [Color.purple, Color.purple.opacity(0.1)]),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    ), lineWidth: 6))
                            .padding(.bottom,30)
                        )
                    }.padding(50)
                    
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
                        NavigationLink(destination: SettingsView()) {
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
                            InformationView()
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
    HomePageView()
        .environmentObject(UserData())
}

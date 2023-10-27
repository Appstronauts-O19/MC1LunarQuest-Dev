//
//  TextLoading.swift
//  MC1LunarQuest
//
//  Created by Fabio Festa on 26/10/23.
//

import SwiftUI


struct InformationView: View {
    
    @Binding var user : UserModel
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView {
                
                VStack{
                    
                    
                    Text("ARTEMIS PROGRAM")
                        .font(
                            Font.custom("SF Pro", size: 31)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.96, green: 0.93, blue: 0.09))
                        .frame(width: 310, height: 22, alignment: .top)
                        .padding(50)
                    
                    
                    
                    
                    Text("In the year 2025, the world held its collective breath as Artemis III touched down on the lunar surface, marking humanity's long-awaited return to the Moon after more than half a century.").font(
                        Font.custom("SF Pro", size: 25)
                            .weight(.bold)
                    )
                    .foregroundColor(.yellow)
                    .multilineTextAlignment(.center)
                    .opacity(0.8)
                    .padding(.bottom)
                    .padding(.horizontal,50)
                    
                    Text("The crew, equipped with state-of-the-art technology and the most diverse astronaut corps in history, was on the cusp of embarking on a historic mission near the lunar South Pole.")
                        .font(
                            Font.custom("SF Pro", size: 25)
                                .weight(.bold)
                        )
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .opacity(0.8)
                        .padding(.bottom)
                        .padding(.horizontal,50)
                    
                    Text("Their journey promised to be a scientific odyssey of unparalleled significance, with the crew poised to conduct moonwalks, collect samples, and explore the enigmatic terrain.")
                        .font(
                            Font.custom("SF Pro", size: 25)
                                .weight(.bold)
                        )
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .opacity(0.8)
                        .padding(.bottom)
                        .padding(.horizontal,50)
                    
                    Text("As the lunar dawn approached, the Earth watched in anticipation, for the secrets of the South Pole region were about to be unveiled.")
                        .font(
                            Font.custom("SF Pro", size: 25)
                                .weight(.bold)
                        )
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .opacity(0.8)
                        .padding(.horizontal,50)
                    
                    if user.hasCompletedSetup == false{
                        Button(action: {
                            
                        }) {
                            NavigationLink{
                                UserSetupView(user: $user)
                            }
                            label: {Label("START", systemImage: "")
                            }
                            .font(Font.custom("SF Pro", size: 30))
                            .foregroundColor(.white)
                            }
                        
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        .frame(width: 180, height: 50, alignment: .center)
                        .background(Color.yellow)
                        .opacity(0.6)
                        .cornerRadius(12)
                        .padding(.top)
                    }
                }
            }
        }
    }
}

#Preview {
    InformationView(user: .constant(UserData().user))
    
}

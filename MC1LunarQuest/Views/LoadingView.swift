//
//  LoadingView.swift
//  MC1LunarQuest
//
//  Created by Fabio Festa on 24/10/23.
//

import SwiftUI
import Foundation

struct LoadingView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        if isActive {
            if userData.user.hasCompletedSetup{
                HomePageView()
            }
            else{
                InformationView()
            }
        }else {
            ZStack{
                Color(.black).ignoresSafeArea()
                VStack{
                    HStack{
                            Text("Made with")
                            Image(systemName: "heart.fill")
                                .foregroundColor(.pink)
                            Text("by Appstronauts")
                    }
                    Text("Apple Developer Academy, Naples")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation{
                        self.isActive = true
                    }
        }

            }
        }
    }
}

#Preview {
    LoadingView()
        .environmentObject(UserData())
}


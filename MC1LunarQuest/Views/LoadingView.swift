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
                    Image(.frame9)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300.0)
                        .clipShape(.rect(cornerRadius: 100))
                    Text("Lunar Quest")
                        .font(.system(size: 35))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.top)
                    Text("designed by")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .padding(.top)
                    Text("Appstronauts")
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
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
}


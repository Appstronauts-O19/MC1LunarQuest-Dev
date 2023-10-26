//
//  ContentView.swift
//  MC1LunarQuest
//
//  Created by Arantza Castro Dessavre on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var user : UserModel
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack{
            
            if user.hasCompletedSetup{
                HomePageView(user: $user)
            }
            else{
                UserSetupView(user: $user)
            }
        }
        .onChange(of: scenePhase, { oldValue, newValue in
            if newValue == .inactive { saveAction() }
        })
    }
}

#Preview {
    
    ContentView(user: .constant(UserData().user), saveAction: {})
}


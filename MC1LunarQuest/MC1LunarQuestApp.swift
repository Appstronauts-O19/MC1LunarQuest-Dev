//
//  MC1LunarQuestApp.swift
//  MC1LunarQuest
//
//  Created by Arantza Castro Dessavre on 23/10/23.
//

import SwiftUI

@main
struct MC1LunarQuestApp: App {
    
    @StateObject var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(user: $userData.user){
                Task {
                    do {
                        try await userData.save(user: userData.user)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
    
            .task {
                do {
                    try await userData.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

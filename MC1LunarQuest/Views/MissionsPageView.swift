//
//  MissionView.swift
//  LunarQuest
//
//  Created by Arantza Castro Dessavre on 19/10/23.
//

import SwiftUI

struct MissionsPageView: View {
    var body: some View {
        NavigationStack{
            VStack {
                MissionCardView()
            }
            //.background(RadialGradient(gradient: Gradient(colors: [Color.purple, Color.black]), center: .init(x: 0.5, y: 1.3), startRadius: 10, endRadius: 800))
        }
    }
}

#Preview {
    MissionsPageView()
}

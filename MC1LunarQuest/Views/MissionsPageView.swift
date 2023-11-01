//
//  MissionView.swift
//  LunarQuest
//
//  Created by Arantza Castro Dessavre on 19/10/23.
//

import SwiftUI

struct MissionsPageView: View {
    
    var viewMissionModel = ViewMissionModel()
    
    var body: some View {
        NavigationStack {
            Text("Missions")
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            ScrollView(showsIndicators: false) {
                ForEach (viewMissionModel.missions, id: \.id){exm in
                    MissionCardView(mission: exm)
                        .padding()
                }
            }
            
        .background(RadialGradient(gradient: Gradient(colors: [Color.purple, Color.black]), center: .init(x: 0.5, y: 1.3), startRadius: 10, endRadius: 800))
        }
    }
}



struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.size.width
        let height = rect.size.height

        // Make sure the radius does not exceed the bounds dimensions
        let tr = min(min(self.tr, height/2), width/2)
        let tl = min(min(self.tl, height/2), width/2)
        let bl = min(min(self.bl, height/2), width/2)
        let br = min(min(self.br, height/2), width/2)
        
        path.move(to: CGPoint(x: width / 2.0, y: 0))
        path.addLine(to: CGPoint(x: width - tr, y: 0))
        path.addArc(center: CGPoint(x: width - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: width, y: height - br))
        path.addArc(center: CGPoint(x: width - br, y: height - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: bl, y: height))
        path.addArc(center: CGPoint(x: bl, y: height - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.closeSubpath()

        return path
    }
}


#Preview {
    MissionsPageView()
        .environmentObject(UserData())
}



    

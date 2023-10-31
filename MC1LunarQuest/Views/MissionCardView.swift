//
//  MissionCardView.swift
//  MC1LunarQuest
//
//  Created by Aleksandr Morozov on 31/10/23.
//

import SwiftUI

struct MissionCardView: View {
    
    var mission: MissionModel
    @State private var cardScale: CGFloat = 1.0
    
    var body: some View {
    
        // Background Image
        ZStack (alignment: .bottomLeading) {
            Image(mission.missionImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 10)
                .overlay(alignment: .bottom , content:{
                    VStack(alignment: .leading){
                        
                        //Upper category-sub title
                        Text(mission.category)
                            .font(.subheadline)
                            .bold()
                            .padding(.horizontal)
                            .foregroundColor(.white.opacity(0.9))
                            .foregroundStyle(.ultraThinMaterial)
                            .blendMode(.plusLighter)

                        //Title
                        Text(mission.missionName)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white.opacity(0.9))
                            .foregroundStyle(.ultraThinMaterial)
                            .blendMode(.plusLighter)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                        
                        //Tech Specs
                        HStack{
                            //Time Requiered
                            HStack{
                                Image(systemName: "timer")
                                    .bold()
                                Text("\(mission.timeRequirement)m")
                                    .font(.body)
                                    .bold()
                            }.padding(.trailing)
                            
                            //Space Requiered
                            HStack{
                                Image("ar")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .bold()
                                Text("\(mission.spaceRequirement)m")
                                    .font(.body)
                                    .bold()
                            }
                            
                        }
                        .padding(.horizontal)
                        .padding(.top,-15)
                        
                        HStack{
                            VStack(alignment: .leading) {
                                Text(mission.missionDescription)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            
                            Spacer()
                            
                            NavigationLink(destination: MissionView()){
                                Image(systemName: "play.fill")
                                Text("Play")
                            }
                            .foregroundStyle(.purple)
                            .tint(.white)
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .padding()
                            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                                withAnimation {
                                    cardScale = pressing ? 0.98 : 1.0
                                }
                            }, perform: {})
                            
                        }.background(.black.opacity(0.15))
                       }
                    
                    }
                )
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        .scaleEffect(cardScale)
    }
}

#Preview {
    MissionCardView(mission: MissionModel(missionImage: "Mission1", missionName: "Discover water in the moon soil", missionDescription: "Explore moon crater, take soil sample to find out if the place is legible for future bases.", badgeName: "Badge1", spaceRequirement: "10", timeRequirement: "5", category: "Moon Exploration"))
}

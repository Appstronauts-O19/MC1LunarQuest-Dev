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
    @State private var shouldNavigate = false

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
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(.white.opacity(0.9))
                                    .foregroundStyle(.ultraThinMaterial)
                                    .blendMode(.plusLighter)
                                
                                Text("\(mission.timeRequirement)min")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(.white.opacity(0.9))
                                    .foregroundStyle(.ultraThinMaterial)
                                    .blendMode(.plusLighter)
                            }.padding(.trailing)
                            
                            //Space Requiered
                            HStack{
                                Image("ar")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .bold()
                                    .foregroundColor(.white.opacity(0.9))
                                    .foregroundStyle(.ultraThinMaterial)
                                    .blendMode(.plusLighter)
                                
                                Text("\(mission.spaceRequirement)m²")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(.white.opacity(0.9))
                                    .foregroundStyle(.ultraThinMaterial)
                                    .blendMode(.plusLighter)
                            }
                            
                        }
                        .padding(.horizontal)
                        .padding(.top,-15)
                        
                        HStack{
                            VStack(alignment: .leading) {
                                Text(mission.missionDescription)
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.9))
                                    .foregroundStyle(.ultraThinMaterial)
                                    .blendMode(.plusLighter)
                            }
                            .padding()
                            
                            Spacer()
                            
//                            Button(action: {
//                                withAnimation(.easeInOut(duration: 0.2)) {
//                                    cardScale = 0.98
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                                        withAnimation(.easeIn(duration: 0.5)) { // <- Apply custom animation here
//                                                           shouldNavigate = true
//                                        }
//                                    }
//                                }
//                            }) {
//                                HStack {
//                                    Image(systemName: "play.fill")
//                                    Text("Play")
//                                }
//                                .foregroundStyle(.purple)
//                                .tint(.white)
//                                .buttonStyle(.borderedProminent)
//                                .buttonBorderShape(.capsule)
//                                .padding()
//                            }.navigationDestination(isPresented: $shouldNavigate, destination: { MissionView()
//                                .transition(.opacity)})



                            NavigationLink(destination: MissionView()){
                                Image(systemName: "play.fill")
                                Text("Play")
                            }
                            .foregroundStyle(.purple)
                            .tint(.white)
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .padding()
                            //THIS BREAKS IT! Maybe becasue animation doesn't finish?
//                            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing:                             { pressing in
//                                withAnimation {
//                                    cardScale = pressing ? 0.98 : 1.0
//                                }
//                            }, perform: {})
//             
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

//
//  ARMissionEndView.swift
//  MC1LunarQuest
//
//  Created by Arantza Castro Dessavre on 26/10/23.
//

import SwiftUI

struct ARMissionEndView: View {
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
            ZStack (alignment: .center){
                Rectangle()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .foregroundStyle(.ultraThinMaterial)
                
                VStack {
                    
                    Text("Mission Completed!")
                        .foregroundStyle(Color.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .shadow(radius: 6)
                        .padding(.top)
                        .padding()
                    
                    Spacer()
                    
                    Image("Badge")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200, alignment: .center) // Adjust the frame size as required
                        .scaleEffect(scale)
                        .onAppear() {
                            let baseAnimation = Animation.easeInOut(duration: 0.6)
                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                            withAnimation(repeated) {
                                scale = 1.5 // The factor by which the image will grow
                            }
                    }
                    Spacer()
                        
                    HStack{
                        NavigationLink(destination: EmptyView()) {
                            HStack{
                                Image(systemName: "arrowshape.left.circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                
                                Text("Explore other missions ")
                            }
                            .padding(10)
                            .foregroundStyle(Color.white)
                            .background(Color.purple)
                            .clipShape(Capsule())
                        }
                        
                        NavigationLink(destination: EmptyView()) {
                            Image(systemName:"arrow.uturn.right.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.purple)
                                .background(Color.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }
                    }
                    Spacer()
                }
        }
    }
}

#Preview {
    ARMissionEndView()
}

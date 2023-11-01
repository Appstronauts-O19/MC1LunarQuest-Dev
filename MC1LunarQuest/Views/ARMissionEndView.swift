//
//  ARMissionEndView.swift
//  MC1LunarQuest
//
//  Created by Arantza Castro Dessavre on 26/10/23.
//

import SwiftUI

struct ARMissionEndView: View {
    
    @State private var scale: CGFloat = 1.0
    @State var isRotating = false
    
    var body: some View {
            ZStack (alignment: .center){
                
                VStack {
                    
                         
                    Text("Mission Completed!")
                        .foregroundStyle(Color.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .shadow(radius: 6)
                        .padding(.top)
                        .padding()
                    
                    Spacer()

                    //Badge and the Glow Behind
                    ZStack{
                        
                        //Back Animation
                        ZStack{
                            ZStack {
                                  Image("shadow")
                                  Image("pink-top")
                                      .rotationEffect(.degrees(isRotating ? 320 : -360))
                                      .hueRotation(.degrees(isRotating ? -270 : 60))
                                      .blur(radius: 20)
                                      
                                  Image("pink-left")
                                      .rotationEffect(.degrees(isRotating ? -360 : 180))
                                      .hueRotation(.degrees(isRotating ? -220 : 300))
                                      .blur(radius: 20)
                                      
                                  Image("blue-middle")
                                      .rotationEffect(.degrees(isRotating ? -360 : 420))
                                      .hueRotation(.degrees(isRotating ? -150 : 0))
                                      .rotation3DEffect(.degrees(75), axis: (x: isRotating ? 1 : 5, y: 0, z: 0))
                                      .blur(radius: 40)
                                  
                                  Image("blue-right")
                                      .rotationEffect(.degrees(isRotating ? -360 : 420))
                                      .hueRotation(.degrees(isRotating ? 720 : -50))
                                      .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: isRotating ? -5 : 15))
                                      .blur(radius: 50)
                                  
                                  Image("intersect")
                                      .rotationEffect(.degrees(isRotating ? 30 : -420))
                                      .hueRotation(.degrees(isRotating ? 0 : 720))
                                      .rotation3DEffect(.degrees(15), axis: (x: 1, y: 1, z: 1), perspective: isRotating ? 5 : -5)
                                      .blur(radius: 20)
                 
                                  Image("green-left")
                                      .rotationEffect(.degrees(isRotating ? 360 : -360))
                                      .hueRotation(.degrees(isRotating ? 180 :50))
                                      .rotation3DEffect(.degrees(75), axis: (x: 1, y:isRotating ? -5 : 15, z: 0))
                                      .blur(radius: 10)
                                  
                                  
                                  Image("bottom-pink")
                                      .rotationEffect(.degrees(isRotating ? 400 : -360))
                                      .hueRotation(.degrees(isRotating ? 0 : 230))
                                      .opacity(0.25)
                                      .blendMode(.multiply)
                                      .rotation3DEffect(.degrees(75), axis: (x: 5, y:isRotating ? 1 : -45, z: 0))
                                      .blur(radius: 10)
                              }
                              .blendMode(isRotating ? .hardLight : .difference )
                              
                              Image("highlight")
                                  .rotationEffect(.degrees(isRotating ? 360 : 250))
                                  .hueRotation(.degrees(isRotating ? 0 : 230))
                                  .colorMultiply(.yellow)
                                  .scaleEffect(1.4)
                                  .opacity(0.5)
                                  .blur(radius: 4)
                                  .padding()
                                  .onAppear{
                                      withAnimation(.easeInOut(duration: 12).repeatForever(autoreverses: true)) {
                                          isRotating.toggle()
                                      }
                                  }
                              
                              Image("highlight")
                                  .rotationEffect(.degrees(isRotating ? 360 : 250))
                                  .hueRotation(.degrees(isRotating ? 0 : 230))
                                  .colorMultiply(.white)
                                  .scaleEffect(1)
                                  .blur(radius: 1)
                                  .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                  .padding()
                            
                        }
                        .frame(width: 200, height: 500) //weird fix, but it works!                        .border(Color.pink)
                        
                        //Badge
                        Image("Badge1")
                            .resizable()
                            .shadow(color: .cyan,radius: 5)
                            .shadow(color: .blue,radius: 20)
                            .scaleEffect(1.2)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200, alignment: .center) // Adjust the frame size as required
                            .scaleEffect(scale)
                            .onAppear() {
                                let baseAnimation = Animation.easeInOut(duration: 1)
                                let repeated = baseAnimation.repeatForever(autoreverses: true)
                                withAnimation(repeated) {
                                    scale = 1.2 // The factor by which the image will grow
                                }
                            }
                        
                    }
                    .frame(width: UIScreen.main.bounds.width)
                
                    
                    Spacer()
                    
                    //Bottom UI Elements
                    HStack{
                        NavigationLink(destination: MissionsPageView()) {
                            HStack{
                                Image(systemName: "arrowshape.left.circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                
                                Text("Explore other missions ")
                                    .padding(.trailing)
                            }
                            .padding(10)
                            .foregroundStyle(Color.white)
                            .background(Color.purple)
                            .clipShape(Capsule())
                        }.navigationBarBackButtonHidden(true)

                        
                        NavigationLink(destination: MissionView()) {
                            Image(systemName:"arrow.counterclockwise")
                                .resizable()
                                .scaleEffect(0.4)
                                .bold()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.white)
                                .background(Color.purple)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }.navigationBarBackButtonHidden(true)

                    }
                    Spacer()
                    
                    }
                    
                }
                .background(.regularMaterial)
        
        
        }
    }


#Preview {
    ARMissionEndView()
}

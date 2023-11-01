//
//  InformationView.swift
//  LunarQuest
//
//  Created by Kevser on 28/10/23.
//


import SwiftUI
import AVFoundation

func generateTextLines(from text: String, width: CGFloat, fontSize: CGFloat) -> String {
    let maxLineLength = Int(width / fontSize) // Maximum characters per line based on screen width and font size
    var lines: [String] = []
    var currentLine = ""
    
    for word in text.components(separatedBy: " ") {
        if currentLine.isEmpty {
            currentLine = word
        } else if currentLine.count + word.count + 1 <= maxLineLength {
            currentLine += " " + word
        } else {
            lines.append(currentLine)
            currentLine = word
        }
    }
    
    if !currentLine.isEmpty {
        lines.append(currentLine)
    }
    
    return lines.joined(separator: "\n")
}



struct InformationView: View {
    
    @EnvironmentObject var userData : UserData
    
    @State private var firstTextVisible = true
    
    @State private var animationStart = false
    private let startAnimationDuration = 30.0
    @State private var startMovement = false
    
    @State private var animationEnd = false
    private let endAnimationDuration = 0.3
    
    @State private var music: AVAudioPlayer!
    
    var body: some View {
        let crawlText = " With Artemis missions, NASA explored the Moon for scientific discovery, technology advancement, and to learn how to live and work on another world as they prepared for human missions to Mars. They collaborated with commercial and international partners and established the first long-term presence on the Moon. NASA landed the first woman and first person of color on the Moon, using innovative technologies to explore more of the lunar surface than ever before. In the year 2025, the world held its collective breath as Artemis III touched down on the lunar surface, marking humanity's long-awaited return to the Moon after more than half a century. The crew, equipped with state-of-the-art technology and the most diverse astronaut corps in history, was on the cusp of embarking on a historic mission near the lunar South Pole.Their journey promised to be a scientific odyssey of unparalleled significance, with the crew poised to conduct moonwalks, collect samples, and explore the enigmatic terrain. As the lunar dawn approached, the Earth watched in anticipation, for the secrets of the South Pole region were about to be unveiled."
        
        let screenWidth = UIScreen.main.bounds.width
        let fontSize: CGFloat = 20
        let textLines = generateTextLines(from: crawlText, width: screenWidth, fontSize: fontSize)
                
        NavigationStack(){
            
            ZStack() {
                
                Color.black.edgesIgnoringSafeArea(.all)
                
                
                ForEach(0..<300, id: \.self) { _ in
                    let randomX = CGFloat.random(in: 0..<screenWidth)
                    let randomY = CGFloat.random(in: 0..<2000)
                    let randomRadius = CGFloat.random(in: 1...5)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: randomRadius, height: randomRadius)
                        .position(x: randomX, y: randomY)
                }
                
                if firstTextVisible{
                    Text("Not long from now, in our galaxy called the Milky Way...")
                        .opacity(1.0)
                        .font(.title)
                        .scaleEffect(0.7)
                        .foregroundColor(.cyan)
                        .padding()
                        .onAppear(){
                            withAnimation(Animation.easeInOut(duration: 4.0)) {
                                DispatchQueue.main.asyncAfter(deadline: .now() +  3.0) {
                                    firstTextVisible = false
                                    animationStart.toggle()
                                }
                                
                            }
                        }
                }
                
                    
                if animationStart{
                    Text(textLines)
                        .font(
                            Font.custom("SF Pro", size: fontSize)
                                .weight(.bold)
                        )
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .opacity(animationEnd ? 0 : /*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                        .frame(width: screenWidth, height: 2000)
                        .offset(y: startMovement ?  -1200: 1000)
                        .onAppear(){
                            withAnimation(Animation.linear(duration: animationEnd ? endAnimationDuration : startAnimationDuration)){
                                startMovement.toggle()
                                playMusic()
                                Timer.scheduledTimer(withTimeInterval: startAnimationDuration, repeats: false) { _ in
                                    music.stop()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() +  self.startAnimationDuration) {
                                    self.animationStart.toggle()
                                    self.animationEnd.toggle()
                                    
                                }
                            }
                        }
                        .onDisappear(){
                            music.stop()
                        }
                }

                
                if animationEnd {
                    ScrollView(showsIndicators: false) {
                        Text(crawlText)
                            .font(
                                Font.custom("SF Pro", size: fontSize)
                                    .weight(.bold)
                            )
                            .foregroundColor(.yellow)
                            .frame(width: 250)
                            .multilineTextAlignment(.center)
                        
                        if userData.user.hasCompletedSetup == false {
                            HStack{
                                NavigationLink(destination: UserSetupView()){
                                    //Image(systemName: "arrowshape.forward.circle")
                                    Label("Start the Journey", systemImage: "arrowshape.forward.circle")
                                        .padding(10)
                                        .background(Color.UserSetup_grey.opacity(0.6))
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                    
                                }
                            }.padding()
                        }
                    }
                    
                }
                
            }
        }
    }
    
    func playMusic() {
        if let musicData = NSDataAsset(name: "Star Wars")?.data {
            if let audioPlayer = try? AVAudioPlayer(data: musicData) {
                music = audioPlayer
                music.numberOfLoops = -1
                music.play()
            }
        }
    }
    
    
}


#Preview {
    InformationView()
        .environmentObject(UserData())
}




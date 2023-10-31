//
//  AROverlayView.swift
//  test-app
//
//  Created by Aleksandr Morozov on 24/10/23.
//

import SwiftUI

struct AROverlayView: View {
    
    @Binding var currentPage: Int
    @EnvironmentObject var userData: UserData
    
    //Retrivs user role and passes it to userRole variable, that alters the strings passed to the information cards.
    
    
    //Mission Infromation Setup
    let instructionsArray = ["Come close to the rock", "Go to the Moon Rover", "Put the samples to the Moon Rover"]
    
    let firstInfoTitle = ["What is this place?", "What is this place?"]
    let firstInfoText = ["You are at Taurus-Littrow Valley, a region within the Apollo 17 landing site. This historic location offers a unique opportunity to collect  rock samples, to understand Moon's geological history.", "You are at Taurus-Littrow Valley, a region within the Apollo 17 landing site. This historic location offers a unique opportunity to collect  rock samples, to understand Moon's geological history."]
    
    let secondInfoTitle = ["How to collect and store the soil?", "How do we test the soil?"]
    let secondInfoText = ["Astronauts typically use specialized equipment like scoops or drills to gather surface samples, ensuring minimal contamination. These samples are then securely sealed in containers, preserving their integrity and preventing any interaction with Earth's atmosphere or potential contaminants.", "Researchers employ techniques such as X-ray diffraction, mass spectrometry, and gas chromatography to determine the mineral composition, age, and presence of water or other vital resources."]

    let thirdInfoTitle = ["How driving on the moon works?", "How the moon rovers are energized ?"]
    let thirdInfoText = ["Rovers on the Moon consider the significantly lower lunar gravity, which is about 1/6 that of Earth, allowing for lighter and more efficient propulsion systems and the ability to traverse the Moon's surface with ease.", "Moon rovers utilize solar panels to capture and store energy from the Sun, while advanced batteries and, in some cases, radioisotope thermoelectric generators provide continuous power, ensuring their efficiency and sustained operation on the lunar surface."]

    
    
    var body: some View {
        let userRole = userData.user.role.rawValue
        NavigationStack {
            
            VStack {
                
                //Information Tag
                HStack {
                
                    Image(systemName: "info.circle.fill")
                    Text(instructionsArray[currentPage])
                    
                }
                .foregroundColor(Color.white)
                .padding()
                .shadow(radius: 5)
                
                Spacer(minLength: 400)
                
                //Information Page Control
                TabView(selection: $currentPage){
                    
                    ARInfoCardView(seqNumber: 1, infoTitle: firstInfoTitle[userRole], infoText: firstInfoText[userRole])
                    .tag(0)
                    
                    ARInfoCardView(seqNumber: 2, infoTitle: secondInfoTitle[userRole], infoText: secondInfoText[userRole])
                    .tag(1)
                    
                    ARInfoCardView(seqNumber: 3, infoTitle: thirdInfoTitle[userRole], infoText: thirdInfoText[userRole])
                    .tag(2)
                    

                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        }
    }
}


#Preview {
    AROverlayView(currentPage: .constant(1))
        .environmentObject(UserData())
}

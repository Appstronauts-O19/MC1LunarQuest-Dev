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
    var userRole: Int {
        switch userData.user.role {
        case .explorer:
            return 0
        case .scientist:
            return 1
        }
    }

    
    
    //Mission Infromation Setup
    let instructionsArray = ["Come close to the rock", "Go to the Moon Rover", "Put the samples to the Moon Rover"]
    
    let firstInfoTitle = ["What is this place?", "PutScienceInfoHere"]
    let firstInfoText = ["You are at Taurus-Littrow Valley, a region within the Apollo 17 landing site. This historic location offers a unique opportunity to collect  rock samples, to understand Moon's geological history.", "PutScienceInfoHere"]
    
    let secondInfoTitle = ["How do we test the soil?", "PutScienceInfoHere"]
    let secondInfoText = ["Researchers employ techniques such as X-ray diffraction, mass spectrometry, and gas chromatography to determine the mineral composition, age, and presence of water or other vital resources.", "PutScienceInfoHere"]

    let thirdInfoTitle = ["How driving on the moon works?", "PutScienceInfoHere"]
    let thirdInfoText = ["Rovers on the Moon consider the significantly lower lunar gravity, which is about 1/6 that of Earth, allowing for lighter and more efficient propulsion systems and the ability to traverse the Moon's surface with ease.", "PutScienceInfoHere"]

    
    
    var body: some View {
        NavigationStack {
            
            //Back to Missions
            HStack{
                
                NavigationLink(destination: MissionsPageView()) {
                    Image(systemName: "arrowshape.backward.circle.fill")
                        .resizable()
                        .frame(width: 35,height: 35)
                    
                }
                .navigationBarBackButtonHidden(true)
                .alignmentGuide(.leading) { d in d[.leading] }
                .foregroundStyle(Color.white)
                .padding(.horizontal, 20)
                .shadow(radius: 10)
                
                Spacer()
            }
    
            
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

struct AROverlayView_Previews: PreviewProvider {
    static var previews: some View {
        AROverlayView(currentPage: .constant(1))
    }
}

//
//  ARInfoCardView.swift
//  test-app
//
//  Created by Aleksandr Morozov on 25/10/23.
//

import SwiftUI

struct ARInfoCardView: View {
    
    var seqNumber : Int
    var infoTitle : String
    var infoText : String
    
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack(){
                
                let imageName = "\(seqNumber).circle"
                Image(systemName: imageName)
                    .bold()
                Text (infoTitle)
                    .bold()
            }
            .padding(.horizontal)
            .padding(.top)
            
            Text(infoText)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .padding(.top, -5)
        }
        .background(.ultraThinMaterial)
        .foregroundStyle(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.white, lineWidth: 1)
                .opacity(0.2)
        )
        .padding()
        
    }
}

#Preview {
    ARInfoCardView(seqNumber: 1, infoTitle: "How do we test the soil?", infoText: "Researchers employ techniques such as X-ray diffraction, mass spectrometry, and gas chromatography to determine the mineral composition, age, and presence of water or other vital resources.")
}

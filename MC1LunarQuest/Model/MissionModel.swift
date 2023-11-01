//
//  MissionModel.swift
//  MC1LunarQuest
//
//  Created by Aleksandr Morozov on 26/10/23.
//

import Foundation
import SwiftUI

struct MissionModel: Identifiable {
    var id: UUID = UUID()
    var missionImage: String
    var missionName: String
    var missionDescription: String
    var badgeName: String = ""
    var completed: Bool = false
    
    var spaceRequirement : String
    var timeRequirement : String
    
    var category : String
    
}

class ViewMissionModel {
    let missions: [MissionModel] = [
        MissionModel(missionImage: "Mission1", missionName: "Moon Soil Sampling", missionDescription: "Explore moon crater, take soil sample to find out if the place is legible for future bases.", badgeName: "Badge1", spaceRequirement: "10", timeRequirement: "5", category: "Moon Exploration"),
        MissionModel(missionImage: "Mission2", missionName: "Mars Exploration", missionDescription: "Is Mars hospitable? Find out what would humankind need to live in Mars.", spaceRequirement: "15", timeRequirement: "15", category: "Mars Exploration"),
        MissionModel(missionImage: "Mission3", missionName: "To infinity and beyond", missionDescription: "What else is out there? ...", spaceRequirement: "2", timeRequirement: "5", category: "Space Exploration")
    ]
}

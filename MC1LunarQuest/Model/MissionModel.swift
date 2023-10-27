//
//  MissionModel.swift
//  MC1LunarQuest
//
//  Created by Aleksandr Morozov on 26/10/23.
//

import Foundation
import SwiftUI

struct MissionModel: Identifiable{
    var id: UUID = UUID()
    var missionImage: String
    var missionName: String
    var missionDescription: String
    var badgeName: String
    var completed: Bool = false
}

class ViewMissionModel {
    let missions: [MissionModel] = [
        MissionModel(missionImage: "Mission1", missionName: "Moon Exploration", missionDescription: "Explore the moon surface and investigate your findings", badgeName: "Badge1"),
        MissionModel(missionImage: "Mission2", missionName: "Mars Exploration", missionDescription: "Is Mars hospitable? Find out what would humankind need to live in Mars.", badgeName: ""),
        MissionModel(missionImage: "Mission3", missionName: "To infinity and beyond", missionDescription: "What else is out there? ...", badgeName: "")
    ]
}

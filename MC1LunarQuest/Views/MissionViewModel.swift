//
//  MissionViewModel.swift
//  MC1LunarQuest
//
//  Created by Aleksandr Morozov on 26/10/23.
//

import Foundation

class MissionViewModel: ObservableObject {
    @Published var currentPage: Int = 0
    @Published var isCoachingOverlayActive: Bool = true

}

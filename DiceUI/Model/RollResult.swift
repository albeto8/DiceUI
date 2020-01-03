//
//  RollResult.swift
//  DiceUI
//
//  Created by Mario Alberto Barragán Espinosa on 02/01/20.
//  Copyright © 2020 Mario Alberto Barragán Espinosa. All rights reserved.
//

import Foundation

class RollResult: Codable {
    let id = UUID()
    let resultText: String
    let date = Date()
    
    init(resultText: String) {
        self.resultText = resultText
    }
}

class RollResults: ObservableObject {
    @Published private(set) var rollResults: [RollResult]
    
    init() {
        self.rollResults = []
    }
    
    func add(_ rollResult: RollResult) {
        self.rollResults.append(rollResult)
    }
}

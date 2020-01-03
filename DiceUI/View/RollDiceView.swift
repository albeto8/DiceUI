//
//  RollDiceView.swift
//  DiceUI
//
//  Created by Mario Alberto Barragán Espinosa on 02/01/20.
//  Copyright © 2020 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI

struct RollDiceView: View {
    
    @EnvironmentObject var results: RollResults
    
    @State private var numberOfSides = 6
    @State private var currentSide = 1
    @State private var delayTime = 0.01
    @State private var isRolling = false
    @State private var currentResult = ""
    private var initialDelayTime = 0.01
    private var lastDelayTime = 0.20
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("\(self.currentSide)")
            }
            Text("\(self.currentResult)")
            .padding()
            Spacer()
            Button("Roll!") {
                self.startRolling()
            }
                .disabled(self.isRolling)
        }
    }
    
    func startRolling() {
        self.isRolling = true
        self.currentResult = "Loading ..."
        self.delayTime = self.initialDelayTime
        self.rollDice()
    }
    
    func rollDice() {
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
            // your code here
            self.currentSide = Int.random(in: 1...self.numberOfSides)
            self.delayTime += self.initialDelayTime
            if self.delayTime > self.lastDelayTime {
                self.isRolling = false
                self.currentResult = "Result \(self.currentSide)"
                let rollResult = RollResult(resultText: self.currentResult)
                self.results.add(rollResult)
                return
            }
            self.rollDice()
        }
    }
}

struct RollDiceView_Previews: PreviewProvider {
    static var previews: some View {
        RollDiceView()
    }
}

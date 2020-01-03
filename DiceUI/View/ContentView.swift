//
//  ContentView.swift
//  DiceUI
//
//  Created by Mario Alberto Barragán Espinosa on 02/01/20.
//  Copyright © 2020 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var rollResults = RollResults()
    
    var body: some View {
        TabView {
            RollDiceView()
                .tabItem {
                    Image(systemName: "play.fill")
                    Text("Roll")
                }
            ResultsView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Results")
                }
        }.environmentObject(rollResults)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

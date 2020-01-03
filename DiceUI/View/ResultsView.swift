//
//  ResultsView.swift
//  DiceUI
//
//  Created by Mario Alberto Barragán Espinosa on 02/01/20.
//  Copyright © 2020 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var results: RollResults
    
    var body: some View {
        List(results.rollResults, id: \.id) { result in
            Text("Result \(result.resultText)")
            Text("Date \(result.date)")
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}

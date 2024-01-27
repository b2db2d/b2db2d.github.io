//
//  TestView.swift
//  B2D
//
//  Created by  b2d on 1/15/24.
//

import SwiftUI

struct TimesSelectView: View {
    @State var nextUI = false
    var body: some View {
        VStack {
                    Text("Select your Time").padding()
                    HStack {
                        Button(action: {
                            ModelData().inputTime = 5
                            self.nextUI = true
                        }) {
                            Text("5 hours")
                        }
                        
                        Button(action: {
                            ModelData().inputTime = 24
                            self.nextUI = true
                        }) {
                            Text("1 day")
                        }
                        
                        Button(action: {
                            ModelData().inputTime = 501
                            self.nextUI = true
                        }) {
                            Text("1 month")
                        }
                    }
                }
                .sheet(isPresented: $nextUI) {
                    CreatureListView()
                }
    }
}

#Preview {
    TimesSelectView()
}

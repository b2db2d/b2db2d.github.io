//
//  TestView.swift
//  B2D
//
//  Created by  b2d on 1/15/24.
//

import SwiftUI

struct TimesSelectView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Select your Time").padding()
                HStack {
                    NavigationLink(destination: CreatureListView()) {
                        Text("5 hours")
                    }
                    NavigationLink(destination: CreatureListView()) {
                        Text("1 day")
                    }
                    NavigationLink(destination: CreatureListView()){
                        Text("3 weeks")
                    }
                }
            }
        }.background(Color.clear)
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    TimesSelectView()
}

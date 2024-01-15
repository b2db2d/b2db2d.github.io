//
//  B2DApp.swift
//  B2D
//
//  Created by  b2d on 1/14/24.
//

import SwiftUI

@main
struct B2DApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView().environment(modelData)
        }
    }
}

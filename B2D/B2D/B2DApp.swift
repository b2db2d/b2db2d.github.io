//
//  B2DApp.swift
//  B2D
//
//  Created by  b2d on 1/14/24.
//

import SwiftUI
import RealityKitContent

@main
struct B2DApp: App {
//    @State private var modelData = ModelData()
    
    @State private var model = ViewModel()
    
    var body: some Scene {
        
        WindowGroup(id: "modules") {
            Modules()
                .environment(model)
        }
        .windowStyle(.plain)
        
        WindowGroup(id: "views"){
            SelectList()
                .environment(model)
        }
        WindowGroup(id: "us"){
            OurStory()
                .environment(model)
        }
        ImmersiveSpace(id: Module.monster.name) {
            Monster()
                .environment(model)
        }
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)

    
    }
    
}


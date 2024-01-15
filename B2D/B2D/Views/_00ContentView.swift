//
//  ContentView.swift
//  B2D
//
//  Created by  b2d on 1/14/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    /*
     @State private var showImmersiveSpace = false
     @State private var immersiveSpaceIsShown = false
     
     @Environment(\.openImmersiveSpace) var openImmersiveSpace
     @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
     */
    var body: some View {
        VStack {
            
           TimesSelectView()
            /*Model3D(named: "Scene", bundle: realityKitContentBundle)
             //  .padding(.bottom, 50)
             
             
             Toggle("1 Day", isOn: $showImmersiveSpace)
             .toggleStyle(.button)
             .padding(.top, 50)
             */
            
            /*
             .onChange(of: showImmersiveSpace) { _, newValue in
             Task {
             if newValue {
             switch await openImmersiveSpace(id: "ImmersiveSpace") {
             case .opened:
             immersiveSpaceIsShown = true
             case .error, .userCancelled:
             fallthrough
             @unknown default:
             immersiveSpaceIsShown = false
             showImmersiveSpace = false
             }
             } else if immersiveSpaceIsShown {
             await dismissImmersiveSpace()
             immersiveSpaceIsShown = false
             }
             }
             } */
        }
    }
}
#Preview(windowStyle: .automatic) {
    ContentView()
}

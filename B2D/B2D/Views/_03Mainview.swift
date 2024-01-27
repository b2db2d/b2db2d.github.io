//
//  ImmersiveView.swift
//  B2D
//
//  Created by  b2d on 1/14/24.
//

import SwiftUI
import RealityKit
import RealityKitContent



struct MainView: View {
    
    
    var body: some View {
        RealityView { content in
            if let baby = try? await Entity(named: "Angel_Wings", in: realityKitContentBundle) {
                content.add(baby)
                @MainActor func playSlimeAnimation() {
                    baby.playAnimation((baby.availableAnimations[0].repeat()), transitionDuration: 0.5, startsPaused: false)
                }
                playSlimeAnimation()
            }
            
        }
        
        
    }
}

#Preview {
    MainView()
        .previewLayout(.sizeThatFits)
}

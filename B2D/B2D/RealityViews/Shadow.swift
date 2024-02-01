/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The model of the Earth.
*/

import SwiftUI
import RealityKit
import RealityKitContent

/// The model of the Earth.
struct Shadow: View {
    var shadowConfiguration: MonsterEntity.Configuration = .init()

    var animateUpdates: Bool = false


    /// The  entity that the view creates and stores for later updates.
    @State private var monsterEntity: MonsterEntity?

    var body: some View {
        RealityView { content in

            let monsterEntity = await MonsterEntity(
                configuration: shadowConfiguration
            )
            content.add(monsterEntity)
            
            @MainActor func playIdleAnimation(){
                monsterEntity.playAnimation(monsterEntity.availableAnimations[0].repeat(), transitionDuration: 0.5, startsPaused: false)
            }
            playIdleAnimation()


            // Store for later updates.
            self.monsterEntity = monsterEntity

        } update: { content in
            // Reconfigure everything when any configuration changes.
            monsterEntity?.update(
                configuration: shadowConfiguration,
                animateUpdates: animateUpdates)
        }
    }
}

#Preview {
    Shadow(
    )
}

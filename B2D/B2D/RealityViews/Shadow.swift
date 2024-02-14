/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The model of the Earth.
*/

import SwiftUI
import RealityKit
import RealityKitContent

struct Shadow: View {
    var shadowConfiguration: MonsterEntity.Configuration = .init()
    var animateUpdates: Bool = false

    /// The entity that the view creates and stores for later updates.
    @State private var monsterEntity: MonsterEntity?

    var body: some View {
        RealityView { content in
            let contentCopy = content
            Task {
                let monsterEntity = await MonsterEntity(
                    configuration: shadowConfiguration
                )
                contentCopy.add(monsterEntity)
                playIdleAnimation(for: monsterEntity)
                // Store for later updates.
                self.monsterEntity = monsterEntity
            }
        } update: { content in
            // Reconfigure everything when any configuration changes.
            _ = content
            Task {
                await monsterEntity?.update(
                    configuration: shadowConfiguration,
                    animateUpdates: animateUpdates)
            }
        }
    }

    @MainActor
    func playIdleAnimation(for entity: MonsterEntity) {
        entity.playAnimation(entity.availableAnimations[0].repeat(), transitionDuration: 0.5, startsPaused: false)
    }
}



#Preview {
    Shadow(
    )
}

import RealityKit
import SwiftUI
import RealityKitContent

class MonsterEntity: Entity {

    private var monster: Entity = Entity()

    @MainActor required init() {
        super.init()
    }

    init(
        configuration: Configuration

    ) async {
        super.init()

        guard let monster = await RealityKitContent.entity(named: "Scene3") else { return }
        self.monster = monster

        self.addChild(monster)

        await update(
            configuration: configuration,
            animateUpdates: false)
    }

    @MainActor func update(
        configuration: Configuration,
        animateUpdates: Bool
    ) async {
        // Call the change function
        await change(date: configuration.date)

        // Scale and position the entire entity.
        move(
            to: Transform(
                scale: SIMD3(repeating: configuration.scale),
                rotation: orientation,
                translation: configuration.position),
            relativeTo: parent)

    }

    @MainActor public func change(date: Date?) async {
        // Extract the month from the date
        let calendar = Calendar.autoupdatingCurrent
        let month = calendar.component(.month, from: date ?? Date())

        // Load a new 3D model based on the month
        let modelName = "Scene\(month)"
        guard let newMonster = await RealityKitContent.entity(named: modelName) else { return }

        // Remove the old monster from its parent
        monster.removeFromParent()

        // Assign the new monster to the monster property
        self.monster = newMonster

        // Add the new monster to the entity
        addChild(monster)
    }

}

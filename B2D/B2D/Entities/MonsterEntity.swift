import RealityKit
import SwiftUI
import RealityKitContent

class MonsterEntity: Entity {
    private var entity: Entity? = Entity()
    var index: Int = 0
    var monster:MonsterData? = nil
    
    @MainActor required init() {
        super.init()
    }
    
    init(
        configuration: Configuration,
        monster: MonsterData?
        
    ) async {
        super.init()
        self.monster = monster
        
        guard let entity = await RealityKitContent.entity(named: monster?.usdz_list[0] ?? "Scene9") else { return }
        self.entity = entity
        self.addChild(entity)
        await update(
            configuration: configuration,
            animateUpdates: false)
    }
    
    @MainActor func update(
        configuration: Configuration,
        animateUpdates: Bool
    ) async {
        // Call the change function
        await changeFunc(date: configuration.date)
        
        // Scale and position the entire entity.
        move(
            to: Transform(
                scale: SIMD3(repeating: configuration.scale),
                rotation: orientation,
                translation: configuration.position),
            relativeTo: parent)
        
    }
    
    @MainActor public func changeFunc(date: Date?) async {
        let calendar = Calendar.autoupdatingCurrent
        _ = calendar.component(.month, from: date ?? Date())
        
        do {
            guard let usdzList = monster?.usdz_list, index < usdzList.count else {
                print("Error: Index out of bounds or usdz_list is nil")
                return
            }
            
            guard let monsterName = monster?.usdz_list[index] else {
                print("Error: \(monster), \(monster?.usdz_list[index])")
                return
            }
            let newMonster = await RealityKitContent.entity(named: monsterName)
            
            self.entity?.removeFromParent()
            self.entity = newMonster
            addChild(self.entity!)
            
            if index+1 != monster?.usdz_list.count
            {
                if let animationKey = self.entity?.availableAnimations.first {
                    self.entity?.playAnimation(animationKey.repeat(), transitionDuration: 0.3, startsPaused: false)
                }
            }
            else{
                if let animationKey = self.entity?.availableAnimations.first {
                    self.entity?.playAnimation(animationKey , transitionDuration: 0.3, startsPaused: false)
                }
            }
            index += 1
            //print(monster?.usdz_list[index] ?? "out of range")
            
        } catch {
            print("Error: \(monster?.usdz_list[index]) is not exist")
        }
    }
}


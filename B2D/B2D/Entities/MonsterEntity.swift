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
        
        guard let monster = monster else {
            print("Error: monster data missing  :MonsterEntity:init")
            return
        }
        guard let entity = await RealityKitContent.entity(named: monster.usdz_list[0]) else { return }
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
        
        guard let monster = self.monster else{
            print("Error: monster data missing  :MonsterEntity:changeFunc")
            return
        }
        if index >= monster.usdz_list.count {
            print("Error: Index out of bounds or usdz_list is nil")
            return
        }
        
        let monsterName = monster.usdz_list[index]
        
        guard let newMonster = await RealityKitContent.entity(named: monsterName)else {
            print("Error: failed load next monster \(monsterName)")
            return
        }
        
        let fadeTime = 0.5
        
        guard let curEntity = self.entity else {
            return
        }
        if index == 0 {
            if let animationKey = curEntity.availableAnimations.first {
                curEntity.playAnimation(animationKey.repeat(), transitionDuration: 0.3, startsPaused: false)
            }
        } else {
            self.fade(entity: curEntity, duration: fadeTime, fadeIn:false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + fadeTime) {
                self.setOpacity(entity: newMonster, opacity: 0)
                self.addChild(newMonster)
                if let animationKey = newMonster.availableAnimations.first {
                    newMonster.playAnimation(animationKey, transitionDuration: 0.3, startsPaused: false)
                }
                self.fade(entity: newMonster, duration: fadeTime)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + fadeTime) {
                    curEntity.removeFromParent()
                    self.entity = newMonster
                }
            }
        }
        index += 1
    }
    
    // Entity Fade in / out
    func setOpacity(entity: Entity, opacity: Float) {
        //        if var opacityComponent = entity.components[OpacityComponent.self] {
        //            print(opacityComponent.opacity)
        //            opacityComponent.opacity = opacity
        //            print(opacityComponent.opacity)
        //        } else {
        entity.components.set(OpacityComponent(opacity: opacity) )
        //}
    }
    
    func fade(entity: Entity, duration: Double, fadeIn:Bool = true){
        let steps = Int(duration * 100)
               let timeInterval = duration / Double(steps)
               for step in 1...steps {
                   DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval * Double(step)) {
                       if step == steps {
                           self.setOpacity(entity: entity, opacity: fadeIn ? 1 : 0)
                       } else {
                           let opacity = fadeIn ? Float(step) / Float(steps) : 1 - Float(step) / Float(steps)
                           self.setOpacity(entity: entity, opacity: opacity)
                       }
                   }
               }
    }
}


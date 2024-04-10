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
            guard let newMonster = await RealityKitContent.entity(named: monsterName)else {
                print("Error: failed load next monster \(monsterName)")
                return
            }
            
            //setOpacity(entity: newMonster, opacity: 0)
            addChild(newMonster)
            
            if index+1 != monster?.usdz_list.count
            {
                if let animationKey = newMonster.availableAnimations.first {
                    newMonster.playAnimation(animationKey.repeat(), transitionDuration: 0.3, startsPaused: false)
                }
            }
            else{
                if let animationKey = newMonster.availableAnimations.first {
                    newMonster.playAnimation(animationKey , transitionDuration: 0.3, startsPaused: false)
                }
            }
            
            let fadeTime = 0.3
            guard let curEntity = self.entity else { return }
           // self.fadeIn(entity: self.entity!, duration: fadeTime)
            //self.entity?.fadeOut(duration: fadeTime, targetOpacity: 0)
            //DispatchQueue.main.asyncAfter(deadline: .now() + fadeTime){
                
            //}
           // self.fadeOut(entity: newMonster, duration: fadeTime)
            //newMonster.fadeIn(duration: fadeTime, targetOpacity: 1)
           // DispatchQueue.main.asyncAfter(deadline: .now() + fadeTime){
                self.entity?.removeFromParent()
                self.entity = newMonster
            //}
            
            index += 1
            
        } catch {
            print("Error: \(monster?.usdz_list[index]) is not exist")
        }
    }
    
    // Entity Fade in / out
    func setOpacity(entity: Entity, opacity: Float) {
        if let modelComponent = entity.components[ModelComponent.self] {
            var newMaterials: [RealityKit.Material] = []
            for material in modelComponent.materials {
                var newMaterial = material
                switch newMaterial {
                case var simpleMaterial as SimpleMaterial:
                    simpleMaterial.color = .init(tint: UIColor(white: 1.0, alpha: CGFloat(opacity)),texture: .none)
                    newMaterial = simpleMaterial
                default:
                    break
                }
                newMaterials.append(newMaterial)
            }
            entity.components[ModelComponent.self]?.materials = newMaterials
        }
    }

    func fadeIn(entity: Entity, duration: Double){
        let steps = Int(duration*100)
           let timeInterval = duration / Double(steps)
           for step in 1...steps {
               DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval * Double(step)) {
                   let opacity = Float(step) / Float(steps)
                   self.setOpacity(entity: entity, opacity: opacity)
               }
           }
    }
    func fadeOut(entity: Entity, duration: Double){
        let steps = Int(duration*100)
           let timeInterval = duration / Double(steps)
           for step in 1...steps {
               DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval * Double(step)) {
                   let opacity = 1 - Float(step) / Float(steps)
                   self.setOpacity(entity: entity, opacity: opacity)
               }
           }
    }
}


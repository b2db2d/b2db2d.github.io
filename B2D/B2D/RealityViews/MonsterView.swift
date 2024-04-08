
import SwiftUI
import RealityKit
import RealityKitContent

struct MonsterView: View {    
    @Environment(ViewModel.self) private var model
    var shadowConfiguration: MonsterEntity.Configuration = .init()
    var animateUpdates: Bool = false
    
    /// The entity that the view creates and stores for later updates.
    @State private var monsterEntity: MonsterEntity?
    
    var body: some View {
        RealityView { content in
            let contentCopy = content
            Task {
                let monsterEntity = await MonsterEntity(
                    configuration: shadowConfiguration,
                    monster: model.myMonster
                )
                
                contentCopy.add(monsterEntity)
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
}

//#Preview {
//    let monster = ModelData().monster["shadow"]
//    return MonsterView(monster:monster, index:0).environment(ModelData()).environment(ViewModel())
//
//}


import SwiftUI
import RealityKit

@Observable
class ViewModel {
    
//    // MARK: - Navigation
    var navigationPath: [Module] = []
    var titleText: String = ""
    var isTitleFinished: Bool = false
    var finalTitle: String = "Birth to Death"

    var myMonster:MonsterData? = nil
    // MARK: - Monster
    var isShowingModule: Bool = false
    var isMonsterRotating: Bool = false
    var isShowingView: Bool = false
    var isShowingUs: Bool = false
    var monsterChange: Singularity = .none
    
    var monsterShadow: MonsterEntity.Configuration = .monsterShadowDefault


}



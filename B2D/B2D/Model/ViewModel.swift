
import SwiftUI

@Observable
class ViewModel {
    
//    // MARK: - Navigation
    var navigationPath: [Module] = []
    var titleText: String = ""
    var isTitleFinished: Bool = false
    var finalTitle: String = "Birth to Death"

    // MARK: - Monster
    var isShowingModule: Bool = false
    var isMonsterRotating: Bool = false
    var isShowingView: Bool = false
    var isShowingUs: Bool = false
    var monsterTilt: GlobeTilt = .none
    
    var monsterShadow: MonsterEntity.Configuration = .monsterShadowDefault

}



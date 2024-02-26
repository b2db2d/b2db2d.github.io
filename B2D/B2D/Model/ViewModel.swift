
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
    var monsterChange: Singularity = .none
    
    var monsterShadow: MonsterEntity.Configuration = .monsterShadowDefault

    // ModelData 에 있던 inputTime 을 여기로 옮겼음
    // 단위는 초단위
    var inputTime:Double = 0

}



import SwiftUI

@Observable
class MonsterControls {
    private var model: ViewModel
    private var isPickerVisible: Bool = false
    
    // MonsterEntity 클래스의 인스턴스를 옵셔널로 선언
    private var monsterEntity: MonsterEntity?
    
    private var change: Singularity? = Singularity.none
    
    var timer: Timer? = nil
    
    init(model:ViewModel){
        self.model = model
        birth()
    }
    
    func birth(){
        guard
            model.inputTime.truncatingRemainder(dividingBy: 4) == 0 else{
            // 초 단위는 없을 것 같아서 여길 들어올 일은 없을 거라 생각해서 일단 지금은 이렇게 사용하는 것으로..
            print("Error: inputTime 이 이상함.( 4로 나눌 수 없음.)")
            return
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: model.inputTime / 4 , repeats: true) { [weak self] _ in
            guard let self = self else {return}
            self.change = change?.next()
            if let change = self.change {
                self.model.monsterChange = change
                self.model.monsterShadow.date = change.date
                Task {
                    if self.monsterEntity == nil {
                        self.monsterEntity = await MonsterEntity()
                    }
                    await self.monsterEntity?.changeFunc(date: change.date)
                }
            } else {
                death()
            }
            
        }
    }
    
    func death(){
        self.timer?.invalidate()
        self.timer = nil
        self.model.isShowingModule = false
    }
    
}


// 새롭게 넣은 Singularity 변수입니다.
// https://github.com/b2db2d/b2db2d.github.io/issues/13#issue-2128056804
// 위에를 클릭해서 보시면 정의 해놓았어요
enum Singularity: String, CaseIterable, Identifiable {
    case none, march, june, september
    var id: Self { self }
    
    var date: Date? {
        let month = switch self {
        case .none: 2
        case .march: 3
        case .june: 6
        case .september: 10
        }
        
        if month == 0 {
            return nil
        } else {
            return Calendar.autoupdatingCurrent.date(from: .init(month: month, day: 21))
        }
    }
    
    func next() -> Singularity? {
        let allCases = Singularity.allCases
        let currentIndex = allCases.firstIndex(of: self)!
        let nextIndex = allCases.index(after: currentIndex)
        
        if nextIndex == allCases.endIndex {
            return nil
        } else {
            return allCases[nextIndex]
        }
    }
}


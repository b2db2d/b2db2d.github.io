import SwiftUI

var timer: Timer? = nil
struct MonsterControls: View {
    @Environment(ViewModel.self) private var model
    @State private var isPickerVisible: Bool = false

    // MonsterEntity 클래스의 인스턴스를 옵셔널로 선언
    @State private var monsterEntity: MonsterEntity?
    
    @State private var change: Singularity? = Singularity.none

    var body: some View {
        @Bindable var model = model

        VStack() {
           
            HStack(spacing: 17) {
                Toggle(isOn: $isPickerVisible) {
                    Label("Change", systemImage: "clock")
                }
            }
            .toggleStyle(.button)
            .buttonStyle(.borderless)
            .labelStyle(.iconOnly)
            .padding(12)
            .glassBackgroundEffect(in: .rect(cornerRadius: 50))
            .alignmentGuide(.controlPanelGuide) { context in
                context[HorizontalAlignment.center]
            }
        } .onAppear {
            timer?.invalidate()
            
            guard
                model.inputTime.truncatingRemainder(dividingBy: 4) == 0 else{
                // 초 단위는 없을 것 같아서 여길 들어올 일은 없을 거라 생각해서 일단 지금은 이렇게 사용하는 것으로..
                print("Error: inputTime 이 이상함.( 4로 나눌 수 없음.)")
                return
            }
            
            timer = Timer.scheduledTimer(withTimeInterval: model.inputTime / 4 , repeats: true) { _ in
                change = change?.next()
                if let change = change {
                    model.monsterChange = change
                    // print("@@@@@" , change)
                    model.monsterShadow.date = change.date
                    Task {
                        if monsterEntity == nil {
                            monsterEntity = MonsterEntity()
                        }
                        await monsterEntity?.changeFunc(date: change.date)
                    }
                } else {
                    timer?.invalidate()
                    timer = nil
                }
                
            }
        }
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

#Preview {
    MonsterControls()
        .environment(ViewModel())
}

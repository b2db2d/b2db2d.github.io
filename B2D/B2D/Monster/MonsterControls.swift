import SwiftUI

struct MonsterControls: View {
    @Environment(ViewModel.self) private var model
    @State private var isPickerVisible: Bool = false

    // MonsterEntity 클래스의 인스턴스를 옵셔널로 선언
    @State private var monsterEntity: MonsterEntity?

    var body: some View {
        @Bindable var model = model

        VStack(alignment: .changeButtonGuide) {
            MonsterChangePicker(isVisible: $isPickerVisible)
                .alignmentGuide(.changeButtonGuide) { context in
                    context[HorizontalAlignment.center]
                }
            HStack(spacing: 17) {
                Toggle(isOn: $isPickerVisible) {
                    Label("Change", systemImage: "clock")
                }
                .alignmentGuide(.changeButtonGuide) { context in
                    context[HorizontalAlignment.center]
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
        }

        // Update the date that controls the monster's change
        .onChange(of: model.monsterChange) { _, change in
            model.monsterShadow.date = change.date
            Task {
                if monsterEntity == nil {
                    monsterEntity = MonsterEntity()
                }
                await monsterEntity?.changeFunc(date: change.date)
            }
        }
    }
}

// 아시겠지만 이 아래 부터 표시한 거 까지인 버튼 부분, picker 부분은 지워져야 합니다.
/// A custom picker for choosing a time of year.
private struct MonsterChangePicker: View {
    @Environment(ViewModel.self) private var model
    @Binding var isVisible: Bool
    

    var body: some View {
        Grid(alignment: .leading) {
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            ForEach(Singularity.allCases) { change in
                GridRow {
                    Button {
                        model.monsterChange = change
                        isVisible = false
                    } label: {
                        Text(change.name)
                    }
                    .buttonStyle(.borderless)
                   
                    Image(systemName: "checkmark")
                        .accessibility(hidden: true)
                        .opacity(change == model.monsterChange ? 1 : 0)
                        
                }
            }
        }
        .padding(12)
        .glassBackgroundEffect(in: .rect(cornerRadius: 20))
        .opacity(isVisible ? 1 : 0)
        .animation(.default.speed(2), value: isVisible)
        .onChange(of: isVisible) { }
    }
}

extension HorizontalAlignment {
    private struct changeButtonAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }

    /// A custom alignment guide to center the tilt menu over its button.
    fileprivate static let changeButtonGuide = HorizontalAlignment(
        changeButtonAlignment.self
    )
}

////////////////////////////////////////////////////////////////////////////////////////// 여기까지가 버튼 부분

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
///////// 이 아래 부분도 아마 버튼 빼면 없어져야 할거에요
    var name: String {
        switch self {
        case .none: "None"
        case .march: "March equinox"
        case .june: "June solstice"
        case .september: "September equinox"
        }
    }
}

#Preview {
    MonsterControls()
        .environment(ViewModel())
}

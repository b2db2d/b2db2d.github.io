

import SwiftUI

struct MonsterControls: View {
    @Environment(ViewModel.self) private var model
    @State private var isTiltPickerVisible: Bool = false

    // MonsterEntity 클래스의 인스턴스를 옵셔널로 선언
    @State private var monsterEntity: MonsterEntity?

    var body: some View {
        @Bindable var model = model

        VStack(alignment: .tiltButtonGuide) {
            GlobeTiltPicker(isVisible: $isTiltPickerVisible)
                .alignmentGuide(.tiltButtonGuide) { context in
                    context[HorizontalAlignment.center]
                }
                .accessibilitySortPriority(1)

            HStack(spacing: 17) {
                Toggle(isOn: $isTiltPickerVisible) {
                    Label("Tilt", systemImage: "clock")
                }
                .alignmentGuide(.tiltButtonGuide) { context in
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
            .accessibilitySortPriority(2)
        }

        // Update the date that controls the Earth's tilt.
        .onChange(of: model.monsterTilt) { _, tilt in
            model.monsterShadow.date = tilt.date
            Task {
                if monsterEntity == nil {
                    monsterEntity = await MonsterEntity()
                }
                await monsterEntity?.change(date: tilt.date)
            }
        }
    }
}




/// A custom picker for choosing a time of year.
private struct GlobeTiltPicker: View {
    @Environment(ViewModel.self) private var model
    @Binding var isVisible: Bool
    @AccessibilityFocusState var axFocusTiltMenu: Bool

    var body: some View {
        Grid(alignment: .leading) {
            Text("Tilt")
                .font(.title)
                .padding(.top, 5)
                .gridCellAnchor(.center)
                .accessibilityFocused($axFocusTiltMenu)
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            ForEach(GlobeTilt.allCases) { tilt in
                GridRow {
                    Button {
                        model.monsterTilt = tilt
                        isVisible = false
                    } label: {
                        Text(tilt.name)
                    }
                    .buttonStyle(.borderless)
                    .accessibilityAddTraits(tilt == model.monsterTilt ? .isSelected : [])
                    Image(systemName: "checkmark")
                        .opacity(tilt == model.monsterTilt ? 1 : 0)
                        .accessibility(hidden: true)
                }
            }
        }
        .padding(12)
        .glassBackgroundEffect(in: .rect(cornerRadius: 20))
        .opacity(isVisible ? 1 : 0)
        .animation(.default.speed(2), value: isVisible)
        .onChange(of: isVisible) { axFocusTiltMenu = true }
    }
}

extension HorizontalAlignment {
    /// A custom alignment to center the tilt menu over its button.
    private struct TiltButtonAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }

    /// A custom alignment guide to center the tilt menu over its button.
    fileprivate static let tiltButtonGuide = HorizontalAlignment(
        TiltButtonAlignment.self
    )
}

enum GlobeTilt: String, CaseIterable, Identifiable {
    case none, march, june, september
    var id: Self { self }

    var date: Date? {
        let month = switch self {
        case .none: 2
        case .march: 3
        case .june: 6
        case .september: 9
        }

        if month == 0 {
            return nil
        } else {
            return Calendar.autoupdatingCurrent.date(from: .init(month: month, day: 21))
        }
    }

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

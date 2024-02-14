
import SwiftUI

struct Monster: View {
    @Environment(ViewModel.self) private var model

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .controlPanelGuide, vertical: .bottom)) {
            Shadow(
                shadowConfiguration: model.monsterShadow,
                animateUpdates: true
            )
      
            .alignmentGuide(.controlPanelGuide) { context in
                context[HorizontalAlignment.center]
            }

            MonsterControls()
                .offset(y: 0)
        }
//        .onChange(of: model.isMonsterRotating) { _, isRotating in
//            model.monsterShadow.speed = isRotating ? 0.1 : 0
//        }

    }
}

extension HorizontalAlignment {
    /// A custom alignment to center the control panel under the globe.
    private struct ControlPanelAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }

    /// A custom alignment guide to center the control panel under the globe.
    static let controlPanelGuide = HorizontalAlignment(
        ControlPanelAlignment.self
    )
}

#Preview {
    Monster()
        .environment(ViewModel())
}

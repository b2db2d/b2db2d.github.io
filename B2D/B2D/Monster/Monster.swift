
import SwiftUI

struct Monster: View {
    @Environment(ViewModel.self) private var model
    @State private var monsterControls: MonsterControls?
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .controlPanelGuide, vertical: .bottom)) {
            MonsterView(
                //shadowConfiguration 얘가 중요함
                shadowConfiguration: model.monsterShadow,
                animateUpdates: true
            ).environment(model)
                .alignmentGuide(.controlPanelGuide) { context in
                    context[HorizontalAlignment.center]
                }
            
        }
        .onAppear{
            self.monsterControls = MonsterControls(model: model)
            
        }
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

import SwiftUI
import _RealityKit_SwiftUI
import RealityKit
import RealityKitContent

struct ModelView: View {
    @State private var isAnimating = false
    @State private var hasAppeared = false

    var body: some View {
        VStack {
            Model3D (named: "Angel_Wings", bundle: realityKitContentBundle, content: { model in
                model
                    
                    .hoverEffect(.automatic)
                    .animation(.smooth, value: isAnimating)
            }, placeholder: { ProgressView()})
            .padding(.bottom, 50)
            .onAppear {
                isAnimating = true
                hasAppeared = true
                
            }

        }
    }
}

#Preview {
    ModelView()
}

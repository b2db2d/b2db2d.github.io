/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A toggle that activates or deactivates the solar system scene.
*/

import SwiftUI

/// A toggle that activates or deactivates the solar system scene.
struct AboutUs: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        @Bindable var model = model

        Toggle("click", isOn: $model.isShowingUs)
            .onChange(of: model.isShowingUs) { _, isShowing in
                if isShowing {
                    openWindow(id: "us")
                } else {
                    dismissWindow(id: "us")
                }
            }
            .toggleStyle(.button)
    }
}



//#Preview {
//    SolarSystemToggle()
//        .environment(ViewModel())
//}

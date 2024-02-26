/*
 See the LICENSE.txt file for this sample’s licensing information.
 
 Abstract:
 A toggle that activates or deactivates the globe volume.
 */

import SwiftUI

/// A toggle that activates or deactivates the globe volume.
struct MonsterToggle: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        @Bindable var model = model
        
        Toggle(Module.monster.callToAction, isOn: $model.isShowingModule)
            .onChange(of: model.isShowingModule) { _, isShowing in
                if isShowing {
                    Task{
                        await openImmersiveSpace(id:  Module.monster.name)
                    }
                } else {
                    Task{
                        await dismissImmersiveSpace()
                    }
                }
            }
            .toggleStyle(.button)
    }
}

#Preview {
    MonsterToggle()
        .environment(ViewModel())
}

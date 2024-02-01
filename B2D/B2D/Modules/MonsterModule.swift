/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The module detail content that's specific to the globe module.
*/

import SwiftUI

/// The module detail content that's specific to the globe module.
struct MonsterModule: View {
    var body: some View {
        Image("egg")
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    MonsterModule()
        .padding()
}

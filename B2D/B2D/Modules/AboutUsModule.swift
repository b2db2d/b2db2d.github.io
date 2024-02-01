/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The module detail content that's specific to the solar system module.
*/

import SwiftUI

/// The module detail content that's specific to the solar system module.
struct AboutUsModule: View {
    var body: some View {
        Image("Coufun")
            .resizable()
            .frame(width: 300, height: 200)
    }
}

#Preview {
    AboutUsModule()
        .padding()
}

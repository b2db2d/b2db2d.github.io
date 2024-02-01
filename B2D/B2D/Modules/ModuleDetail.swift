/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A detail view that presents information about different module types.
*/

import SwiftUI

/// A detail view that presents information about different module types.
struct ModuleDetail: View {
    @Environment(ViewModel.self) private var model

    var module: Module

    var body: some View {
        @Bindable var model = model

        GeometryReader { proxy in
            let textWidth = min(max(proxy.size.width * 0.4, 300), 500)
            let imageWidth = min(max(proxy.size.width - textWidth, 300), 700)
            ZStack {
                HStack(spacing: 50) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(module.heading)
                            .font(.system(size: 50, weight: .bold))
                            .padding(.bottom, 15)
                            .accessibilitySortPriority(4)

                        Text(module.overview)
                            .padding(.bottom, 30)
                            .accessibilitySortPriority(3)

                        switch module {
                        case .monster:
                            TimesSelectView()
                        case .us:
                            AboutUs()
                        }
                    }
                    .frame(width: textWidth, alignment: .leading)

                    module.detailView
                        .frame(width: imageWidth, alignment: .center)
                }
                .offset(y: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(100)

        // A settings button in an ornament,
        // visible only when `showDebugSettings` is true.
//        .settingsButton(module: module)
   }
}

extension Module {
    @ViewBuilder
    fileprivate var detailView: some View {
        switch self {
        case .monster: MonsterModule()
        case .us: AboutUsModule()
            
        }
    }
}

#Preview("Start") {
    NavigationStack {
        ModuleDetail(module: .monster)
            .environment(ViewModel())
    }
}


#Preview("About us") {
    NavigationStack {
        ModuleDetail(module: .us)
            .environment(ViewModel())
    }
}

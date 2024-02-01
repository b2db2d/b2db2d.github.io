/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The launching point for the app's modules.
*/

import SwiftUI

/// The launching point for the app's modules.
struct TableOfContents: View {
    @State private var mainViewHasAppeared = false
    @Environment(ViewModel.self) private var model
     

    var body: some View {
        @Bindable var model = model
        
        ZStack {
            AnimatedBackground(shouldDisable: $mainViewHasAppeared).edgesIgnoringSafeArea(.all)
                .blur(radius: 60)
            
            VStack {
                Spacer(minLength: 120)

                VStack {

                    TitleText(title: model.finalTitle)
                        .padding(.horizontal, 70)
                        .hidden()
                        .overlay(alignment: .center) {
                            TitleText(title: model.titleText)
                                
                                .animation(.easeIn(duration: 3), value: model.titleText)
                                .opacity(model.isTitleFinished ? 1 : 0)
                        }
                    Text("Explore the unique advantages of utilizing an AR app for time management")
                        .font(.subheadline)
                        .opacity(model.isTitleFinished ? 1 : 0)
                }
                .alignmentGuide(.shadowGuide) { context in
                    context[VerticalAlignment.top]
                }
                .padding(.bottom, 40)

                HStack(alignment: .top, spacing: 30) {
                    ForEach(Module.allCases) {
                        ModuleCard(module: $0)
                    }
                }
                .padding(.bottom, 50)
                .opacity(model.isTitleFinished ? 1 : 0)

                Spacer()
            }
            .padding(.horizontal, 50) 
            .fadeInText(
                text: $model.titleText,
                finalText: model.finalTitle,
                isFinished: $model.isTitleFinished,
                isAnimated: !model.isTitleFinished)

              
   
            
            .background(alignment: Alignment(horizontal: .center, vertical: .shadowGuide)) {
   
            }
        .animation(.default.speed(0.25), value: model.isTitleFinished)
        }
    }
    
    
}

/// The text that displays the app's title.
private struct TitleText: View {
    var title: String
    var body: some View {
        Text(title)
            .monospaced()
            .font(.system(size: 60, weight: .bold))
    }
}

extension VerticalAlignment {
    /// A custom alignment that pins the background image to the title.
    private struct ShadowAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.top]
        }
    }

    /// A custom alignment guide that pins the background image to the title.
    fileprivate static let shadowGuide = VerticalAlignment(
        ShadowAlignment.self
    )
}

#Preview {
    NavigationStack {
        TableOfContents()
            .environment(ViewModel())
    }
}

/* 페이드인 애니메이션 첫번째 버전*/

//import SwiftUI
//
//struct FadeInTextModifier: ViewModifier {
//    let finalText: String
//    @State private var displayedText = ""
//    @State private var isFinished = false
//
//    func body(content: Content) -> some View {
//        content
//            .overlay(
//                Text(displayedText)
//                    .transition(.opacity)
//                    .onAppear {
//                        let _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                            if displayedText.count < finalText.count {
//                                withAnimation(.linear(duration: 0.1)) {
//                                    displayedText.append(finalText[finalText.index(finalText.startIndex, offsetBy: displayedText.count)])
//                                }
//                            } else {
//                                isFinished = true
//                                timer.invalidate()
//                            }
//                        }
//                    }
//            )
//    }
//}
//
//extension View {
//    func fadeInText(finalText: String) -> some View {
//        self.modifier(FadeInTextModifier(finalText: finalText))
//    }
//}

/* 두번째 버전*/

import SwiftUI

private struct FadeInTextModifier: ViewModifier {
    @Binding var text: String
    var finalText: String
    @Binding var isFinished: Bool
    var isAnimated: Bool

    func body(content: Content) -> some View {
        content
            .onAppear {
                if isAnimated == false {
                    text = finalText
                    isFinished = true
                } 
                
                
                else
                
                {
                    let _ = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                        if text.count < finalText.count {
                            text.append(finalText[finalText.index(finalText.startIndex, offsetBy: text.count)])
                        } else {
                            isFinished = true
                            timer.invalidate()
                        }
                    }
                }
                
                    
            }
    }
}

extension View {
    func fadeInText(text: Binding<String>, finalText: String, isFinished: Binding<Bool>, isAnimated: Bool = true
    ) -> some View {
        self.modifier(
            FadeInTextModifier(
                text: text,
                finalText: finalText,
                isFinished: isFinished, 
                isAnimated: isAnimated))
    }
}


/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The control panel to display along with the solar system view.
*/

import SwiftUI

/// The control panel to display along with the solar system view.
struct OurStory: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var mailCount = 0

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button {
                        withAnimation { mailCount -= 1 }
                    } label: {
                        Label("Previous", systemImage: "chevron.left")
                    }
                    .disabled(mailCount == 0)
                    .padding()

                    Spacer()

                    Text("Contact Us")
                        .font(.title)

                    Spacer()

                    Button {
                        withAnimation { mailCount += 1 }
                    } label: {
                        Label("Next", systemImage: "chevron.right")
                    }
                    .disabled(mailCount == Module.emails.count - 1)
                    .padding()
                }
                .labelStyle(.iconOnly)

                ZStack {
                    ForEach(Module.emails, id: \.self) { email in
                        Text(email)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal)
                            .opacity(email == Module.emails[mailCount] ? 1 : 0)
                    }
                }
                .animation(.default, value: mailCount)

                Divider()
                    .padding()

                AboutUs()
                    .buttonStyle(.borderless)
                    .padding(.bottom)

               
            }
            .frame(width: 500)
            .glassBackgroundEffect(in: .rect(cornerRadius: 40))
            
        }
    }
}

#Preview {
    OurStory()
        .environment(ViewModel())
}

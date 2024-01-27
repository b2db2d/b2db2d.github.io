//
//  Button.swift
//  B2D
//
//  Created by Birth2Death on 1/27/24.
//

import Foundation
import SwiftUI


//    .buttonStyle(PinkButtonStyle())


struct PinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.title)
            .foregroundColor(.white)
            .background(configuration.isPressed ? Color.blue : Color.pink)
            .cornerRadius(5)
    }
}

//
//  ContentView.swift
//  B2D
//
//  Created by  b2d on 1/14/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    var body: some View {
        let startDate = Date()
        
        
        ZStack{
            AnimatedBackground()
                .blur(radius: 50)
            TimelineView(.animation) { context in
                NavigationView(){
                    
                    NavigationLink(destination: TimesSelectView()) {
                        Image(systemName: "play")
                            .padding(.all)
                            .font(.system(size: 150))
                        
                           
                    }.buttonStyle(PinkButtonStyle())
//                    .distortionEffect(ShaderLibrary.simpleWave(.float(startDate.timeIntervalSinceNow)), maxSampleOffset: .zero)
                    
                    
                  
                }
                .navigationViewStyle(StackNavigationViewStyle())
                
                
                
            }
            
        }
    }
    
}

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


//extension UIColor {
//    
//    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
//        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
//        
//        if hexFormatted.hasPrefix("#") {
//            hexFormatted = String(hexFormatted.dropFirst())
//        }
//        
//        assert(hexFormatted.count == 6, "Invalid hex code used.")
//        
//        var rgbValue: UInt64 = 0
//        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
//        
//        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//                  alpha: alpha)
//    }
//}

#Preview(windowStyle: .automatic) {
    ContentView()
}

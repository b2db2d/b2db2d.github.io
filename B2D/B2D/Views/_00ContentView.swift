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
    @State private var mainViewHasAppeared = false
    
    var body: some View {
        
        ZStack{
            if !mainViewHasAppeared {
                            AnimatedBackground(shouldDisable: $mainViewHasAppeared)
                                .blur(radius: 50)
                        }
           
            TimelineView(.animation) { context in
                NavigationView(){
                    
                    NavigationLink(destination: TimesSelectView()
                        .onAppear{
                        mainViewHasAppeared = true
                            }
                        )
                    {
                        Image(systemName: "play")
                            .padding(.all)
                            .font(.system(size: 90))
                        
                    }
// button style position
     
                }
                .navigationViewStyle(StackNavigationViewStyle())
                
            }
            
            
        }
        
    }
}
    

#Preview(windowStyle: .automatic) {
    ContentView()
}

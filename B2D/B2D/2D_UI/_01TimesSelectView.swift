//
//  TestView.swift
//  B2D
//
//  Created by  b2d on 1/15/24.
//

import SwiftUI




struct SelectList: View {
    @State var nextUI = false
    @Environment(ViewModel.self) private var model

    var body: some View {
        VStack {
            Text("Select your Time").padding()
            HStack {
                Button(action: {
                    model.inputTime = 60
                    self.nextUI = true
                }) {
                    Text("1 minuate")
                        .padding(20)
                }
                
                Button(action: {
                    model.inputTime = 7200
                    self.nextUI = true
                }) {
                    Text("2 hours")
                        .padding(20)
                }
                
                Button(action: {
                    model.inputTime = 86400
                    self.nextUI = true
                }) {
                    Text("1 day")
                        .padding(20)
                }
                
            }
        }
        .sheet(isPresented: $nextUI) {
            CreatureListView()
        }
    }
}



struct TimesSelectView: View {
    @Environment(ViewModel.self) private var model

    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    @State var isSelectListActive = false


    var body: some View {
        @Bindable var model = model
        
        
        Toggle(Module.monster.callToAction, isOn: $model.isShowingView)
            .onChange(of: model.isShowingView) { _, isShowing in
                
                if isShowing {
                    
                    openWindow(id: "views")
                } else {
                    
                    dismissWindow(id: "modules")
                }
            }
            .toggleStyle(.button)

    }
}

//
//#Preview {
//    TimesSelectView()
//}

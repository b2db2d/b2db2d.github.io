import SwiftUI

struct CreatureListView: View {
    @State var modelData = ModelData()
    @State var id:Int = 0
    var maxIndex:Int {ModelData().monsters.count-1}
    
    
    
    @State private var mainViewHasAppeared = false
    
    @Environment(ViewModel.self) private var model
    
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    
    
    var body: some View {
        @Bindable var model = model
        ZStack{
            if !mainViewHasAppeared {
                AnimatedBackground(shouldDisable: $mainViewHasAppeared)
                    .blur(radius: 50)
            }
            VStack {
                Text("Select your Egg").padding()
                HStack{
                    Button{
                        id = id-1
                        if id < 0{
                            id = maxIndex
                        }
                    }label: {
                        Image(systemName: "chevron.left")
                    }
                    modelData.monsters[id].image.resizable().frame(width:60, height: 80)
                        .shadow(radius: 7)
                        .padding()
                    Button{
                        id = id+1
                        if id > maxIndex {
                            id = 0
                        }
                    }label: {
                        Image(systemName: "chevron.right")
                    }
                }
                
                MonsterToggle(monster: $modelData.monsters[id])
            }
        }
        .animation(.default, value: model.isShowingUs)
        
        // Close any open detail view when returning to the table of contents.
        .onChange(of: model.navigationPath) { _, path in
            if path.isEmpty {
                if model.isShowingView {
                    dismissWindow(id: "views")
                }
            }
        }
        
    }
}

//#Preview {
//    CreatureListView()
//}

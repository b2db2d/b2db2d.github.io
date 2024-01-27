//import SwiftUI
//import RealityKit
//import RealityKitContent
//
//
//
//struct AnimationView: View {
//    
//    
//    let slime = try? ModelEntity.load(named: "Angel_Wings")
//    func playSlimeAnimation() {
//        slime?.playAnimation((slime?.availableAnimations[0].repeat())!, transitionDuration: 0.5, startsPaused: false)
//    }
//
//
//
////    class MyEntity {
////        let entity: Entity
////        var animationResource: AnimationResource
////        
////        init(){
////            self.entity = try! Entity.load(named: "slime", in: realityKitContentBundle)
////            self.animationResource = entity.availableAnimations[0]
////        }
////    }
////    
////    class MyEntity2 {
////        let entity2 = try! Entity.load(named: "slime")
////        lazy var animationResource: AnimationResource = {
////            return entity2.availableAnimations[0]
////        }()
////    }
//  
//    
//
//    var body: some View {
////        let entity = MyEntity()
////        let animationResource = myEntity.animationResource
//        
////        RealityView { content in
////            if let model = try? await Entity.init(named: "slime", in: realityKitContentBundle) {
////                let anchor = AnchorEntity()
////                anchor.addChild(model)
////                content.add(anchor)
////                
////                //                Entity.playAnimation(Entity(named: "slime", in: realityKitContentBundle), animation: AnimationResource, transitionDuration: TimeInterval = 0, blendLayerOffset: Int = 0, separateAnimatedValue: Bool = false, startsPaused: Bool = false, handoffType: AnimationHandoffType = .default)
////                
////            }
////        } update: { updateContent in
////            updateContent.entities.removeAll()
////            entity.renew()
////            for element in entity.all {
////                updateContent.add(element)
////            }
////       }
//        Text("click")
//        .onAppear {
//                playSlimeAnimation()
//            }
//        
//    }
//}
//
//#Preview(){
//    AnimationView()
//}
//

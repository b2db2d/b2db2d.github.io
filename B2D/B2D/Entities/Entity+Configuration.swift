
import SwiftUI

extension MonsterEntity {
    /// Configuration information for Shadow entities.
    struct Configuration {
        var scale: Float = 4.5
        var position: SIMD3<Float> = .init(x: 0.0, y: -0.2, z: 0)
        var speed: Float = 0
        var isPaused: Bool = false
        var date: Date? = nil
        
        var axActions: [LocalizedStringResource] = []
        var axDescribeTilt: Bool = false

        var currentSpeed: Float {
            isPaused ? 0 : speed
        }

        
        static var monsterShadowDefault: Configuration = .init(
            axActions: AccessibilityActions.rotate,
            axDescribeTilt: true
        )

    }
    
    //TODO: 아니 이거 솔직히 지워도 되는 거 아니냐고...
    enum AccessibilityActions {
        case zoomIn, zoomOut, rotateCW, rotateCCW

        /// The name of the action that VoiceOver reads aloud.
        var name: LocalizedStringResource {
            switch self {
            case .zoomIn: "Zoom in"
            case .zoomOut: "Zoom out"
            case .rotateCW: "Rotate clockwise"
            case .rotateCCW: "Rotate counterclockwise"
            }
        }

        /// The collection of zoom actions.
        static var zoom: [LocalizedStringResource] {
            [zoomIn.name, zoomOut.name]
        }

        /// The collection of rotation actions.
        static var rotate: [LocalizedStringResource] {
            [rotateCW.name, rotateCCW.name]
        }
    }

}


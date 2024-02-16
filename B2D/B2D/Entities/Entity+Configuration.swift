import SwiftUI

extension MonsterEntity {
    /// Configuration information for Monster entities.
    struct Configuration {
        var scale: Float = 4.5
        var position: SIMD3<Float> = .init(x: 0.0, y: -0.2, z: 0)
        var speed: Float = 0
        var isPaused: Bool = false
        var date: Date? = nil

        var currentSpeed: Float {
            isPaused ? 0 : speed
        }
            
        static var monsterShadowDefault: Configuration = .init()
    }
}


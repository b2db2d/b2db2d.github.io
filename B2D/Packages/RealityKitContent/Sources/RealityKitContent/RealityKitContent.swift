import Foundation
import RealityKit

/// Bundle for the RealityKitContent project
public let realityKitContentBundle = Bundle.module



public let sceneName = "Earth.usda"
public let rootNodeName = "Earth"
public let panSpeedParameterName = "pan_speed"
public let minimumCloudOpacityParameterName = "cloud_min_opacity"
public let maximumCloudOpacityParameterName = "cloud_max_opacity"
public let lightsMaximuIntensityParameterName = "light_max_intensity"


//lighting
public let sunAngleParameterName = "sun_angle"


//useful entity define
public func entity(named name: String) async -> Entity? {
    do {
        return try await Entity(named: name, in: realityKitContentBundle)

    } catch is CancellationError {
        // The entity initializer can throw this error if an enclosing
        // RealityView disappears before the model loads. Exit gracefully.
        return nil

    } catch let error {
        // Other errors indicate unrecoverable problems.
        fatalError("Failed to load \(name): \(error)")
    }
}

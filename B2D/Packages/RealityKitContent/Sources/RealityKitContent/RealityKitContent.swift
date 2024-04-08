import Foundation
import RealityKit

/// Bundle for the RealityKitContent project
// TODO: change package name!

public let realityKitContentBundle = Bundle.module

public let sceneName = "Scene.usda"
public let rootNodeName = "Scene"


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

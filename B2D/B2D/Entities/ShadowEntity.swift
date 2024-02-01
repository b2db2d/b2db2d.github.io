

import RealityKit
import SwiftUI
import RealityKitContent

class MonsterEntity: Entity {

    // MARK: - Sub-entities

    /// The model that draws the monster''s surface features.
    private var monster: Entity = Entity()

    /// An entity that rotates 23.5° to create axial tilt.
    private let equatorialPlane = Entity()

    /// An entity that provides a configurable rotation,
    /// separate from the day/night cycle.
    private let rotator = Entity()


    // MARK: - Internal state

    // MARK: - Initializers

    /// Creates a new blank earth entity.
    @MainActor required init() {
        super.init()
    }

    init(
        configuration: Configuration

    ) async {
        super.init()

        // Load models.
        guard let monster = await RealityKitContent.entity(named: "Scene") else { return }
        self.monster = monster


        //TODO: 이 부분을 후에 쓸모가 없음
        // Attach to the Shadow to a set of entities that enable axial
        // tilt and a configured amount of rotation around the axis.
        self.addChild(equatorialPlane)
        equatorialPlane.addChild(rotator)
        rotator.addChild(monster)

        // Configure everything for the first time.
        update(
            configuration: configuration,
            animateUpdates: false)
    }

    // MARK: - Updates

    /// Updates all the entity's configurable elements.
    ///
    /// - Parameters:
    ///   - configuration: Information about how to configure the Earth.
    ///   - animateUpdates: A Boolean that indicates whether changes to certain
    ///     configuration values should be animated.
    func update(
        configuration: Configuration,
        animateUpdates: Bool
    ) {



        // Tilt the axis according to a date. For this to be meaningful,
        // locate the sun along the positive x-axis. Animate this move for
        // changes that the user makes when the globe appears in the volume.
        var planeTransform = equatorialPlane.transform
        planeTransform.rotation = tilt(date: configuration.date)
        
        if animateUpdates {
            
            
            
            equatorialPlane.move(to: planeTransform, relativeTo: self, duration: 0.25)
        } else {
            equatorialPlane.move(to: planeTransform, relativeTo: self)
        }

        // Scale and position the entire entity.
        move(
            to: Transform(
                scale: SIMD3(repeating: configuration.scale),
                rotation: orientation,
                translation: configuration.position),
            relativeTo: parent)

    }

    
    
    //TODO: 아래 부분 응용해서 시간이 지남에 따라 변경되는 모습으로 가도록

    /// Calculates the orientation of the Earth's tilt on a specified date.
    ///
    /// This method assumes the sun appears at some distance from the Earth
    /// along the negative x-axis.
    ///
    /// - Parameter date: The date that the Earth's tilt represents.
    ///
    /// - Returns: A representation of tilt that you apply to an Earth model.
    private func tilt(date: Date?) -> simd_quatf {
        // Assume a constant magnitude for the Earth's tilt angle.
        let tiltAngle: Angle = .degrees(date == nil ? 0 : 23.5)

        // Find the day in the year corresponding to the date.
        let calendar = Calendar.autoupdatingCurrent
        let day = calendar.ordinality(of: .day, in: .year, for: date ?? Date()) ?? 1

        // Get an axis angle corresponding to the day of the year, assuming
        // the sun appears in the negative x direction.
        let axisAngle: Float = (Float(day) / 365.0) * 2.0 * .pi

        // Create an axis that points the northern hemisphere toward the
        // sun along the positive x-axis when axisAngle is zero.
        let tiltAxis: SIMD3<Float> = [
            sin(axisAngle),
            0,
            -cos(axisAngle)
        ]

        // Create and return a tilt orientation from the angle and axis.
        return simd_quatf(angle: Float(tiltAngle.radians), axis: tiltAxis)
    }
}


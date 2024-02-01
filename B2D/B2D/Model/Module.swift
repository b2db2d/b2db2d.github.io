
import Foundation


/// A description of the modules that the app can present.
enum Module: String, Identifiable, CaseIterable, Equatable {
    case monster, us
    var id: Self { self }
    var name: String { rawValue.capitalized }

    var eyebrow: String {
        switch self {
        case .monster:
            "See adorable creatures"
        case .us:
            "We're gonna killed it!"
        }
    }

    var heading: String {
        switch self {
        case .monster:
            "Start"
        case .us:
            "About us"
        }
    }

    var abstract: String {
        switch self {
        case .monster:
            "AR app for ADHD time management."
        case .us:
            "We are ADHD sufferers as well"
        }
    }

    var overview: String {
        switch self {
        case .monster:
            "Never miss a task again with the visual reminder that help you stay on track throughout the day. providing 3D cues like the birth and death cycle, this app can help you achieve 10x productivity. Say goodbye to distractions and hello to a more focused and efficient work style!"
 
        case .us:
            "How does the AR app help with time management? For additional assistance or inquiries, access our support resources, including comprehensive guides and contact information for our dedicated customer support team."
        }
    }

    var callToAction: String {
        switch self {
        case .monster: "View Your Creature"
        case .us: "shhh"
        }
    }

    static let emails = [
        "midmost44@gmail.com",
        "eunjae1426@gmail.com",
        "heyou32@gmail.com",
        "jonathan.laplante@gmail.com"
    ]
}

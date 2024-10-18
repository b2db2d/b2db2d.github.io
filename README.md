
# VisionOS Project

This project is an Xcode project designed to run on **VisionOS**, Apple's latest AR/VR platform. It focuses on efficiently rendering 3D objects and animations. Follow this guide to install, build, and run the project.

## System Requirements

- **macOS version**: macOS 13.0 Ventura or higher
- **Xcode version**: Xcode 15.0 or higher
- **VisionOS SDK version**: VisionOS SDK 1.0 or higher (Included with Xcode)
- **Reality Composer Pro version**: Reality Composer Pro 1.0 or higher (Included with Xcode)
- **Apple Silicon Mac (M1/M2)** or **Intel Mac** (Apple Silicon recommended for best performance)

## Installation

1. Clone the project from GitHub:

   ```bash
   git clone https://github.com/birth2death/visionOS.git
   ```

2. Navigate to the project directory:

   ```bash
   cd visionOS
   ```

3. Open the project in Xcode:

   ```bash
   open visionOS.xcodeproj
   ```

4. If there are any dependencies or libraries to install, do so at this step.

## Build and Run Instructions

1. Open the project in Xcode.

2. Check the `Info.plist` file to ensure the bundle identifier and other necessary settings are correct for your setup.

3. Set the **target device** to VisionOS in the Xcode toolbar.

4. Click the **Build** button to compile the project.

5. Run the project on a Vision Pro device or the VisionOS simulator.
   - You can select the simulator in the Xcode toolbar.

6. Use **Reality Composer Pro** to edit or add 3D scenes with `.reality` files if needed.

> If any issues arise during the build, refer to the **Troubleshooting** section below.

## Features and Usage

This project focuses on rendering 3D animations of a dragon object within a VisionOS environment. The project uses a `b2dData.json` file to manage objects. You can utilize the following features:

- Play the `Dragon_idle` animation.
- Handle various animations based on the object's state (e.g., death animation).

### Loading 3D Objects

- You can modify the `b2dData.json` file to update the list of animations for the dragon or other objects.
- Each object is rendered in the VisionOS environment using `RealityKit`.

## Contributing

Contributions are welcome! To contribute, follow these steps:

1. Fork this repository.
2. Develop new features or fix bugs.
3. Push your changes and create a pull request.

Before contributing, please check the issue page to avoid duplicate efforts.

## License

This project is licensed under the MIT License. For more details, see the LICENSE file.

## Troubleshooting

- **Build failures**: Ensure you have the correct VisionOS SDK set up in Xcode.
- **Simulator issues**: Check if the simulator is properly configured and make sure your macOS and Xcode are up to date.
- **3D Model not loading**: Verify that the paths in the `b2dData.json` file are correct and the USDZ files are referenced properly within the project.

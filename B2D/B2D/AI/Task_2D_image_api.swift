import Foundation
import SwiftUI

struct Task2DimageView: View {
    @State private var image: Image? = nil
    @State private var task: String = ""

    var body: some View {
        VStack {
            TextField("Enter your task", text: $task)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                executeTask()
            }) {
                Text("Generate Image")
            }

            if let image = image {
                image
            } else {
                Text("Loading...")
            }
        }.onAppear(perform: executeTask)
    }

    func executeTask() {
        // Define the URL
        guard let url = URL(string: "http://127.0.0.1:5000/generate_single_view") else {
            fatalError("Invalid URL")
        }

        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Define the JSON body
        let json: [String: Any] = ["task": task]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        // Attach JSON data to the request
        request.httpBody = jsonData

        // Create a task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                // Handle the data
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let base64String = json["image"] as? String,
                   let imageData = Data(base64Encoded: base64String),
                   let uiImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.image = Image(uiImage: uiImage)
                    }
                }
            }
        }

        // Start the task
        task.resume()
    }
}

#Preview {
    Task2DimageView()
}

import Foundation

func listPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(for: .seconds(2))
    return ["IMG001", "IMG99", "IMG0404"]
}

let photos = try await listPhotos(inGallery: "A Rainy Weekend")
print("Photos: \(photos)")

// let photos = await withTaskGroup(of: Data.self)

actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int

    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }

}

extension TemperatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}

extension TemperatureLogger {
    func convertFahrenheitToCelsius() {
        for i in measurements.indices {
            measurements[i] = (measurements[i] - 32) * 5 / 9
        }
    }
}

let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
print(await logger.max)


await logger.update(with: 30)
await logger.update(with: 35)
print(await logger.max)

await logger.convertFahrenheitToCelsius()
print(await logger.measurements)
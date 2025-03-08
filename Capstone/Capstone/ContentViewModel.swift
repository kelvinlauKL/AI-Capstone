import SwiftUI
import Observation
import Sentry

@Observable @MainActor final class ContentViewModel {
  func fetchData() async throws -> String {
    let urlString = "https://guacamole.api.v2/data"

    do {
      let request = URLRequest(url: URL(string: urlString)!)
      let (data, response) = try await URLSession.shared.data(for: request)

      return String(data: data, encoding: .utf8) ?? ""
    } catch {
      let event = Event(level: .warning)
      event.message = .init(formatted: "Fetching Data failed")
      event.extra = [
        "url": urlString,
        "status_code": Bool.random() ? "400" : "403"
      ]
    }

    return ""
  }

  func postData() async throws -> String {
    let urlString = "https://guacamole.api.v2/update"

    do {
      var request = URLRequest(url: URL(string: urlString)!)
      request.httpMethod = "POST"
      let (data, response) = try await URLSession.shared.data(for: request)

      return String(data: data, encoding: .utf8) ?? ""
    } catch {
      let event = Event(level: .warning)
      event.message = .init(formatted: "Fetching Data failed")
      event.extra = [
        "url": urlString,
        "status_code": 500,
        "message": "Internal server error"
      ]
    }
    return ""
  }
}

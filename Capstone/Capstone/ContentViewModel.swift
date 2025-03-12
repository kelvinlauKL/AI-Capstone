import SwiftUI
import Observation
import Sentry

@Observable @MainActor final class ContentViewModel {

  // Helper method to send an event multiple times.
  private func sendEvent(message: String, level: SentryLevel, count: Int = 1) {
    for _ in 0..<count {
      let event = Event(level: level)
      event.message = .init(formatted: message)
      SentrySDK.capture(event: event)
    }
  }

  // MARK: - 4XX Errors

  func trigger400Error(count: Int = 1) {
    sendEvent(message: "400 Bad Request: The request could not be understood by the server due to malformed syntax.", level: .error, count: count)
  }

  func trigger400Warning(count: Int = 1) {
    sendEvent(message: "400 Bad Request Warning: The request may be incorrect or missing information.", level: .warning, count: count)
  }

  func trigger401Error(count: Int = 1) {
    sendEvent(message: "401 Unauthorized: Authentication is required and has failed or has not yet been provided.", level: .error, count: count)
  }

  func trigger403Warning(count: Int = 1) {
    sendEvent(message: "403 Forbidden: You don't have permission to access this resource.", level: .warning, count: count)
  }

  func trigger404Error(count: Int = 1) {
    sendEvent(message: "404 Not Found: The requested resource could not be found on this server.", level: .error, count: count)
  }

  func trigger422Error(count: Int = 1) {
    sendEvent(message: "422 Unprocessable Entity: The request was well-formed but was unable to be followed due to semantic errors.", level: .error, count: count)
  }

  // MARK: - 5XX Errors

  func trigger500Error(count: Int = 1) {
    sendEvent(message: "500 Internal Server Error: An unexpected condition was encountered on the server.", level: .error, count: count)
  }

  func trigger502Error(count: Int = 1) {
    sendEvent(message: "502 Bad Gateway: The server received an invalid response from the upstream server.", level: .error, count: count)
  }

  func trigger503Error(count: Int = 1) {
    sendEvent(message: "503 Service Unavailable: The server is currently unavailable, likely due to maintenance or overload.", level: .error, count: count)
  }

  func trigger504Error(count: Int = 1) {
    sendEvent(message: "504 Gateway Timeout: The server did not receive a timely response from an upstream server.", level: .error, count: count)
  }
}

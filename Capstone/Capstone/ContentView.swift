import SwiftUI

struct ContentView: View {
  private(set) var vm: ContentViewModel = .init()

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .onAppear {
      Task {
        for i in 0..<100 {
          if i % 2 == 0 {
            _ = try await vm.postData()
          } else {
            _ = try await vm.fetchData()
          }
        }
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}

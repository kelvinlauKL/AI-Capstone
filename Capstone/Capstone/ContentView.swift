import SwiftUI

struct ContentView: View {
  private(set) var vm: ContentViewModel = .init()

  var body: some View {
    ScrollView {
      VStack(spacing: 24) {

        // 4XX Errors Section
        VStack(spacing: 12) {
          Text("4XX Errors")
            .font(.title2)
            .bold()
            .padding(.bottom, 4)

          Group {
            HStack {
              Button("400 Error (1)") { vm.trigger400Error() }
                .buttonStyle(.borderedProminent)
              Button("400 Error (50)") { vm.trigger400Error(count: 50) }
                .buttonStyle(.borderedProminent)
            }
            HStack {
              Button("400 Warning (1)") { vm.trigger400Warning() }
                .buttonStyle(.borderedProminent)
              Button("400 Warning (50)") { vm.trigger400Warning(count: 50) }
                .buttonStyle(.borderedProminent)
            }
            HStack {
              Button("401 Error (1)") { vm.trigger401Error() }
                .buttonStyle(.borderedProminent)
              Button("401 Error (50)") { vm.trigger401Error(count: 50) }
                .buttonStyle(.borderedProminent)
            }
            HStack {
              Button("403 Warning (1)") { vm.trigger403Warning() }
                .buttonStyle(.borderedProminent)
              Button("403 Warning (50)") { vm.trigger403Warning(count: 50) }
                .buttonStyle(.borderedProminent)
            }
            HStack {
              Button("404 Error (1)") { vm.trigger404Error() }
                .buttonStyle(.borderedProminent)
              Button("404 Error (50)") { vm.trigger404Error(count: 50) }
                .buttonStyle(.borderedProminent)
            }
            HStack {
              Button("422 Error (1)") { vm.trigger422Error() }
                .buttonStyle(.borderedProminent)
              Button("422 Error (50)") { vm.trigger422Error(count: 50) }
                .buttonStyle(.borderedProminent)
            }
          }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)

        // 5XX Errors Section
        VStack(spacing: 12) {
          Text("5XX Errors")
            .font(.title2)
            .bold()
            .padding(.bottom, 4)

          Group {
            HStack {
              Button("500 Error (1)") { vm.trigger500Error() }
                .buttonStyle(.borderedProminent)
              Button("500 Error (50)") { vm.trigger500Error(count: 50) }
                .buttonStyle(.borderedProminent)
            }
            HStack {
              Button("502 Error (1)") { vm.trigger502Error() }
                .buttonStyle(.borderedProminent)
              Button("502 Error (50)") { vm.trigger502Error(count: 50) }
                .buttonStyle(.borderedProminent)
            }
            HStack {
              Button("503 Error (1)") { vm.trigger503Error() }
                .buttonStyle(.borderedProminent)
              Button("503 Error (50)") { vm.trigger503Error(count: 50) }
                .buttonStyle(.borderedProminent)
            }
            HStack {
              Button("504 Error (1)") { vm.trigger504Error() }
                .buttonStyle(.borderedProminent)
              Button("504 Error (50)") { vm.trigger504Error(count: 50) }
                .buttonStyle(.borderedProminent)
            }
          }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
      }
      .padding()
    }
  }
}

#Preview {
  ContentView()
}

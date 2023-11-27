
import SwiftUI

struct FrameworkDetailedView: View {
    var framework: Framework
//    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    var body: some View {
        VStack {
//            XButton(isShowingDetailView: $isShowingDetailView)
//            Spacer()
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
               isShowingSafariView = true
            } label: {
//               AFButton(title: "Learn more")
                Label("Learn More", systemImage: "book.fill")
            } .padding()
                .buttonStyle(.bordered)
                .controlSize(.large)
                .buttonBorderShape(.capsule)
                .tint(.orange)
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "https://apple.com")!)
        })
    }
}

#Preview {
    FrameworkDetailedView(framework: MockData.sampleFramework/*, isShowingDetailView: .constant(false)*/) 
}

struct XButton : View {
    @Binding var isShowingDetailView: Bool
    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        } .padding()
    };
}

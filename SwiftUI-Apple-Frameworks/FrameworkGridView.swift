
import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        NavigationLink(value: framework) {
                            FrameworkTitleView(framework: framework)
                        }
//                            .onTapGesture {
//                                viewModel.selectedFramework = framework
//                            }
                    }
                }
                .navigationTitle("🍎 Frameworks")
                .navigationDestination(for: Framework.self) { framework in
                    FrameworkDetailedView(framework: framework)
                }
//                .sheet(isPresented: $viewModel.isShowingDetailView) {
//                    FrameworkDetailedView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
//                    }
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}

struct FrameworkTitleView : View {
    
    let framework : Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.label))
                .scaledToFit()
                .minimumScaleFactor(0.6)
        } 
        .padding()
    }
}

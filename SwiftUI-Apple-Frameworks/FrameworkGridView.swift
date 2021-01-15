//
//  FrameworkGridView.swift
//  SwiftUI-Apple-Frameworks
//
//  Created by Ермоленко Константин on 14.01.2021.
//

import SwiftUI

struct FrameworkGridView: View {
  
  @StateObject var viewModel = FrameworkGridViewModel()
  
  let columns: [GridItem] = [GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible())]
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: columns) {
          ForEach(MockData.frameworks) { framework in
            FrameworkTitleView(framework: framework)
              .onTapGesture {
                viewModel.selectedFramework = framework
              }
          }
        }
      }
      .navigationTitle("🍎 Frameworks")
      .sheet(isPresented: $viewModel.isShowingDetailView) {
        FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                            isShowingDetailView: $viewModel.isShowingDetailView)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    FrameworkGridView()
      .preferredColorScheme(.dark)
  }
}

struct FrameworkTitleView: View {
  
  let framework: Framework
  
  var body: some View {
    VStack {
      Image(framework.imageName)
        .resizable()
        .frame(width: 90, height: 90)
      Text(framework.name)
        .font(.title2)
        .fontWeight(.semibold)
        .scaledToFit()
        .minimumScaleFactor(0.6)
    }
    .padding()
  }
}

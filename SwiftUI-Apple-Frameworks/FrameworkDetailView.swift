//
//  FrameworkDetailView.swift
//  SwiftUI-Apple-Frameworks
//
//  Created by Ермоленко Константин on 14.01.2021.
//

import SwiftUI

struct FrameworkDetailView: View {
  
  let framework: Framework
  @Binding var isShowingDetailView: Bool
  @State var isShowingSafariView = false
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        
        Button {
          isShowingDetailView = false
        } label: {
          Image(systemName: "xmark")
            .foregroundColor(Color(.label))
            .imageScale(.large)
            .frame(width: 44, height: 44)
        }
      }
      .padding()
      
      Spacer()
      
      FrameworkTitleView(framework: framework)
      
      Text(framework.description)
        .font(.body)
        .padding()
      
      Spacer()
      
      Button {
        isShowingSafariView = true
      } label: {
        AFButton(title: "Learn More")
      }
    }
    .fullScreenCover(isPresented: $isShowingSafariView, content: {
      let url = URL(string: framework.urlString) ?? URL(string: "www.apple.com")!
      SafariView(url: url).edgesIgnoringSafeArea(.all)
    })
  }
}

struct FrameworkDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FrameworkDetailView(framework: MockData.sampleFramework,
                        isShowingDetailView: .constant(false))
      .preferredColorScheme(.dark)
  }
}

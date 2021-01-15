//
//  DismissButtonX.swift
//  SwiftUI-Apple-Frameworks
//
//  Created by Ермоленко Константин on 15.01.2021.
//

import SwiftUI

struct DismissButtonX: View {
  
  @Binding var isShowingModal: Bool
  
  var body: some View {
    HStack {
      Spacer()
      
      Button {
        isShowingModal = false
      } label: {
        Image(systemName: "xmark")
          .foregroundColor(Color(.label))
          .imageScale(.large)
          .frame(width: 44, height: 44)
      }
    }
    .padding()
    
  }
}

struct DismissButtonX_Previews: PreviewProvider {
  static var previews: some View {
    DismissButtonX(isShowingModal: .constant(false))
  }
}

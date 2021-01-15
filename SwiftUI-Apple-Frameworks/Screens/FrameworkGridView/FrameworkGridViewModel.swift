//
//  FrameworkGridViewModel.swift
//  SwiftUI-Apple-Frameworks
//
//  Created by Ермоленко Константин on 15.01.2021.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
  
  var selectedFramework: Framework? {
    didSet {
      isShowingDetailView = true
    }
  }
  
  @Published var isShowingDetailView = false
  
  let columns: [GridItem] = [GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible())]
}

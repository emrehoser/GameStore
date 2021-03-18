//
//  CustomPageControl.swift
//  Deneme
//
//  Created by Hamza IŞIKTAŞ on 16.03.2021.
//

import Foundation
import UIKit

public class CustomPageControl: UIControl {
  private lazy var stackView: UIStackView = UIStackView(frame: .zero)
  lazy var numberOfPages: Int = 0 {
    didSet {
        print("ert")
    }
  }
  lazy var currentPage: Int = .zero {
    didSet {
      print("ert")
    }
  }
    
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  @objc
  private func tapAction(_ sender: UIGestureRecognizer) {
    //TODO
  }
}
// MARK: - SetupUI
private extension CustomPageControl {
  func setupUI() {
    setupStackView()
    isMultipleTouchEnabled = false
    isExclusiveTouch = true
  }
 
  func setupStackView() {
    stackView.spacing = Constants.dotSpacing
    stackView.alignment = .center
    
    _ = stackView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    
  }
  func setupGesture() {
    let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
    gesture.numberOfTapsRequired = 1
    gesture.numberOfTouchesRequired = 1
    gesture.delaysTouchesEnded = false
    addGestureRecognizer(gesture)
  }
}
private struct Constants {
  static let dotSpacing: CGFloat = 16.0
  static let dotSize: CGSize = CGSize(width: 8.0, height: 8.0)
  static let bigDotSize: CGSize = CGSize(width: 24.0, height: 8.0)
  static let stackViewHeight: CGFloat = 15.0
}

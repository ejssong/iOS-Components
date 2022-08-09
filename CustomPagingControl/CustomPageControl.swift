//
//  CustomPageControl.swift
//  iosPageControl
//
//  Created by 인포렉스 on 2022/08/03.
//

import Foundation
import UIKit


class CustomPageControl : UIPageControl {

    override var currentPage: Int {
        didSet {
            if #available(iOS 14.0, *) {
                updatePageUI()
            } else {
                updateUI()
            }
            
        }
    }
    @available(iOS 14.0, *)
    func updatePageUI() {
    
        guard let dotContentView = findIndicatorContentView() else { return }
        
        for (index, view) in dotContentView.subviews.enumerated() {
            if view.isKind(of: UIImageView.self) {
                
                let indicatorView = view as! UIImageView
                indicatorView.image = nil
                if index == self.currentPage {
                    indicatorView.image = UIImage(color: .black , size: CGSize(width: 4, height: 2))?.withRenderingMode(.alwaysTemplate)
                } else {
                    indicatorView.image = UIImage(color: .gray , size : CGSize(width: 2, height: 2))?.withRenderingMode(.alwaysTemplate)
                }
                
                indicatorView.layer.cornerRadius = 3
                indicatorView.clipsToBounds = true
                self.sizeToFit()
            }
        }
    }
    
    func updateUI() {
        subviews.enumerated().forEach{ index , view in
            
            view.frame.size = (index == currentPage) ? CGSize(width: 8, height: 5) : CGSize(width: 5, height: 5)
            view.layer.cornerRadius = 2.5
        }
    }
    
//    @available(iOS 14.0, *)
    func findIndicatorContentView() -> UIView? {
        for contentView in self.subviews {
            if let contentViewClass = NSClassFromString("_UIPageControlContentView"), contentView.isKind(of: contentViewClass) {
                
                for indicatorContentView in contentView.subviews {
                    if let indicatorContentViewClass = NSClassFromString("_UIPageControlIndicatorContentView"), indicatorContentView.isKind(of: indicatorContentViewClass) {
                        return indicatorContentView
                    }
                }
            }
        }
        
        return nil
    }
}

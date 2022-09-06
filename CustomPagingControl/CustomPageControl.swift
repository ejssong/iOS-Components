//
//  CustomPageControl.swift
//  iosPageControl
//
//  Created by ejssong on 2022/08/03.
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
                    guard let image = UIImage(color: .black) else { return }
                    let img = image.resizeImage(image: image , width: 12, height: 6)
                    indicatorView.image = img
                } else {
                    guard let image = UIImage(color: .gray) else { return }
                    let img = image.resizeImage(image: image, width: 6, height: 6)
                    indicatorView.image = img
                }
                
                indicatorView.layer.cornerRadius = (indicatorView.image?.size.height ?? 6) / 2
                indicatorView.clipsToBounds = true
            }
        }
        dotContentView.sizeToFit()
    }
    
    func updateUI() {
        subviews.enumerated().forEach{ index , view in
            
            view.frame.size = (index == currentPage) ? CGSize(width: 8, height: 5) : CGSize(width: 5, height: 5)
            view.layer.cornerRadius = 2.5
        }
    }
    
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

extension UIImage {
    func resizeImage(image : UIImage, width: CGFloat, height : CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? image
    }
}

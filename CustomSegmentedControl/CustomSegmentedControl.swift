//
//  CustomSegmentedControl.swift
//  iosRadio
//
//  Created by ejssong on 2022/07/22.
//  Copyright © 2022 ejssong. All rights reserved.
//

import Foundation
import UIKit

/**
    UISegmentedControl 커스텀 컴포넌트 입니다.
    Radius , Font, Inset을 지정할 수 있습니다.
 */

class CSControl : UISegmentedControl {
    public var segmentInset: CGFloat = 5
    public var selectedTextColor : UIColor = .black
    public var normalTextColor : UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    public var fontStyle : UIFont = UIFont.systemFont(ofSize: 12)
    
    private let segmentImage: UIImage? = UIImage(color: UIColor.white)
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        setTitleTextAttributes([.foregroundColor : selectedTextColor, .font : fontStyle], for: UIControl.State.selected)
        setTitleTextAttributes([.foregroundColor : normalTextColor, .font : fontStyle], for: .normal)
    
        layer.cornerRadius = bounds.height/2
        
        let index = numberOfSegments
        
        //SegmentedControl 내부에 서브 뷰로 감싸고 있는 뷰 중 UIImageView에 접근해 이미지 변경
        if subviews.indices.contains(index), let imageView = subviews[index] as? UIImageView {
            imageView.bounds = imageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
    
            imageView.image = segmentImage
            
            imageView.layer.removeAnimation(forKey: "SelectionBounds")
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = imageView.bounds.height/2
        }
    }
}


/** UIImage에 색상 채우기 */
extension UIImage {
    
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}


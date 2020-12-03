//
//  UIFont.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 03.12.2020.
//

import UIKit

extension UIFont {

    public class func boldWithSize(size : CGFloat) -> UIFont? {
        return UIFont(name: "HelveticaNeue-Bold", size: size)
    }
    
    public class func regularWithSize(size : CGFloat) -> UIFont? {
        return UIFont(name: "HelveticaNeue-Light", size: size)
    }
    
}

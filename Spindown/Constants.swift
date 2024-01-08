//
//  Constants.swift
//  Spindown
//
//  Created by Joseph Smith on 8/22/19.
//  Copyright © 2019 Robotic Snail Software. All rights reserved.
//

import SwiftUI

//struct ScreenSize {
//    static let width        = UIScreen.main.bounds.size.width
//    static let height       = UIScreen.main.bounds.size.height
//    static let maxLength    = max(ScreenSize.width, ScreenSize.height)
//    static let minLength    = min(ScreenSize.width, ScreenSize.height)
//}
//struct DeviceTypes {
//    static let idiom                    = UIDevice.current.userInterfaceIdiom
//    static let nativeScale              = UIScreen.main.nativeScale
//    static let scale                    = UIScreen.main.scale
//    
//    static let isiPhoneSE               = idiom == .phone && ScreenSize.maxLength == 568.0
//    static let isiPhone8Standard        = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
//    static let isiPhone8Zoomed          = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
//    static let isiPhone8PlusStandard    = idiom == .phone && ScreenSize.maxLength == 736.0
//    static let isiPhone8PlusZoomed      = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
//    static let isiPhoneX                = idiom == .phone && ScreenSize.maxLength == 812.0
//    static let isiPhoneXr               = idiom == .phone && ScreenSize.maxLength == 828.0
//    static let isiPhoneXsMax            = idiom == .phone && ScreenSize.maxLength == 896.0
//    static let isiPad                   = idiom == .pad && ScreenSize.maxLength >= 1024.0
//    
//    static func isiPhoneXAspectRatio() -> Bool {
////        return isiPhoneX || isiPhoneXsMax || isiPhoneXr
//        return UIDevice.current.hasNotch && idiom == .phone
//    }
//    
//    //Note: If making an iPad specific app, will need to look up and add all the various iPad screen heights.
//}
//extension UIDevice {
//    var hasNotch: Bool {
//        let keyWindow = UIApplication
//            .shared
//            .connectedScenes
//            .compactMap { $0 as? UIWindowScene }
//            .flatMap { $0.windows }
//            .first { $0.isKeyWindow }
//        
//        guard let window = keyWindow else { return false }
//        if UIDevice.current.orientation.isPortrait {
//            return window.safeAreaInsets.top >= 44
//        } else {
//            return window.safeAreaInsets.left > 0 || window.safeAreaInsets.right > 0
//        }
//    }
//}
extension UIApplication {
    
    var keyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
}

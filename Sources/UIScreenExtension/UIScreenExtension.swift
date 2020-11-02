//
//  UIScreenExtension.swift
//  UIScreenExtension
//
//  Created by Jens Schwarzer on 02/10/2017.
//  Copyright © 2017 marchv. All rights reserved.
//

import UIKit

private extension UIDevice {

    // model identifiers can be found at https://www.theiphonewiki.com/wiki/Models
    static let modelIdentifier: String = {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] { return simulatorModelIdentifier }
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
    }()

}

private func computeIfSome<T: Any, S: Any>(optional: T?, computation: ((T) -> S)) -> S? { if let some = optional { return computation(some) } else { return .none } }

@available(iOS 9.0, *)
public extension UIScreen {

    /// The number of pixels per inch for this device
    static let pixelsPerInch: CGFloat? = {
        switch UIDevice.modelIdentifier {
        case "iPad2,1": fallthrough // 2nd Gen iPad
        case "iPad2,2": fallthrough // 2nd Gen iPad GSM
        case "iPad2,3": fallthrough // 2nd Gen iPad CDMA
        case "iPad2,4": // 2nd Gen iPad New Revision
            return 132

        case "iPad2,5": fallthrough // iPad mini
        case "iPad2,6": fallthrough // iPad mini GSM+LTE
        case "iPad2,7": // iPad mini CDMA+LTE
            return 163

        case "iPad3,1": fallthrough // 3rd Gen iPad
        case "iPad3,2": fallthrough // 3rd Gen iPad CDMA
        case "iPad3,3": fallthrough // 3rd Gen iPad GSM
        case "iPad3,4": fallthrough // 4th Gen iPad
        case "iPad3,5": fallthrough // 4th Gen iPad GSM+LTE
        case "iPad3,6": fallthrough // 4th Gen iPad CDMA+LTE
        case "iPad4,1": fallthrough // 1st Gen iPad Air (WiFi)
        case "iPad4,2": fallthrough // 1st Gen iPad Air (GSM+CDMA)
        case "iPad4,3": fallthrough // 1st Gen iPad Air (China)
        case "iPad5,3": fallthrough // iPad Air 2 (WiFi)
        case "iPad5,4": fallthrough // iPad Air 2
        case "iPad6,7": fallthrough // iPad Air 2 (Cellular)
        case "iPad6,8": fallthrough // iPad Pro (12.9 inch)
        case "iPad6,3": fallthrough // iPad Pro (9.7 inch, WiFi)
        case "iPad6,4": fallthrough // iPad Pro (9.7 inch)
        case "iPad6,11": fallthrough // iPad (2017)
        case "iPad6,12": fallthrough // iPad 5th generation
        case "iPad7,1": fallthrough // iPad Pro 2nd Gen (WiFi)
        case "iPad7,2": fallthrough // iPad Pro (12.9 inch, 2nd generation)
        case "iPad7,3": fallthrough // iPad Pro 10.5-inch
        case "iPad7,4": fallthrough // iPad Pro (10.5 inch)
        case "iPad7,5": fallthrough // iPad 6th Gen (WiFi)
        case "iPad7,6": fallthrough // iPad 6th generation
        case "iPad7,11": fallthrough // iPad 7th Gen 10.2-inch (WiFi)
        case "iPad7,12": fallthrough // iPad 7th Gen 10.2-inch (WiFi+Cellular)
        case "iPad8,1": fallthrough // iPad Pro 11 inch 3rd Gen (WiFi)
        case "iPad8,2": fallthrough // iPad Pro 11 inch 3rd Gen (1TB, WiFi)
        case "iPad8,3": fallthrough // iPad Pro 11 inch 3rd Gen (WiFi+Cellular)
        case "iPad8,4": fallthrough // iPad Pro (11 inch)
        case "iPad8,5": fallthrough // iPad Pro 12.9 inch 3rd Gen (WiFi)
        case "iPad8,6": fallthrough // iPad Pro 12.9 inch 3rd Gen (1TB, WiFi)
        case "iPad8,7": fallthrough // iPad Pro 12.9 inch 3rd Gen (WiFi+Cellular)
        case "iPad8,8": fallthrough // iPad Pro 12.9 inch 3rd Gen (1TB, WiFi+Cellular)
        case "iPad8,9": fallthrough // iPad Pro 11 inch 4th Gen (WiFi)
        case "iPad8,10": fallthrough // iPad Pro 11 inch 4th Gen (WiFi+Cellular)
        case "iPad8,11": fallthrough // iPad Pro 12.9 inch 4th Gen (WiFi)
        case "iPad8,12": fallthrough // iPad Pro (12.9 inch, 4th generation)
        case "iPad11,3": fallthrough // iPad Pro 12.9 inch 4th Gen (WiFi+Cellular)
        case "iPad11,4": fallthrough // iPad Air (3rd generation)
        case "iPad11,6": fallthrough // iPad 8th Gen (WiFi)
        case "iPad11,7": fallthrough // iPad 8th Gen (WiFi+Cellular)
        case "iPad13,1": fallthrough // iPad air 4th Gen (WiFi)
        case "iPad13,2": // iPad air 4th Gen (WiFi+Celular)
            return 264

        case "iPhone4,1": fallthrough // iPhone 4S
        case "iPhone5,1": fallthrough // iPhone 5 (GSM)
        case "iPhone5,2": fallthrough // iPhone 5 (GSM+CDMA)
        case "iPhone5,3": fallthrough // iPhone 5C (GSM)
        case "iPhone5,4": fallthrough // iPhone 5C (Global)
        case "iPhone6,1": fallthrough // iPhone 5S (GSM)
        case "iPhone6,2": fallthrough // iPhone 5S
        case "iPhone8,4": fallthrough // iPhone SE (GSM)
        case "iPhone7,2": fallthrough // iPhone 6
        case "iPhone8,1": fallthrough // iPhone 6S
        case "iPhone9,1": fallthrough // iPhone 7
        case "iPhone9,3": fallthrough // iPhone 7
        case "iPhone10,1": fallthrough // iPhone 8
        case "iPhone10,4": fallthrough // iPhone 8
        case "iPhone11,8": fallthrough // iPhone XR
        case "iPhone12,1": fallthrough // iPhone 11
        case "iPhone12,8": fallthrough // iPhone SE 2nd generation
        case "iPod5,1": fallthrough // iPod Touch 5th generation
        case "iPod7,1": fallthrough // iPod Touch 6th generation
        case "iPod9,1": fallthrough // iPod Touch 7th generation
        case "iPad4,4": fallthrough /// iPad mini Retina (WiFi)
        case "iPad4,5": fallthrough // iPad mini Retina (GSM+CDMA)
        case "iPad4,6": fallthrough // iPad Mini 2
        case "iPad4,7": fallthrough // iPad mini 3 (WiFi)
        case "iPad4,8": fallthrough // iPad mini 3 (GSM+CDMA)
        case "iPad4,9": fallthrough // iPad Mini 3
        case "iPad5,1": fallthrough // iPad mini 4 (WiFi)
        case "iPad5,2": fallthrough // iPad Mini 4
        case "iPad11,1": fallthrough // iPad mini 5th Gen (WiFi)
        case "iPad11,2": // iPad Mini 5
            return 326

        case "iPhone7,1": fallthrough // iPhone 6 Plus
        case "iPhone8,2": fallthrough // iPhone 6S Plus
        case "iPhone9,2": fallthrough // iPhone 7 Plus
        case "iPhone9,4": fallthrough // iPhone 7 Plus
        case "iPhone10,2": fallthrough // iPhone 8 Plus
        case "iPhone10,5": // iPhone 8 Plus
            return 401

        case "iPhone10,3": fallthrough // iPhone X (Global)
        case "iPhone10,6": fallthrough // iPhone X
        case "iPhone11,2": fallthrough // iPhone XS
        case "iPhone12,3": fallthrough // iPhone 11 Pro
        case "iPhone11,4": fallthrough // iPhone XS Max
        case "iPhone11,6": fallthrough // iPhone XS Max Global
        case "iPhone12,5": fallthrough // iPhone 11 Pro Max
        case "iPhone13,3": fallthrough // iPhone 12 Pro
        case "iPhone13,4": // iPhone 12 Pro Max
            return 458

        case "iPhone13,2": fallthrough // iPhone 12
        case "iPhone13,5": // iPhone 11 Pro Max
            return 460

        case "iPhone13,1": // iPhone 12 Mini
            return 479

        default: // unknown model identifier
            return .none
        }
    }()

    /// The number of pixels per centimeter for this device
    static let pixelsPerCentimeter: CGFloat? = computeIfSome(optional: pixelsPerInch, computation: { $0 / 2.54 })

    /// The number of points per inch for this device
    static let pointsPerInch: CGFloat? = computeIfSome(optional: pixelsPerInch, computation: { $0 / main.nativeScale })

    /// The number of points per centimeter for this device
    static let pointsPerCentimeter: CGFloat? = computeIfSome(optional: pixelsPerCentimeter, computation: { $0 / main.nativeScale })

    /// The screen dimension in inches
    static let dimensionInInches: CGSize? = computeIfSome(optional: pixelsPerInch, computation: { CGSize(width: main.nativeBounds.width / $0, height: main.nativeBounds.height / $0) })

    /// The screen dimension in centimeters
    static let dimensionInCentimeters: CGSize? = computeIfSome(optional: pixelsPerCentimeter, computation: { CGSize(width: main.nativeBounds.width / $0, height: main.nativeBounds.height / $0) })

}

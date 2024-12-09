//
//  AppFont.swift
//  Ekyamm
//
//  Created by Ravi Seta on 05/12/2024.
//
import UIKit

public struct AppFont {
    
    public static let semibold_14 = UIFont.quicksand(ofSize: 15, weight: .semibold)
    public static let regular_12 = UIFont.quicksand(ofSize: 13, weight: .regular)
    public static let regular_16 = UIFont.quicksand(ofSize: 17, weight: .regular)
    public static let semibold_13 = UIFont.quicksand(ofSize: 14, weight: .semibold)
    public static let medium_12 = UIFont.quicksand(ofSize: 13, weight: .medium)
    public static let semibold_16 = UIFont.quicksand(ofSize: 17, weight: .semibold)
    public static let semibold_12 = UIFont.quicksand(ofSize: 13, weight: .semibold)
    public static let medium_11 = UIFont.quicksand(ofSize: 12, weight: .medium)
    public static let medium_14 = UIFont.quicksand(ofSize: 15, weight: .medium)
    public static let medium_10 = UIFont.quicksand(ofSize: 10, weight: .medium)

}

public extension UIFont {
    
    enum QuicksandFontType {
        case regular
        case medium
        case bold
        case semibold
        case light
    }
    
    static func quicksand(
        ofSize size: CGFloat,
        weight: QuicksandFontType
    ) -> UIFont {
        switch weight {
        case .regular:
            return UIFont.appFont(.quicksandRegular, size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
        case .medium:
            return UIFont.appFont(.quicksandMedium, size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
        case .bold:
            return UIFont.appFont(.quicksandBold, size: size)  ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .semibold:
            return UIFont.appFont(.quicksandSemiBold, size: size)  ?? UIFont.systemFont(ofSize: size, weight: .semibold)
        case .light:
            return UIFont.appFont(.quicksandLight, size: size)  ?? UIFont.systemFont(ofSize: size, weight: .semibold)

        }
    }
}

public enum AppFontNames: String, CaseIterable {
    // Use name according to font file name in bundle.
    case quicksandRegular = "Quicksand-Regular"
    case quicksandMedium = "Quicksand-Medium"
    case quicksandBold = "Quicksand-Bold"
    case quicksandSemiBold = "Quicksand-SemiBold"
    case quicksandLight = "Quicksand-Light"

    var fontExtension: String {
        switch self {
        case .quicksandRegular, .quicksandMedium, .quicksandBold, .quicksandSemiBold,.quicksandLight:
            return "ttf"
        }
    }
}

extension AppFontNames {
    var fileName: String {
        return rawValue
    }
    
    var fontName: String {
        switch self {
        case .quicksandRegular, .quicksandMedium, .quicksandBold, .quicksandSemiBold,.quicksandLight:
            return rawValue
        }
    }
}

public extension UIFont {
    
    static func appFont(_ type: AppFontNames, size: CGFloat) -> UIFont? {
        return UIFont(name: type.fontName, size: size)
    }
}

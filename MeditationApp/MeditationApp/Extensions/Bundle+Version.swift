//
//  Bundle+Version.swift
//  MeditationApp
//
//  Created by Edanur Yildirim, Vodafone on 24.11.2024.
//
import Foundation

private enum Keys {
    static let shortVersion = "CFBundleShortVersionString"
    static let version = "CFBundleVersion"
    static let executable = "CFBundleExecutable"
}

private enum Const {
    static let unknown = "Unknown"
}

extension Bundle {
    /// Value of the app short version in the receiver's property list (Info.plist). The localized value of a key is returned when one is available.
    public var appShortVersion: String {
        return object(forInfoDictionaryKey: Keys.shortVersion) as? String ?? Const.unknown
    }

    /// Value of the app version in the receiver's property list (Info.plist). The localized value of a key is returned when one is available.
    public var appVersion: String {
        return object(forInfoDictionaryKey: Keys.version) as? String ?? Const.unknown
    }

    /// Value of the application name in the receiver's property list (Info.plist). The localized value of a key is returned when one is available.
    public var applicationName: String {
        return object(forInfoDictionaryKey: Keys.executable) as? String ?? Const.unknown
    }
}

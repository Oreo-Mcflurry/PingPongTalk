//
//  KeychainManager.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/3/24.
//

import Foundation
import KeychainSwift

final class KeychainManager {
	static let keychain = KeychainSwift()
	private init() { }

	enum KeychainKeys: String {
		case accessToken
		case refreshToken
	}

	static func save(_ value: String, with key: KeychainKeys) {
		keychain.set(value, forKey: key.rawValue)
	}

	static func getData(with key: KeychainKeys) -> String {
		return keychain.get(key.rawValue) ?? ""
	}
}

//
//  KeychainManager.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/3/24.
//

import Foundation
import KeychainSwift

final class KeychainManager {
	private let keychain: KeychainSwift

	init() {
		self.keychain = KeychainSwift()
	}

	enum KeychainKeys: String {
		case accessToken
		case refreshToken
	}

	func save(_ value: String, with key: KeychainKeys) {
		keychain.set(value, forKey: key.rawValue)
	}

	func getData(with key: KeychainKeys) -> String? {
		return keychain.get(key.rawValue)
	}
}

//
//  AppleLoginRequestModel.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation

struct AppleLoginRequestModel: Encodable {
	let idToken: String
	let nickname: String
	let deviceToken: String
}

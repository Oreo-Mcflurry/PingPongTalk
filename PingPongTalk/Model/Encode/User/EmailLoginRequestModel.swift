//
//  EmailLoginRequestModel.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation

struct EmailLoginRequestModel: Encodable {
	let email: String
	let password: String
	let deviceToken: String
}

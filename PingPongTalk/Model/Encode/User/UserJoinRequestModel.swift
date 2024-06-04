//
//  UserJoinRequestModel.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation

struct UserJoinRequestModel: Encodable {
	let email: String
	let password: String
	let phone: String
	let deviceToken: String
}

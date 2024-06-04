//
//  UserJoinDTOModel.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation

struct UserJoinDTOModel: DTOModel {
	let userID: String
	let email: String
	let nickName: String
	let profileImage: String
	let phone: String
	let provider: String
	let createdAt: Date
	let accessToken: String
	let refreshToken: String
}

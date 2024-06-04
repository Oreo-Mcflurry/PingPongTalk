//
//  UserJoinReusultModel.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation

struct UserJoinReusultModel: DTODecodable {

	let user_id: String
	let email: String
	let nickname: String
	let profileImage: String
	let phone: String
	let provider: String
	let createdAt: String
	let token: Token

	func asDTOModel() -> UserJoinDTOModel {
		let date = DateFormatter.defaultFormatter.date(from: createdAt) ?? Date()
		return UserJoinDTOModel(
			userID: user_id,
			email: email,
			nickName: nickname,
			profileImage: profileImage,
			phone: phone,
			provider: provider,
			createdAt: date,
			accessToken: token.accessToken,
			refreshToken: token.refreshToken
		)
	}
}

struct Token: Decodable {
	let accessToken: String
	let refreshToken: String
}

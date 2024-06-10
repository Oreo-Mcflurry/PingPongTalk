//
//  ProfileResultModel.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/5/24.
//

import Foundation

struct ProfileResultModel: DTODecodable {
	let user_id: String
	let email: String
	let nickname: String
	let profileImage: String

	func asDTOModel() -> ProfileDTOModel {
		return ProfileDTOModel(
			userID: user_id,
			email: email,
			nickName: nickname,
			profileImage: profileImage
		)
	}
}

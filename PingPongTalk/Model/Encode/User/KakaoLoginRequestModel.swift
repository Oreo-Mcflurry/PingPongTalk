//
//  KakaoLoginRequestModel.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation

struct KakaoLoginRequestModel: Encodable {
	let oauthToken: String
	let deviceToken: String
}

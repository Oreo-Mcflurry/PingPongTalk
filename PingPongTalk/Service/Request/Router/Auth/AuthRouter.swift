//
//  AuthRouter.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/3/24.
//

import Foundation
import Moya

enum AuthRouter {
	case refreshAccessToken
}

extension AuthRouter: TargetType {
	var baseURL: URL {
		return URL(string: APIKey.baseURL.rawValue)!
	}

	var path: String {
		return "v1/auth/refresh"
	}

	var method: Moya.Method {
		return .get
	}

	var task: Moya.Task {
		return .requestPlain
	}

	var headers: [String : String]? {
		return [
			HTTPHeaders.accept.rawValue: HTTPHeaders.json.rawValue,
			HTTPHeaders.key.rawValue: APIKey.key.rawValue,
			HTTPHeaders.refresh.rawValue: KeychainManager.getData(with: .refreshToken),
			HTTPHeaders.auth.rawValue: KeychainManager.getData(with: .accessToken)
		]
	}
}

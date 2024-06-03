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

//extension AuthRouter: TargetType {
//	var baseURL: URL {
//		return URL(string: APIKey.baseURL.rawValue)!
//	}
//
//	var path: String {
//		return "v1/auth/refresh"
//	}
//
//	var method: Moya.Method {
//		return .get
//	}
//
//	var task: Moya.Task {
//		return .
//	}
//
//	var headers: [String : String]?
//}

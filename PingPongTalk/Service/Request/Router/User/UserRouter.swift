//
//  UserRouter.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation
import Moya

enum UserRouter {
	case join(query: UserJoinRequestModel)
	case validationEmail
	case login
	case kakaoLogin
	case appleLogin
	case logout
	case deviceToken
	case getMyProfile
	case putMyProfile
	case putMyImage
	case getUserProfile(userID: String)
}

extension UserRouter: TargetType {
	var baseURL: URL {
		return URL(string: APIKey.baseURL.rawValue)!
	}
	
	var path: String {
		switch self {
		case .join:
			return "v1/users/join"
		case .validationEmail:
			return "v1/users/validation/email"
		case .login:
			return "v1/users/login"
		case .kakaoLogin:
			return "v1/users/login/kakao"
		case .appleLogin:
			return "v1/users/login/apple"
		case .logout:
			return "v1/users/logout"
		case .deviceToken:
			return "v1/users/deviceToken"
		case .getMyProfile:
			return "v1/users/me"
		case .putMyProfile:
			return "v1/users/me"
		case .putMyImage:
			return "v1/users/me/image"
		case .getUserProfile(let userID):
			return "v1/users/\(userID)"
		}
	}
	
	var method: Moya.Method {
		switch self {
		case .join:
			return .post
		case .validationEmail:
			return .post
		case .login:
			return .post
		case .kakaoLogin:
			return .post
		case .appleLogin:
			return .post
		case .logout:
			return .get
		case .deviceToken:
			return .post
		case .getMyProfile:
			return .get
		case .putMyProfile:
			return .put
		case .putMyImage:
			return .put
		case .getUserProfile:
			return .get
		}
	}
	
	var task: Moya.Task {
		switch self {
		case .join(let query):
			return .requestJSONEncodable(query)
		case .validationEmail:
			<#code#>
		case .login:
			<#code#>
		case .kakaoLogin:
			<#code#>
		case .appleLogin:
			<#code#>
		case .logout:
			return .requestPlain
		case .deviceToken:
			<#code#>
		case .getMyProfile:
			return .requestPlain
		case .putMyProfile:
			<#code#>
		case .putMyImage:
			<#code#>
		case .getUserProfile:
			return .requestPlain
		}
	}
	
	var headers: [String : String]? {
		<#code#>
	}
	

}

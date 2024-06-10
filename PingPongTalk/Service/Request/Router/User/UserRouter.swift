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
	case validationEmail(query: EmailValidationRequestModel)
	case login(query: EmailLoginRequestModel)
	case kakaoLogin(query: KakaoLoginRequestModel)
	case appleLogin(query: AppleLoginRequestModel)
	case logout
	case deviceToken(query: DeviceTokenRequestModel)
	case getMyProfile
	case editMyProfile(query: EditProfileRequestModel)
	case editMyImage(query: Data)
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
		case .editMyProfile:
			return "v1/users/me"
		case .editMyImage:
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
		case .editMyProfile:
			return .put
		case .editMyImage:
			return .put
		case .getUserProfile:
			return .get
		}
	}
	
	var task: Moya.Task {
		switch self {
		case .join(let query):
			return .requestJSONEncodable(query)
		case .validationEmail(let query):
			return .requestJSONEncodable(query)
		case .login(let query):
			return .requestJSONEncodable(query)
		case .kakaoLogin(let query):
			return .requestJSONEncodable(query)
		case .appleLogin(let query):
			return .requestJSONEncodable(query)
		case .logout:
			return .requestPlain
		case .deviceToken(let query):
			return .requestJSONEncodable(query)
		case .getMyProfile:
			return .requestPlain
		case .editMyProfile(let query):
			return .requestJSONEncodable(query)
		case .editMyImage(let query):
			let profileImage = MultipartFormData(provider: .data(query), name: "Profile")
			return .uploadMultipart([profileImage])
		case .getUserProfile:
			return .requestPlain
		}
	}
	
	var headers: [String : String]? {
		switch self {
		case .join, .kakaoLogin, .appleLogin:
			return [
				HTTPHeaders.accept.rawValue: HTTPHeaders.json.rawValue,
				HTTPHeaders.key.rawValue: APIKey.key.rawValue,
				HTTPHeaders.contentType.rawValue: HTTPHeaders.json.rawValue
			]
		case .validationEmail:
			return [
				HTTPHeaders.accept.rawValue: HTTPHeaders.star.rawValue,
				HTTPHeaders.key.rawValue: APIKey.key.rawValue,
				HTTPHeaders.contentType.rawValue: HTTPHeaders.json.rawValue
			]
		case .login:
			return [
				HTTPHeaders.accept.rawValue: HTTPHeaders.star.rawValue,
				HTTPHeaders.contentType.rawValue: HTTPHeaders.json.rawValue
			]
		case .logout:
			return [
				HTTPHeaders.accept.rawValue: HTTPHeaders.star.rawValue,
				HTTPHeaders.key.rawValue: APIKey.key.rawValue,
				HTTPHeaders.auth.rawValue: KeychainManager.getData(with: .accessToken)
			]
		case .deviceToken:
			return [
				HTTPHeaders.accept.rawValue: HTTPHeaders.star.rawValue,
				HTTPHeaders.key.rawValue: APIKey.key.rawValue,
				HTTPHeaders.auth.rawValue: KeychainManager.getData(with: .accessToken),
				HTTPHeaders.contentType.rawValue: HTTPHeaders.json.rawValue
			]
		case .getMyProfile:
			return [
				HTTPHeaders.accept.rawValue: HTTPHeaders.json.rawValue,
				HTTPHeaders.key.rawValue: APIKey.key.rawValue,
				HTTPHeaders.auth.rawValue: KeychainManager.getData(with: .accessToken)
			]
		case .editMyProfile:
			return [
				HTTPHeaders.accept.rawValue: HTTPHeaders.json.rawValue,
				HTTPHeaders.key.rawValue: APIKey.key.rawValue,
				HTTPHeaders.auth.rawValue: KeychainManager.getData(with: .accessToken),
				HTTPHeaders.contentType.rawValue: HTTPHeaders.json.rawValue
			]
		case .editMyImage:
			return [
				HTTPHeaders.accept.rawValue: HTTPHeaders.json.rawValue,
				HTTPHeaders.key.rawValue: APIKey.key.rawValue,
				HTTPHeaders.auth.rawValue: KeychainManager.getData(with: .accessToken),
				HTTPHeaders.contentType.rawValue: HTTPHeaders.multipart.rawValue
			]
		case .getUserProfile:
			return [
				HTTPHeaders.accept.rawValue: HTTPHeaders.json.rawValue,
				HTTPHeaders.key.rawValue: APIKey.key.rawValue,
				HTTPHeaders.auth.rawValue: KeychainManager.getData(with: .accessToken)
			]
		}
	}
}

//
//  UserRepository.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation
import RxSwift
import Moya
import RxMoya

protocol UserRepository {
	func join(query: UserJoinRequestModel) -> Single<Bool>
	func validationEmail(query: EmailValidationRequestModel) -> Single<EmailValidationDTOModel>
	func login(query: EmailLoginRequestModel) -> Single<UserDTOModel>
	func kakaoLogin(query: KakaoLoginRequestModel) -> Single<UserDTOModel>
	func appleLogin(query: AppleLoginRequestModel) -> Single<UserDTOModel>
	func logout() -> Single<Bool>
	func deviceToken() -> Single<Void>
	func getMyProfile() -> Single<ProfileDTOModel>

}

//case join(query: UserJoinRequestModel)
//case validationEmail(query: EmailValidationRequestModel)
//case login(query: EmailLoginRequestModel)
//case kakaoLogin(query: KakaoLoginRequestModel)
//case appleLogin(query: AppleLoginRequestModel)
//case logout
//case deviceToken(query: DeviceTokenRequestModel)
//case getMyProfile
//case editMyProfile(query: EditProfileRequestModel)
//case editMyImage(query: Data)
//case getUserProfile(userID: String)

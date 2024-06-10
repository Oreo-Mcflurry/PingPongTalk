//
//  UserRepositoryImpl.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation
import RxSwift
import Moya
import RxMoya

final class UserRepositoryImpl: UserRepository {
	private var provider: MoyaProvider<UserRouter>
	private let disposeBag: DisposeBag

	init() {
		self.provider = MoyaProvider<UserRouter>()
		self.disposeBag = DisposeBag()
	}

	func requestHandler<T: DTODecodable>(request: Single<Response>, decodable: T.Type, single: (Result<DTOModel, any Error>) -> Void) {
		request
			.filterSuccessfulStatusCodes()
			.map(decodable.self)
			.subscribe(with: self) { _, result in
				single(.success(result.asDTOModel() as DTOModel))
			} onFailure: { _, error in
				single(.failure(error))
			}.disposed(by: self.disposeBag)
	}


	func join(query: UserJoinRequestModel) -> Single<Bool> {
		Single<Bool>.create { [weak self] single in
			guard let self else { return Disposables.create() }
			self.provider.rx.request(.join(query: query))
				.filterSuccessfulStatusCodes()
				.subscribe(with: self) { _, result in
					single(.success(true))
				} onFailure: { _, error in
					single(.failure(error))
				}.disposed(by: self.disposeBag)
			return Disposables.create()
		}
	}
	
	func validationEmail(query: EmailValidationRequestModel) -> Single<EmailValidationDTOModel> {
		Single<EmailValidationDTOModel>.create { [weak self] single in
			guard let self else { return Disposables.create() }
			self.requestHandler(
				request: self.provider.rx.request(.validationEmail(query: query)),
				decodable: EmailValidationResultModel.self,
				single: single
			)

			return Disposables.create()
		}
	}
	
	func login(query: EmailLoginRequestModel) -> Single<UserDTOModel> {
		<#code#>
	}
	
	func kakaoLogin(query: KakaoLoginRequestModel) -> Single<UserDTOModel> {
		<#code#>
	}
	
	func appleLogin(query: AppleLoginRequestModel) -> Single<UserDTOModel> {
		<#code#>
	}
	
	func logout() -> Single<Bool> {
		<#code#>
	}
	
	func deviceToken() -> Single<Void> {
		<#code#>
	}
	
	func getMyProfile() -> Single<ProfileDTOModel> {
		<#code#>
	}

}

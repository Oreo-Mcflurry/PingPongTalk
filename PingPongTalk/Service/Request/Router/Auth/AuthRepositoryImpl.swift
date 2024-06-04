//
//  AuthRepositoryImpl.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation
import RxSwift
import Moya
import RxMoya

final class AuthRepositoryImpl: AuthRepository {
	private var provider: MoyaProvider<AuthRouter>
	private let disposeBag: DisposeBag

	init() {
		self.provider = MoyaProvider<AuthRouter>()
		self.disposeBag = DisposeBag()
	}

	func refreshAccessToken() -> Single<Bool> {
		Single<Bool>.create { [weak self] single in
			guard let self else {
				single(.success(false))
				return Disposables.create()
			}

			self.provider.rx.request(.refreshAccessToken)
				.filterSuccessfulStatusCodes()
				.map(RefreshAccessTokenResultModel.self)
				.subscribe(with: self) { _, result in
					single(.success(true))
				} onFailure: { _, _ in
					single(.success(false))
				}.disposed(by: self.disposeBag)

			return Disposables.create()
		}
	}
}

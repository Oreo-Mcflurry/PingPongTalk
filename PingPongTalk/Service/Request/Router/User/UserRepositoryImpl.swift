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
}

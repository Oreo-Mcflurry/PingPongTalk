//
//  AuthRepository.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation
import RxSwift

protocol AuthRepository {
	func refreshAccessToken() -> Single<Bool>
}

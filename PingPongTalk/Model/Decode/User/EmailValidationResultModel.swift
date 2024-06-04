//
//  EmailValidationResultModel.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation

struct EmailValidationResultModel: DTODecodable {
	let errorCode: String?

	func asDTOModel() -> EmailValidationDTOModel {
		let validation: Bool
		let message: String

		if errorCode == "E12" {
			validation = false
			message = "이미 가입된 이메일 입니다."
		} else if errorCode == "E11" {
			validation = false
			message = "잘못된 요청입니다."
		} else {
			validation = true
			message = "사용 가능한 이메일 입니다."
		}

		return EmailValidationDTOModel(
			toastMessage: message,
			isValidation: validation
		)
	}
}

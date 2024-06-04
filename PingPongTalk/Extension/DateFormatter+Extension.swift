//
//  DateFormatter+Extension.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/4/24.
//

import Foundation

extension DateFormatter {
	static let defaultFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy년MM월dd일"
		return formatter
	}()
}

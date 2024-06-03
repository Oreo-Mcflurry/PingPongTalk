//
//  DTODecodable.swift
//  PingPongTalk
//
//  Created by A_Mcflurry on 6/3/24.
//

import Foundation

protocol DTODecodable: Decodable {
	associatedtype M: DTOModel
	func asDTOModel() -> M
}

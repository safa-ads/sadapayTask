//
//  CustomDecoder.swift
//  SadaPayTask
//
//  Created by Safa Ads on 15/06/2023.
//

import Foundation

public class CustomDecoder {
    public static func decoder<T: Codable>(data: Data) throws -> T  {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let value =  try jsonDecoder.decode(T.self, from: data)
        return value
    }
}

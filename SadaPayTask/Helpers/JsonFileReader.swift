//
//  JsonFileReader.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 19/06/2023.
//
import Foundation

enum JsonFileReader {
    static func readLocalJSONFile(fileName: String) -> Any? {
        do {
            if let filePath = Bundle.main.path(forResource: fileName,
                                               ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                return json
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}

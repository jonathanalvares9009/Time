//
//  EntriesStore.swift
//  Time
//
//  Created by JONATHAN ALVARES on 08/10/22.
//

import Foundation
import SwiftUI

class EntriesStore: ObservableObject {
    @Published var entries: [Entry] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        .appendingPathComponent("entries.data")
    }
    
    static func load(completion: @escaping (Result<[Entry], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                print(fileURL)
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let entriesData = try JSONDecoder().decode([Entry].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(entriesData))
                }
            } catch {
                DispatchQueue.main.async {
                        completion(.failure(error))
                    }
            }
        }
    }
    
    static func save(entries: [Entry], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(entries)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(entries.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}

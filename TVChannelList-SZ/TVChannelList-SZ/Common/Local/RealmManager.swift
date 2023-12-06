//
//  RealmManager.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 05.12.23.
//

import Foundation
import RealmSwift

class RealmManager {

    static let shared = RealmManager()

    private let realm: Realm?

    init() {
        self.realm = try? Realm()
    }

    func insert<T: Object>(_ object: T) {
        do {
            try realm?.write {
                realm?.add(object)
            }
        } catch let error {
            print("Error: \(error.localizedDescription) - on Insert Object: \(object)")
        }
    }

    func read<T: Object>(_ type: T.Type) -> [T] {
        guard let realm else { return [] }
        let result = realm.objects(T.self)
        return result.compactMap({ $0 })
    }

    func read<T: Object>(_ type: T.Type, byId: ObjectId) -> T? {
        guard let realm else { return nil }
        let result = realm.object(ofType: T.self, forPrimaryKey: byId)
        return result
    }
}

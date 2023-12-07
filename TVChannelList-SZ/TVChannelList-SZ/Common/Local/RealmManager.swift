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
    private let realmQueue = DispatchQueue(label: "realm.queue")

    func insert<T: Object>(_ object: T, finished: @escaping (Bool) -> Void) {
        realmQueue.async {
            autoreleasepool {
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.add(object)
                    }
                    finished(true)
                } catch let error {
                    print("Error: \(error.localizedDescription) - on Insert Object: \(object)")
                }
            }
        }
    }

    func read<T: Object>(_ type: T.Type, onCompletion: @escaping ([T]) -> Void) {
        realmQueue.async {
            autoreleasepool {
                do {
                    let realm = try Realm()
                    let result = realm.objects(T.self)
                    onCompletion(result.compactMap({ $0 }))
                } catch let error {
                    print("Read Error: \(error.localizedDescription) - on ObjectTypes: \(type)")
                }
            }
        }
    }

    func read<T: Object>(_ type: T.Type, byId: ObjectId, onCompletion: @escaping (T?) -> Void) {
        realmQueue.async {
            autoreleasepool {
                do {
                    let realm = try Realm()
                    let result = realm.object(ofType: T.self, forPrimaryKey: byId)
                    onCompletion(result)
                } catch let error {
                    print("Read byID (\(byId)) Error: \(error.localizedDescription) - on ObjectTypes: \(type)")
                }
            }
        }
    }
}

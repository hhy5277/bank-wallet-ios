import Foundation
import RealmSwift

public class Block: Object {
    @objc public dynamic var reversedHeaderHashHex = ""
    @objc public dynamic var height: Int = 0
    @objc public dynamic var archived = false

    override public class func primaryKey() -> String? {
        return "reversedHeaderHashHex"
    }
}
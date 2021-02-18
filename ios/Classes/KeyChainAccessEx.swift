import Foundation
import KeychainAccess

private var _service:String {
    return bundleId
}
public extension Keychain {
    
    static func setKeyChain(key:String,value:String) {
        let keychain = Keychain(service: _service)
        do {
            try keychain.set(value, key: key)
        } catch let error {
            print(error)
        }
    }
    
    static func setKeyChain(key:String,data:Data) {
        let keychain = Keychain(service: _service)
        do {
            try keychain.set(data, key: key)
        } catch let error {
            print(error)
        }
    }
    
    static func getKeyChainString(key:String) -> String? {
        let keychain = Keychain(service: _service)
        let value = (try? keychain.getString(key)) ?? nil
    
        return value
    }
    
    static func getKeyChainData(key:String) -> Data? {
        let keychain = Keychain(service: _service)
        let value = (try? keychain.getData(key)) ?? nil
        return value
    }
    
    
}


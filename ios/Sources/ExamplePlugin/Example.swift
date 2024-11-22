import Alamofire
import Foundation
import MFA

@objc public class Example: NSObject {
  @objc public func echo(_ value: String) -> String {
    print(value)
    return value
  }

  @objc func fetchData(_ call: CAPPluginCall) {
    AF.request("https://example.com").response { response in
      if let data = response.data {
        call.resolve([
          "data": String(data: data, encoding: .utf8) ?? ""
        ])
      } else {
        call.reject("Failed to fetch data")
      }
    }
  }
}


import Foundation

typealias CompletionHandler = (_ Success: Bool,_ Error: String) -> ()
let BASE_URL = "http://81.2.242.42:8080"
let URL_COMPANIES = "\(BASE_URL)/api/categories"
let HEADER = ["Content-Type": "application/json; charset=utf-8"]

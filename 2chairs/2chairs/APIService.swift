
import Foundation
import Alamofire
import SwiftyJSON

class APIService {
    
    static let instance = APIService()
    var companies = [String]()
    
    func getCompanies(completion: @escaping CompletionHandler){
        Alamofire.request(URL_COMPANIES, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            let json = JSON(data: response.data!)
            if (statusCode == 200){
               log.debug(response)
            }
            else {
                log.debug(statusCode)
            }
        }
    }
}

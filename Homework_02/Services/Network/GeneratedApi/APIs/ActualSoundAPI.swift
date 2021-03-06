//
// ActualSoundAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire

open class ActualSoundApi : SoundApi {
    /**
     Details of a sound
     
     - parameter soundId: (path) ID of the sound that needs to be fetched 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open func getSoundById(soundId: Int64, completion: @escaping ((_ data: Sound?,_ error: Error?) -> Void)) {
        getSoundByIdWithRequestBuilder(soundId: soundId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

}

extension ActualSoundApi {
    
    open func getSoundByIdWithRequestBuilder(soundId: Int64) -> RequestBuilder<Sound> {
        var path = "/sounds/{soundId}"
        let soundIdPreEscape = "\(soundId)"
        let soundIdPostEscape = soundIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{soundId}", with: soundIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = ["token": "f90ZvCwTwPxBOewsaE6fw9BZRALYpw5986bAXOn0"]
        let url = URLComponents(string: URLString)
        let requestBuilder: RequestBuilder<Sound>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()
        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
}

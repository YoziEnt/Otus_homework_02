//
// ActualSearchAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire

open class ActualSearchApi : SearchApi {

    open func searchText(filter: String? = nil, page: Int? = nil, completion: @escaping ((_ data: SoundList?,_ error: Error?) -> Void)) {
        searchTextWithRequestBuilder(filter: filter, page: page).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

}

extension ActualSearchApi {
    
    public enum Sort_searchText: String {
        case score = "score"
        case durationDesc = "duration_desc"
        case durationAsc = "duration_asc"
        case createdDesc = "created_desc"
        case createdAsc = "created_asc"
        case downloadsDesc = "downloads_desc"
        case downloadsAsc = "downloads_asc"
        case ratingDesc = "rating_desc"
        case ratingAsc = "rating_asc"
    }
    
    open func searchTextWithRequestBuilder(query: String? = nil, filter: String? = nil, sort: Sort_searchText? = nil, groupByPack: Int? = nil, page: Int? = nil, pageSize: Int? = nil) -> RequestBuilder<SoundList> {
        let path = "/search/text/"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "query": query,
            "filter": filter,
            "sort": sort?.rawValue,
            "group_by_pack": groupByPack?.encodeToJSON(),
            "page": page?.encodeToJSON(),
            "page_size": pageSize?.encodeToJSON(),
            "token": "f90ZvCwTwPxBOewsaE6fw9BZRALYpw5986bAXOn0"
        ])

        let requestBuilder: RequestBuilder<SoundList>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
}

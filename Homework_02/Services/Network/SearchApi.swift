//
//  SearchApi.swift
//  Homework_02
//
//  Created by Олег Мишкин on 05.05.2021.
//

protocol SearchApi : AnyObject {
    
    func searchText(filter: String?, page: Int?, completion: @escaping ((_ data: SoundList?,_ error: Error?) -> Void))
    
}

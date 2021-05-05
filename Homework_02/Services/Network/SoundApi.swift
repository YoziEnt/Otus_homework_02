//
//  SoundApi.swift
//  Homework_02
//
//  Created by Олег Мишкин on 05.05.2021.
//

protocol SoundApi : AnyObject {
    
    func getSoundById(soundId: Int64, completion: @escaping ((_ data: Sound?,_ error: Error?) -> Void))
    
}

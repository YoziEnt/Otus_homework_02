//
//  ServicesLocator.swift
//  Homework_02
//
//  Created by Олег Мишкин on 01.05.2021.
//

class Services {
    
    private static var assemblages: [String : Any] = [:]
    
    static func add<Service>(_ service: Service.Type, injection: InjectionType = .none, assembly: @escaping () -> Service) {
        let identifier = String(describing: type(of: service))
        assemblages[identifier] = (injection == .none)
            ? assembly
            : unwrapAssembly(from: assembly)
    }
    
    private static func unwrapAssembly<Service>(from assembly: () -> Service) -> Service { assembly() }
    
    static func inject<Service>(_ service: Service.Type) throws -> Service  {
        let identifier = String(describing: type(of: service))
        guard let assembly = assemblages[identifier] else { throw Exception() }
        if let service = (assembly as? Service) { return service }
        if let service = (assembly as? () -> Service) { return service() }
        throw Exception()
    }
    
    enum InjectionType {
        case none
        case singleton
    }
    
}

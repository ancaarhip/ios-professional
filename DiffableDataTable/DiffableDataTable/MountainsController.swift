//
//  MountainsService.swift
//  DiffableDataTable
//
//  Created by Anca Arhip on 25.10.2022.
//

import Foundation

struct MountainsController {
    struct Mountain: Hashable {
        let name: String
        let height: Int
        let identifier = UUID()
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(identifier)
        }
        
        static func == (lhs: Mountain, rhs: Mountain) -> Bool {
            return lhs.identifier == rhs.identifier
        }
    }
    
    func getMountains(filter: String) -> [Mountain] {
        var mutatingSelf = self
        return mutatingSelf.mountains.filter { filter.isEmpty || $0.name.contains(filter) }
    }
    
    private lazy var mountains: [Mountain] = {
        return generateMountains()
    }()
    
    private func generateMountains() -> [Mountain] {
        let components = mountainsRawData.components(separatedBy: CharacterSet.newlines)
        var mountains: [Mountain] = []
        
        for line in components {
            let mountainComponents = line.components(separatedBy: ",")
            let name = mountainComponents[0]
            let height = Int(mountainComponents[1])
            mountains.append(Mountain(name: name, height: height ?? 0))
        }
        return mountains
    }
}


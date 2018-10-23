//
//  StringExtension.swift
//  Series
//
//  Created by Ricardo Desiderio on 10/20/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation


/*
 Está extensión de String nos permite eliminar los características html de una cadena
 -Por ejemplo "<p/> Hola mundo </p>" -> "Hola mundo"
 */
extension String {
    
    func clearTags() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
    }
    
}

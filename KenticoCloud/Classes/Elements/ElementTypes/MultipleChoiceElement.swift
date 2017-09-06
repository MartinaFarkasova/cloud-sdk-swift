//
//  MultipleChoiceElement.swift
//  Pods
//
//  Created by Martin Makarsky on 04/09/2017.
//
//

import ObjectMapper

public class MultipleChoiceElement: Mappable {
    public private(set) var type: String?
    public private(set) var name: String?
    public private(set) var value: [MultipleChoice]?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        var elementName = ""
        if let context = map.context as? ElementContext {
            elementName = context.elementName
        }
        
        type <- map["elements.\(elementName).type"]
        name <- map["elements.\(elementName).name"]
        value <- map["elements.\(elementName).value"]
    }
}

//
//  MessageDocument.swift
//  FileDocumentTest
//
//  Created by profesor on 16/11/22.
//

import SwiftUI
import UniformTypeIdentifiers

struct MessageDocument: FileDocument{
    
    static var readableContentTypes: [UTType] {[.plainText]}
    
    var message: String
    
    // Main constructor:
    
    init(message: String){
        self.message = message
    }
    
    //Set configuration:
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else{
            throw CocoaError(.fileReadCorruptFile)
        }
        message = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: message.data(using: .utf8)!)
    }
}

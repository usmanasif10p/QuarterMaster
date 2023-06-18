import Foundation

final public class File {
    
    // MARK: - Reading a File
    
    public static func read(atPath path: String) -> String? {
        do {
            let contents = try String(contentsOfFile: path, encoding: .utf8)
            return contents
        } catch {
            print("Error reading file: \(error)")
            return nil
        }
    }

    public static func readFile(atPath path: String) -> Any? {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            if let data = fileManager.contents(atPath: path) {
                if let object = try? JSONSerialization.jsonObject(with: data, options: []) {
                    return object
                } else if let string = String(data: data, encoding: .utf8) {
                    return string
                }
            }
            print("Failed to read file at path: \(path)")
            return nil
        } else {
            print("File does not exist at path: \(path)")
            return nil
        }
    }
        
    public static func readJson<T: Codable>(fileName: String) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
//    public static func readPlist<T: Codable>(fileName: String) -> T? {
//        if let url = Bundle.main.url(forResource: fileName, withExtension: "plist") {
//            do {
//                let data = try Data(contentsOf: url)
//                let plistData = PropertyListSerialization.propertyList(from: <#T##Data#>, format: <#T##UnsafeMutablePointer<PropertyListSerialization.PropertyListFormat>?#>) data(fromPropertyList: <#T##Any#>, format: <#T##PropertyListSerialization.PropertyListFormat#>, options: <#T##PropertyListSerialization.WriteOptions#>)
//            }
//        }
//        return nil
//    }
    
    // MARK: - Writing to a File

    public static func write(atPath path: String, contents: String) {
        do {
            try contents.write(toFile: path, atomically: true, encoding: .utf8)
            print("File written successfully.")
        } catch {
            print("Error writing file: \(error)")
        }
    }

    // MARK: - Copying a File

    public static func copy(atPath sourcePath: String, toPath destinationPath: String) {
        let fileManager = FileManager.default
        do {
            try fileManager.copyItem(atPath: sourcePath, toPath: destinationPath)
            print("File copied successfully.")
        } catch {
            print("Error copying file: \(error)")
        }
    }

    // MARK: - Moving a File

    public static func move(atPath sourcePath: String, toPath destinationPath: String) {
        let fileManager = FileManager.default
        do {
            try fileManager.moveItem(atPath: sourcePath, toPath: destinationPath)
            print("File moved successfully.")
        } catch {
            print("Error moving file: \(error)")
        }
    }

}

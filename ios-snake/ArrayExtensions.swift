
extension Array {
    
    func firstOrDefault(element: (T -> Bool)) -> T? {
        var result = filter(element)
        return result.count > 0 ? result[0] : nil
    }
}
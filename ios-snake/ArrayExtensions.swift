
extension Array {
    
    func firstOrDefault(element: (Element -> Bool)) -> Element? {
        var result = filter(element)
        return result.count > 0 ? result[0] : nil
    }
}
public class SomePublicClass {  // explicitly public class
    public var somePublicProperty = 0  // explicitly public class member
    var someInternalProperty = 0  // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}  // explicitly private class member
}

class SomeInternalClass {  // implicitly internal class
    var someInternalProperty = 0  // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}  // explicitly private class member
}

private class SomeFilePrivateClass {  // explicitly file-private class
    func someFilePrivateMethod() {}  // implicitly file-private class member
    private func somePrivateMethod() {}  // explicitly private class member
}

private class SomePrivateClass {  // explicitly private class
    func somePrivateMethod() {}  // implicitly private class member
}

private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
    return (SomeInternalClass(), SomePrivateClass())
}

public class A {
    fileprivate func someMethod() {}
}

// upgrade access level for a subclass and call a super class method that is lower level than subclass method
internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

do {
    struct TrackedString {
        private(set) var numberOfEdits = 0
        var value: String = "" {
            didSet {
                numberOfEdits += 1
            }
        }
    }
    var stringToEdit = TrackedString()
    stringToEdit.value = "This string will be tracked."
    stringToEdit.value += " This edit will increment numberOfEdits."
    stringToEdit.value += " So will this one."
    print("The number of edits is \(stringToEdit.numberOfEdits)")
}

public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}

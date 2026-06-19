// Opaque and Boxed Protocol Types
protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }

}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())
print(String(repeating: "-", count: 20))

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())
print(String(repeating: "-", count: 20))

struct JoinedShape<T: Shape, U: Shape>: Shape {
    let top: T
    let bottom: U

    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}

let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())
print(String(repeating: "-", count: 20))

struct Square: Shape {
    var size: Int
    func draw() -> String {
        return [String](repeating: String(repeating: "*", count: size), count: size).joined(
            separator: "\n")
    }
}

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    return JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
}
let trapezoid = makeTrapezoid()
print(trapezoid.draw())
print(String(repeating: "-", count: 20))

func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    return JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())

func `repeat`<T: Shape>(shape: T, count: Int) -> some Collection {
    return [T](repeating: shape, count: count)
}

// Boxed Protocol Types

struct VerticalShapes: Shape {
    var shapes: [any Shape]

    func draw() -> String {
        return shapes.map { $0.draw() }.joined(separator: "\n\n")
    }
}
let largeTriangle = Triangle(size: 5)
let largeSquare = Square(size: 5)
let vertical = VerticalShapes(shapes: [largeTriangle, largeSquare])
print(vertical.draw())

if let downcastTriangle = vertical.shapes[0] as? Triangle {
    print(downcastTriangle.size)
}

func protoFlip<T: Shape>(_ shape: T) -> Shape {
    if shape is Square {
        return shape
    }

    return FlippedShape(shape: shape)
}
let protoFlippedTriangle1 = protoFlip(smallTriangle)
let protoFlippedTriangle2 = protoFlip(smallTriangle)
// if protoFlippedTriangle1 == protoFlippedTriangle2 {
//     print(" protoFlippedTriangle1 is protoFlippedTriangle2 ")
// } else {
//     print(" protoFlippedTriangle1 is not protoFlippedTriangle2 ")
// }

protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
extension Array: Container {}

func makeProtocolContainer<T>(item: T) -> any Container {
    return [item]
}

func makeOpaqueContainer<T>(item: T) -> some Container {
    return [item]
}
let opaqueContainer = makeOpaqueContainer(item: 12)
let twelve = opaqueContainer[0]
print(type(of: twelve))


// Opaque Parameter Types
func drawTwiceGeneric<SomeShape: Shape>(_ shape: SomeShape) -> String {
    let drawn = shape.draw()
    return drawn + "\n" + drawn
}

func drawTwiceSome(_ shape: some Shape) -> String {
    let drawn = shape.draw()
    return drawn + "\n" + drawn
}

func combine(shape s1: some Shape, with s2: some Shape) -> String {
    return s1.draw() + "\n" + s2.draw()
}
print(combine(shape: smallTriangle, with: trapezoid))
do {
    class Student {
        var name: String
        var age: Int
        init(name: String, age: Int) {
            self.name = name
            self.age = age
        }
    }
    let student1 = Student(name: "张三", age: 18)
    let student2 = student1
    student2.age = 20
    print("student1 age\(student1.age)")
    print("student2 age\(student2.age)")

    struct Teacher {
        var name: String
        var age: Int
    }
    let teacher1 = Teacher(name: "Mr.Li", age: 30)
    var teacher2 = teacher1
    teacher2.age = 40
    print("teacher1 age\(teacher1.age)")
    print("teacher2 age\(teacher2.age)")
}
//
do {
    class Contact {
        var name: String
        var phone: String
        var gender: String
        var address: String

        init(name: String, phone: String, gender: String, address: String) {
            self.name = name
            self.phone = phone
            self.gender = gender
            self.address = address
        }
    }
    let contact = Contact(name: "张三", phone: "123456789", gender: "男", address: "北京")
    let colleagueCopy = contact  // 同事看到的联系人
    colleagueCopy.phone = "987654321"  // 同事发来更新

    class AddressBook {
        var contacts: [Contact] = []

        func add(contact: Contact) {
            contacts.append(contact)
        }

        func listAll() {
            for contact in contacts {
                print("名字：\(contact.name)，电话：\(contact.phone)")
            }
        }
        func findContactByName(name: String) -> Contact? {
            return contacts.first(where: { contact in
                return contact.name == name
            })
        }
    }

    let myAddressBook = AddressBook()
    let listViewController = myAddressBook
    let addViewController = myAddressBook
    let alice = Contact(name: "Alice", phone: "111", gender: "女", address: "上海")
    addViewController.add(contact: alice)
    let bob = Contact(name: "Bob", phone: "222", gender: "男", address: "上海")
    listViewController.add(contact: bob)
    listViewController.listAll()
    if let person = listViewController.findContactByName(name: "Bob") {
        print("\(person.name)")
    }

}

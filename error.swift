import Foundation

struct Contact {
    var name: String
    var phone: String
    var email: String
}

class ContactManager {
    private var contacts: [Contact] = []

    func addContact(name: String, phone: String, email: String) {
        let contact = Contact(name: name, phone: phone, email: email)
        contacts.append(contact)
        print("Contact added: \(name)")
    }

    func listContacts() {
        print("\n--- Contact List ---")
        if contacts.isEmpty {
            print("No contacts available.")
        } else {
            for (index, contact) in contacts.enumerated() {
                print("\(index + 1). \(contact.name) | \(contact.phone) | \(contact.email)")
            }
        }
    }

    func searchContact(byName name: String) {
        print("\nSearching for contact with name: \(name)")
        let found = contacts.filter { $0.name.lowercased().contains(name.lowercased()) }
        if found.isEmpty {
            print("No contact found with that name.")
        } else {
            for contact in found {
                print("Found: \(contact.name) | \(contact.phone) | \(contact.email)")
            }
        }
    }

    func deleteContact(byName name: String) {
        if let index = contacts.firstIndex(where: { $0.name.lowercased() == name.lowercased() }) {
            print("Deleted contact: \(contacts[index].name)")
            contacts.remove(at: index)
        } else {
            print("Contact not found.")
        }
    }

    func updateContact(oldName: String, newName: String?, newPhone: String?, newEmail: String?) {
        if let index = contacts.firstIndex(where: { $0.name.lowercased() == oldName.lowercased() }) {
            if let name = newName {
                contacts[index].name = name
            }
            if let phone = newPhone {
                contacts[index].phone = phone
            }
            if let email = newEmail {
                contacts[index].email = email
            }
            print("Contact updated.")
        } else {
            print("Contact not found.")
        }
    }
}

func displayMenu() {
    print("""
    
    \n======= Contact Manager =======
    1. Add Contact
    2. List Contacts
    3. Search Contact
    4. Delete Contact
    5. Update Contact
    6. Exit
    Enter your choice:
    """)
}

let manager = ContactManager()
var shouldContinue = true

while shouldContinue {
    displayMenu()
    if let choice = readLine() {
        switch choice {
        case "1":
            print("Enter name:")
            let name = readLine() ?? ""
            print("Enter phone:")
            let phone = readLine() ?? ""
            print("Enter email:")
            let email = readLine() ?? ""
            manager.addContact(name: name, phone: phone, email: email)
        case "2":
            manager.listContacts()
        case "3":
            print("Enter name to search:")
            let name = readLine() ?? ""
            manager.searchContact(byName: name)
        case "4":
            print("Enter name to delete:")
            let name = readLine() ?? ""
            manager.deleteContact(byName: name)
        case "5":
            print("Enter existing contact name:")
            let oldName = readLine() ?? ""
            print("Enter new name (or press enter to skip):")
            let newName = readLine()
            print("Enter new phone (or press enter to skip):")
            let newPhone = readLine()
            print("Enter new email (or press enter to skip):")
            let newEmail = readLine()
            manager.updateContact(oldName: oldName, newName: newName, newPhone: newPhone, newEmail: newEmail)
       
          
    }
}

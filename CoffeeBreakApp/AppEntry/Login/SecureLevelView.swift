import SwiftUI
import Combine

struct SecureLevelView : View {
    var level: PasswordStrengthLevel

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[0]).frame(height: 10)
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[1]).frame(height: 10)
            RoundedRectangle(cornerRadius: 8).foregroundColor(self.getColors()[2]).frame(height: 10)
        } // end HStack
    } // end body

    func getColors() -> [Color] {
        switch self.level {
        case .none:
            return [.clear, .clear, .clear]
        case .weak:
            return [.red, .clear, .clear]
        case .decent:
            return [.red, .orange, .clear]
        case .strong:
            return [.red, .orange, .green]
        } // end switch
    } // end function getColors
} // end struct


struct SecureLevelView_Previews : PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

class PasswordChecker: ObservableObject {
    public let didChange = PassthroughSubject<PasswordChecker, Never>()
@Published var password: String = ""
    
    
    // {
//         didSet {
//             self.checkForPassword(password: self.password)
//         }
//     }

   var level: PasswordStrengthLevel = .none {
        didSet {
            self.didChange.send(self)
        }
    }

    func checkForPassword(password: String) {
        if password.count == 0 {
            self.level = .none
        } else if password.count < 2 {
            self.level = .weak
        } else if password.count < 6 {
            self.level = .decent
        } else {
            self.level = .strong
        }
    }
} // end class


enum PasswordStrengthLevel: Int {
    case none = 0
    case weak = 1
    case decent = 2
    case strong = 3
}

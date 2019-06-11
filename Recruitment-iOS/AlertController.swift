import UIKit

final class AlertController {
    static func showAlert(on controller: UIViewController, title: String? = nil, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title ?? CommonStrings.problem, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: CommonStrings.ok, style: .default, handler: completion)
        alert.addAction(confirm)
        controller.present(alert, animated: true)
    }
}

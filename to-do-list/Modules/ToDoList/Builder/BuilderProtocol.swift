import UIKit

protocol BuilderProtocol: AnyObject {
    
    static func build() -> UIViewController
}

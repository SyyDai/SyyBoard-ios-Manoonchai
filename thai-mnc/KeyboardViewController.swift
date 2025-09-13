//
//  Created by Saamkhaih Kyakya on 11/9/25.
//

import UIKit
import WebKit

class KeyboardViewController: UIInputViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var nextKeyboardButton: UIButton!
    private var registration: UITraitChangeRegistration?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup configuration with JS handler
        let config = WKWebViewConfiguration()
        config.userContentController.add(self, name: "keyHandler")

        webView = WKWebView(frame: .zero, configuration: config)
        webView!.backgroundColor = .clear
        webView!.isOpaque = false
        webView!.translatesAutoresizingMaskIntoConstraints = false
        webView!.scrollView.backgroundColor = .clear
        webView.scrollView.isOpaque = false
        webView.navigationDelegate = self
        view.addSubview(webView)

        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        nextKeyboardButton = UIButton(type: .system)
        let globeImage = UIImage(systemName: "globe")
        nextKeyboardButton.setImage(globeImage, for: .normal)
        nextKeyboardButton.tintColor = .label
        nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        nextKeyboardButton.addTarget(self,
                                     action: #selector(handleInputModeList(from:with:)),
                                     for: .allTouchEvents)
        view.addSubview(nextKeyboardButton)

        if UIDevice.current.userInterfaceIdiom == .phone {
            nextKeyboardButton.isHidden = true
        } else {
            nextKeyboardButton.isHidden = false
        }
        
        NSLayoutConstraint.activate([
            nextKeyboardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            nextKeyboardButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -6),
            nextKeyboardButton.widthAnchor.constraint(equalToConstant: 34),
            nextKeyboardButton.heightAnchor.constraint(equalToConstant: 34)
        ])

        if let htmlPath = Bundle.main.path(forResource: "index", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let baseURL = url.deletingLastPathComponent()
            webView.loadFileURL(url, allowingReadAccessTo: baseURL)
        }
        
    }
    
    override func updateViewConstraints() {
            super.updateViewConstraints()

            let height: CGFloat = 128
            if let heightConstraint = view.constraints.first(where: { $0.identifier == "keyboardHeight" }) {
                heightConstraint.constant = height
            } else {
                let heightConstraint = view.heightAnchor.constraint(equalToConstant: height)
                heightConstraint.identifier = "keyboardHeight"
                heightConstraint.isActive = true
            }
        }

    private func applyTheme() {
        let style: String
        style = (traitCollection.userInterfaceStyle == .dark) ? "dark" : "light"

        let js = """
        document.documentElement.setAttribute('data-theme', '\(style)');
        if (window.updateTheme) { window.updateTheme(); }
        """
        webView.evaluateJavaScript(js, completionHandler: nil)
    }

   
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        applyTheme()
    }
}

// MARK: - WKScriptMessageHandler
extension KeyboardViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        guard let text = message.body as? String else { return }

        switch text {
        case "__DELETE__":
            textDocumentProxy.deleteBackward()
        case "__LEFT__":
            textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
        case "__RIGHT__":
            textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
        case "__SPACE__":
            textDocumentProxy.insertText(" ")
        case "__LANG__":
            advanceToNextInputMode()
        case "__RETURN__":
            textDocumentProxy.insertText("\n")
        default:
            textDocumentProxy.insertText(text)
        }
    }
}

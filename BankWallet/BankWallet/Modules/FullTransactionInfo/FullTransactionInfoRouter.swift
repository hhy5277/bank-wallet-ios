import UIKit

class FullTransactionInfoRouter {
    weak var viewController: UINavigationController?
    private var urlManager: IUrlManager

    init(urlManager: IUrlManager) {
        self.urlManager = urlManager
    }
}


extension FullTransactionInfoRouter: IFullTransactionInfoRouter {

    func openProviderSettings(coin: Coin, transactionHash: String) {
        let vc = DataProviderSettingsRouter.module(for: coin, transactionHash: transactionHash)
        viewController?.pushViewController(vc, animated: true)
    }

    func open(url: String?) {
        guard let url = url else {
            return
        }
        urlManager.open(url: url, from: viewController)
    }

    func share(value: String) {
        let vc = UIActivityViewController(activityItems: [value], applicationActivities: [])
        viewController?.present(vc, animated: true, completion: nil)
    }

    func close() {
        viewController?.dismiss(animated: true)
    }

}

extension FullTransactionInfoRouter {

    static func module(transactionHash: String, coin: Coin) -> UIViewController {
        let router = FullTransactionInfoRouter(urlManager: App.shared.urlManager)

        let interactor = FullTransactionInfoInteractor(providerFactory: App.shared.fullTransactionInfoProviderFactory, reachabilityManager: App.shared.reachabilityManager, dataProviderManager: App.shared.dataProviderManager, pasteboardManager: App.shared.pasteboardManager)
        let state = FullTransactionInfoState(coin: coin, transactionHash: transactionHash)
        let presenter = FullTransactionInfoPresenter(interactor: interactor, router: router, state: state)
        let viewController = FullTransactionInfoViewController(delegate: presenter)

        interactor.delegate = presenter
        presenter.view = viewController

        let navigationController = WalletNavigationController(rootViewController: viewController)
        router.viewController = navigationController
        return navigationController
    }

}

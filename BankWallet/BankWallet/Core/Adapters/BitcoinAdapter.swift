import HSBitcoinKit
import RxSwift

class BitcoinAdapter: BitcoinBaseAdapter {
    private let feeRateProvider: IFeeRateProvider

    init?(coin: Coin, authData: AuthData, newWallet: Bool, addressParser: IAddressParser, feeRateProvider: IFeeRateProvider, testMode: Bool) {
        self.feeRateProvider = feeRateProvider

        let network: BitcoinKit.Network = testMode ? .testNet : .mainNet

        super.init(coin: coin, kitCoin: .bitcoin(network: network), authData: authData, newWallet: newWallet, addressParser: addressParser)
    }

    override func feeRate(priority: FeeRatePriority) -> Int {
        return feeRateProvider.bitcoinFeeRate(for: priority)
    }

}

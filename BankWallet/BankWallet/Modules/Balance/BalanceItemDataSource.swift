import Foundation

class BalanceItemDataSource {
    var items = [BalanceItem]()
    var currency: Currency?

    var count: Int {
        return items.count
    }

    var coinCodes: [CoinCode] {
        return items.map { $0.coin.code }
    }

    func item(at index: Int) -> BalanceItem {
        return items[index]
    }

    func index(for coinCode: CoinCode) -> Int? {
        return items.firstIndex(where: { $0.coin.code == coinCode })
    }

    func set(balance: Decimal, index: Int) {
        items[index].balance = balance
    }

    func set(state: AdapterState, index: Int) {
        items[index].state = state
    }

    func set(rate: Rate, index: Int) {
        items[index].rate = rate
    }

    func clearRates() {
        for i in 0..<items.count {
            items[i].rate = nil
        }
    }

}

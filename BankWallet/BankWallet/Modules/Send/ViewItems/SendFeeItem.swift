import GrouviActionSheet

class SendFeeItem: BaseActionItem {

    var bindFee: ((String?) -> ())?
    var bindConvertedFee: ((String?) -> ())?
    var bindError: ((String?) -> ())?
    var isFeeAdjustable: Bool

    var onFeePriorityChange: ((Int) -> ())?

    init(tag: Int, isFeeAdjustable: Bool = true) {
        self.isFeeAdjustable = isFeeAdjustable

        super.init(cellType: SendFeeItemView.self, tag: tag, required: true)

        showSeparator = false
        height = isFeeAdjustable ? SendTheme.feeHeight : SendTheme.constantFeeHeight
    }

}

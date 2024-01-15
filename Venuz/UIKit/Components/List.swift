public protocol ListCellController {
    func list(_ list: List, createListCellAtIndexPath indexPath: IndexPath) -> ReusableListCell
    func list(_ list: List, didSelectRowAt indexPath: IndexPath)
}

public extension ListCellController {
    func list(_ list: List, didSelectRowAt indexPath: IndexPath) {
        list.deselectRow(at: indexPath, animated: true)
    }
}

public protocol ListHeaderController {
    func list(_ list: List, createListHeaderAtSection section: Int) -> ListHeader?
    func list(_ list: List, heightForHeaderInSection section: Int) -> CGFloat
}

public extension ListHeaderController {
    func list(_ list: List, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
}

open class ListHeader: View {}

public protocol Reusable {
    static var identifier: String { get }
}

public extension Reusable {
    static var identifier: String {
        String(describing: self)
    }
}

public typealias ReusableListCell = UITableViewCell & Reusable

open class ListCell: ReusableListCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setBackgroundColor(theme.token.color.transparent)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}

public class ListSection {
    let headerController: ListHeaderController
    let cellsControllers: [ListCellController]
    
    public init(headerController: ListHeaderController, cellsControllers: [ListCellController]) {
        self.headerController = headerController
        self.cellsControllers = cellsControllers
    }
}

open class List: UITableView {
    
    private var listSections = [ListSection]()
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        delegate = self
        dataSource = self
        
        tableHeaderView = nil
        tableFooterView = nil
        
        delaysContentTouches = false
        canCancelContentTouches = true
        
        separatorStyle = .none
        
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = 0
        }
        
        setBackgroundColor(theme.token.color.transparent)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func update() -> Self {
        reloadData()
        return self
    }
    
    @discardableResult
    public func addListSection(_ section: ListSection) -> Self {
        listSections.append(section)
        return update()
    }
    
    @discardableResult
    public func replaceListSections(_ sections: [ListSection]) -> Self {
        listSections = sections
        return update()
    }
    
    @discardableResult
    public func disableScroll() -> Self {
        isScrollEnabled = false
        return update()
    }
    
    @discardableResult
    public func enableScroll() -> Self {
        isScrollEnabled = true
        return update()
    }
    
    private func cell(at indexPath: IndexPath) -> ListCellController {
        listSections[indexPath.section]
            .cellsControllers[indexPath.row]
    }
    
    private func header(at section: Int) -> ListHeaderController {
        listSections[section].headerController
    }
}

extension List: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        listSections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listSections[section].cellsControllers.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell(at: indexPath)
            .list(self, createListCellAtIndexPath: indexPath)
    }
}

extension List: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        header(at: section)
            .list(self, createListHeaderAtSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        header(at: section)
            .list(self, heightForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        nil
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cell(at: indexPath).list(self, didSelectRowAt: indexPath)
    }
}

public extension List {
    func reuse<C: ReusableListCell>(_ CellType: C.Type, at indexPath: IndexPath) -> C {
        let identifier = CellType.identifier
        guard dequeueReusableCell(withIdentifier: identifier) != nil else {
            register(CellType, forCellReuseIdentifier: identifier)
            return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! C
        }
        
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! C
    }
}

public final class NoListHeaderController: ListHeaderController {
    public init() { }
    
    public func list(_ list: List, createListHeaderAtSection section: Int) -> ListHeader? {
        nil
    }
    
    public func list(_ list: List, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
}


public final class SelectListCell: ReusableListCell {
    public struct ViewData {
        let taskCode: String
        let taskDescription: String
        
        public init(taskCode: String, taskDescription: String) {
            self.taskCode = taskCode
            self.taskDescription = taskDescription
        }
    }
    
    private lazy var taskCheckBox = Checkbox()
    private lazy var taskCode = Label(.lg)
    private lazy var taskDescription = Label(.sm)
    private lazy var detailImage = Image(.chevronRight)
        .setScaleAspecToFit()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setBackgroundColor(theme.token.color.transparent)
        
        let textStack = Stack.Vertical(taskCode, taskDescription)
        let containerStack = Stack.Horizontal(spacing: .sm, {
            let content = View()
            content.addSubview(taskCheckBox)
            taskCheckBox.constraintable
                .anchorEqualLeading(atLeading: content)
                .anchorEqualTrailing(atTrailing: content)
                .anchorEqualTop(atTop: content)
            return content
        }(), textStack, detailImage)
        
        contentView.addSubview(containerStack)
        
        detailImage.constraintable.maxWidth(10)
        containerStack.constraintable.fillToParrent(edge: .vertical(.sm))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    @discardableResult
    public func setupViewData(_ viewData: ViewData) -> Self {
        taskCode.setText(viewData.taskCode)
        taskDescription.setText(viewData.taskDescription)
        
        return self
    }
}

public final class SelectListCellController: ListCellController {
    private let viewData: SelectListCell.ViewData
    
    private var selectListCell: SelectListCell!
    
    public init(viewData: SelectListCell.ViewData) {
        self.viewData = viewData
    }
    
    public func list(_ list: List, createListCellAtIndexPath indexPath: IndexPath) -> ReusableListCell {
        selectListCell = SelectListCell()
        selectListCell.setupViewData(viewData)
        selectListCell.selectionStyle = .none
        return selectListCell
    }
}

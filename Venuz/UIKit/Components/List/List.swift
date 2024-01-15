import UIKit

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

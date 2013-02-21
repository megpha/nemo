class ProductsViewController < UITableViewController
  extend IB

  def viewDidLoad
    @resources = []
    view.dataSource = view.delegate = self
  end

  def prepareForSegue(segue, sender: sender)
    segue.destinationViewController.setFilter segue.identifier
  end 

  def viewWillAppear(animated)
    Backend.new.loadProducts do | operation, result |
      @resources = result.array
      tableView.reloadData
    end
  end 

  def tableView(tableView, numberOfRowsInSection:section)
    @resources.length
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= 'ProductCell'

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      ProductViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    product = @resources[indexPath.row]

    cell.setup(product)

    cell
  end

  def prepareForSegue(segue, sender:sender)
    row = tableView.indexPathForSelectedRow
    product = tableView.cellForRowAtIndexPath(row).product
    segue.destinationViewController.product = product
  end
end

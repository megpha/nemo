class OrderViewController < UITableViewController 
  extend IB

  outlet :name, UILabel
  outlet :info, UILabel
  outlet :price, UILabel
  outlet :picture, UIImageView

  def viewDidLoad
  end

  def tableView(tableView, numberOfRowsInSection:section)
    products.length + 1
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    if indexPath.row < products.length
      @reuseIdentifier ||= 'OrderProductCell'

      cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
        UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1, reuseIdentifier:@reuseIdentifier)
      end

      product = products[indexPath.row]
      cell.textLabel.text = product.name
      cell.detailTextLabel.text = product.cost


    else
      @reuseOrderIdentifier ||= 'OrderTotalCell'

      cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
        UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1, reuseIdentifier:@reuseOrderIdentifier)
      end

      cell.textLabel.text = "Total"
      cell.detailTextLabel.text = "$ #{App.delegate.order.total}"
    end

    cell
  end

  def products
    App.delegate.order.products
  end
end

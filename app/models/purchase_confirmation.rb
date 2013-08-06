class PurchaseConfirmation
  def self.create(order)
    items = order.order_items.collect do |oi| 
      {"title" => oi.title, "quantity" => oi.quantity}
    end
    data = {
      "name" => order.user.full_name,
      "email" => order.user.email,
      "items" => items,
      "total" => order.total
    }

    message = {"type" => "purchase_confirmation", "data" => data}
    $redis.publish("email_notifications", message.to_json)

    Mailer.order_confirmation(data).deliver
  end
end
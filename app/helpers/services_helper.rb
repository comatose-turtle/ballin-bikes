module ServicesHelper
  def link_to_remove_line_item(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_line_item(this)", :class => "remove_line_item")
  end
  
  def link_to_add_line_item(name, f)
    new_object = f.object.class.reflect_on_association(:line_items).klass.new
    fields = f.fields_for(:line_items, new_object, :child_index => "new_line_item") do |builder|
      render("line_item_fields", :f => builder)
    end
    link_to_function(name, "add_line_item(this, \"#{escape_javascript(fields)}\")")
  end
end

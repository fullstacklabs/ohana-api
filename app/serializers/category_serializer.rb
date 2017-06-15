class CategorySerializer < ActiveModel::Serializer
  attributes :id, :depth, :taxonomy_id, :name, :parent_id, :children

  def children
    ActiveModel::ArraySerializer.new(self.object.children, each_serializer: CategorySerializer).as_json
  end

end

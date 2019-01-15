ProductType = GraphQL::ObjectType.define do
    name 'ProductType'
    description 'The Product type'

    field :id, !types.ID
    field :title, !types.String
    field :price, !types.Float
    field :inventory_count, !types.Int
end
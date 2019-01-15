module Types
  class QueryType < Types::BaseObject
      # Add root-level fields here.
      # They will be entry points for queries on your schema.

    field :products, !types[Types::ProductType] do
      resolve -> (obj, args, ctx) { Product.all } 
    end
  end
end

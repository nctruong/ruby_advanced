# map json or make model, let's use virtus gem
class Address
  include Virtus.model

  attribute :address,     String
  attribute :locality,    String
  attribute :region,      String
  attribute :postal_code, String
end
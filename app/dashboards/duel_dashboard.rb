require "administrate/base_dashboard"

class DuelDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    player_one: Field::BelongsTo.with_options(class_name: "User"),
    player_two: Field::BelongsTo.with_options(class_name: "User"),
    users: Field::HasMany,
    id: Field::Number,
    status: Field::Number,
    starting_lp: Field::Number,
    player_one_lp: Field::Number,
    player_two_lp: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    ended_at: Field::DateTime,
    player_one_id: Field::Number,
    player_two_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :player_one,
    :player_two,
    :users,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :player_one,
    :player_two,
    :users,
    :id,
    :status,
    :starting_lp,
    :player_one_lp,
    :player_two_lp,
    :created_at,
    :updated_at,
    :ended_at,
    :player_one_id,
    :player_two_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :player_one,
    :player_two,
    :users,
    :status,
    :starting_lp,
    :player_one_lp,
    :player_two_lp,
    :ended_at,
    :player_one_id,
    :player_two_id,
  ].freeze

  # Overwrite this method to customize how duels are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(duel)
  #   "Duel ##{duel.id}"
  # end
end

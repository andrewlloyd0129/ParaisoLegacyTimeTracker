require "administrate/base_dashboard"

class TaskEntryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    time_entry: Field::BelongsTo,
    task: Field::BelongsTo,
    job: Field::BelongsTo,
    id: Field::Number,
    start_time: Field::DateTime,
    end_time: Field::DateTime,
    time_entries_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :time_entry,
    :task,
    :job,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :time_entry,
    :task,
    :job,
    :id,
    :start_time,
    :end_time,
    :time_entries_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :time_entry,
    :task,
    :job,
    :start_time,
    :end_time,
    :time_entries_id,
  ].freeze

  # Overwrite this method to customize how task entries are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(task_entry)
  #   "TaskEntry ##{task_entry.id}"
  # end
end

# User

## association
- has_and_belongs_to_many :groups

## table
- name         :string, null: false
- email        :string, null: false, unique: true
- password     :string, null: false
- created_at
- updated_at


# Group

## association
- has_and_belongs_to_many :users
- has_many :messages

## table
- group_name     :string, null: false
- user           :references
- created_at
- updated_at


# Groups_Users

## table
- user         :references
- group        :references


# Message

## association
- belongs_to :group

## table
- body         :text
- image        :string
- group        :references
- created_at
- updated_at

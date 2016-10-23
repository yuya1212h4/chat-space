# User
- has_many :messages

## association
- has_and_belongs_to_many :groups

## columns
- name         :string, null: false
- email        :string, null: false, unique: true
- password     :string, null: false
- created_at
- updated_at


# Group

## association
- has_and_belongs_to_many :users
- has_many :messages

## columns
- name           :string, null: false
- user           :references
- created_at
- updated_at


# Groups_Users

## columns
- user         :references
- group        :references


# Message

## association
- belongs_to :user
- belongs_to :group

## columns
- body         :text
- image        :string
- user         :references
- group        :references
- created_at
- updated_at
